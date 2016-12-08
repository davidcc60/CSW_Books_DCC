using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CSW_BOOKS_DCC.Models;

namespace CSW_BOOKS_DCC.Controllers
{
    public class HomeController : Controller
    {
        PublishersController pc = new PublishersController();
        CategoriesController ca = new CategoriesController();
        BooksController bc = new BooksController();
        AuthorsController ac = new AuthorsController();
        public ActionResult Index()
        {
            setViewBag();

            return View(bc.GetBook().FirstOrDefault());
        }

        public ActionResult SearchBooks(string isbn, int publisher, int category, string filter = "no")
        {
            setViewBag();

            if (filter == "no")
            {
                return View(bc.getBookFiltered(isbn, publisher, category));
            }
            else {
                return View(bc.GetBook().ToList());
            }
        }

        private void setViewBag() {
            ViewBag.MoreBooks = bc.getRandomBooks();
            ViewBag.Publishers = pc.GetPublisher();
            ViewBag.Categories = ca.GetCategory();
            ViewBag.Authors = ac.GetAuthor();
        }

        public async System.Threading.Tasks.Task<ActionResult> AddBooks(string isbn, string title, int year, int publisher, int author, int category)
        {
            Book b = new Book();
            b.ISBN = isbn;
            b.Title = title;
            b.Edition = 1;
            b.IdPublisher = publisher;
            b.Year = year;
            await bc.PostBook(b, author, category);

            return RedirectToAction("Index");
        }

        public async System.Threading.Tasks.Task<ActionResult> AddAuthors(string author)
        {
            Author a = new Author();
            a.AuthorName = author;
            await ac.PostAuthor(a);

            return RedirectToAction("Index");
        }

        public async System.Threading.Tasks.Task<ActionResult> AddCategories(string category)
        {
            Category c = new Category();
            c.CategoryName = category;
            await ca.PostCategory(c);

            return RedirectToAction("Index");
        }

        public async System.Threading.Tasks.Task<ActionResult> AddPublishers(string publisher)
        {
            Publisher p = new Publisher();
            p.PublisherName = publisher;
            await pc.PostPublisher(p);

            return RedirectToAction("Index");
        }
    }
}
