using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using API.Models;

namespace API.Controllers
{
    public class TestTypesController : ApiController
    {
        private DBContext db = new DBContext();

        // GET: api/TestTypes
        public IQueryable<TestType> GetTestTypes()
        {
            return db.TestTypes;
        }

        // GET: api/TestTypes/5
        [ResponseType(typeof(TestType))]
        public IHttpActionResult GetTestType(int id)
        {
            TestType testType = db.TestTypes.Find(id);
            if (testType == null)
            {
                return NotFound();
            }

            return Ok(testType);
        }

        // PUT: api/TestTypes/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTestType(int id, TestType testType)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != testType.TestTypeID)
            {
                return BadRequest();
            }

            db.Entry(testType).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TestTypeExists(id))
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

        // POST: api/TestTypes
        [ResponseType(typeof(TestType))]
        public IHttpActionResult PostTestType(TestType testType)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TestTypes.Add(testType);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = testType.TestTypeID }, testType);
        }

        // DELETE: api/TestTypes/5
        [ResponseType(typeof(TestType))]
        public IHttpActionResult DeleteTestType(int id)
        {
            TestType testType = db.TestTypes.Find(id);
            if (testType == null)
            {
                return NotFound();
            }

            db.TestTypes.Remove(testType);
            db.SaveChanges();

            return Ok(testType);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TestTypeExists(int id)
        {
            return db.TestTypes.Count(e => e.TestTypeID == id) > 0;
        }
    }
}