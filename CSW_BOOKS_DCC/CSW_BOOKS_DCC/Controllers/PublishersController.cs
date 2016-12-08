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
    public class PublishersController : ApiController
    {
        private CSW_BooksEntities db = new CSW_BooksEntities();

        // GET: api/Publishers
        public IQueryable<Publisher> GetPublisher()
        {
            return db.Publisher;
        }

        // GET: api/Publishers/5
        [ResponseType(typeof(Publisher))]
        public async Task<IHttpActionResult> GetPublisher(int id)
        {
            Publisher publisher = await db.Publisher.FindAsync(id);
            if (publisher == null)
            {
                return NotFound();
            }

            return Ok(publisher);
        }

        // PUT: api/Publishers/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutPublisher(int id, Publisher publisher)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != publisher.IdPublisher)
            {
                return BadRequest();
            }

            db.Entry(publisher).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PublisherExists(id))
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

        // POST: api/Publishers
        [ResponseType(typeof(Publisher))]
        public async Task<IHttpActionResult> PostPublisher(Publisher publisher)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (db.Publisher.Where(w => w.PublisherName.Contains(publisher.PublisherName)).Count() == 0)
            {
                db.Publisher.Add(publisher);
                await db.SaveChangesAsync();
            }
            return CreatedAtRoute("DefaultApi", new { id = publisher.IdPublisher }, publisher);
        }

        // DELETE: api/Publishers/5
        [ResponseType(typeof(Publisher))]
        public async Task<IHttpActionResult> DeletePublisher(int id)
        {
            Publisher publisher = await db.Publisher.FindAsync(id);
            if (publisher == null)
            {
                return NotFound();
            }

            db.Publisher.Remove(publisher);
            await db.SaveChangesAsync();

            return Ok(publisher);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PublisherExists(int id)
        {
            return db.Publisher.Count(e => e.IdPublisher == id) > 0;
        }
    }
}