using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using billeteraVirtual.Models;

namespace billeteraVirtual.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ProvinciaController : ApiController
    {
        // GET: api/Provincia
        public IEnumerable<Provincia> Get()
        {
            GestorProvincia gProvincia = new GestorProvincia();
            return gProvincia.ObtenerProvincias();
        }

        // GET: api/Provincia/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Provincia
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Provincia/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Provincia/5
        public void Delete(int id)
        {
        }
    }
}
