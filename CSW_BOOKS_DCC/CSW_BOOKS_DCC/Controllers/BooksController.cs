using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using CSW_BOOKS_DCC.Models;

namespace CSW_BOOKS_DCC.Controllers
{
    public class BooksController : ApiController
    {
        private CSW_BooksEntities db = new CSW_BooksEntities();

        // GET: api/Books
        public IQueryable<Book> GetBook()
        {
            return db.Book;
        }

        // GET: api/Books/5
        [ResponseType(typeof(Book))]
        public async Task<IHttpActionResult> GetBook(string id)
        {
            Book book = await db.Book.FindAsync(id);
            if (book == null)
            {
                return NotFound();
            }

            return Ok(book);
        }

        // GET: api/Books
        public IQueryable<Book> GetBookByAuthor(string author)
        {
            return db.Rel_BookAuthor.Where(w=>w.Author.AuthorName.Contains(author)).Select(s=>s.Book);
        }

        // GET: api/Books
        public IQueryable<Book> GetBookByCat(string category)
        {
            return db.Rel_BookCategory.Where(w => w.Category.CategoryName.Contains(category)).Select(s => s.Book);
        }

        public List<Book> getBookFiltered(string isbn, int publisher, int category) { 
            List<Book> list = new List<Book>();

            if (!string.IsNullOrEmpty(isbn))
            {
                var bookTemp = db.Book.Where(w => w.ISBN == isbn || w.Title.Contains(isbn));
                foreach (Book b in bookTemp)
                {
                    if (list.Where(w => w.ISBN == b.ISBN).Count() == 0)
                        list.Add(b);
                }

                foreach (Book b in GetBookByAuthor(isbn))
                {
                    if (list.Where(w => w.ISBN == b.ISBN).Count() == 0)
                        list.Add(b);
                }
            }
            if (publisher > 0)
            {
                var bookTemp = db.Book.Where(w => w.IdPublisher == publisher);
                foreach (Book b in bookTemp)
                {
                    if (list.Where(w => w.ISBN == b.ISBN).Count() == 0)
                        list.Add(b);
                }
            }
            if (category > 0)
            {
                foreach (Book b in GetBookByCat(db.Category.FirstOrDefault(f=>f.IdCategory==category).CategoryName))
                {
                    if (list.Where(w => w.ISBN == b.ISBN).Count() == 0)
                        list.Add(b);
                }
            }
            return list;
        }

        public List<string> getRandomBooks()
        {
            List<string> listBooks = new List<string>();

            foreach (Book b in GetBook())
            {
                listBooks.Add("Images/" + b.Img);

                if (listBooks.Count == 10) break;
            }

            return listBooks;
        }

        // PUT: api/Books/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutBook(string id, Book book)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != book.ISBN)
            {
                return BadRequest();
            }

            db.Entry(book).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BookExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Books
        [ResponseType(typeof(Book))]
        public async Task<IHttpActionResult> PostBook(Book book, int author, int cat)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Book.Add(book);

            db.Rel_BookAuthor.Add(new Rel_BookAuthor() { IdAuthor = author, ISBN = book.ISBN });
            db.Rel_BookCategory.Add(new Rel_BookCategory() { IdCategory = cat, ISBN = book.ISBN });

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (BookExists(book.ISBN))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = book.ISBN }, book);
        }

        // DELETE: api/Books/5
        [ResponseType(typeof(Book))]
        public async Task<IHttpActionResult> DeleteBook(string id)
        {
            Book book = await db.Book.FindAsync(id);
            if (book == null)
            {
                return NotFound();
            }

            db.Book.Remove(book);
            await db.SaveChangesAsync();

            return Ok(book);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool BookExists(string id)
        {
            return db.Book.Count(e => e.ISBN == id) > 0;
        }
    }
}