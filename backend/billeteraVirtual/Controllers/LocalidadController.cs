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
    public class LocalidadController : ApiController
    {
        [AllowAnonymous]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        // GET: api/Localidad
        public IEnumerable<Localidad> Get()
        {
            GestorLocalidad gLocalidad = new GestorLocalidad();
            return gLocalidad.ObtenerLocalidades();
        }

        // GET: api/Localidad/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Localidad
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Localidad/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Localidad/5
        public void Delete(int id)
        {
        }
    }
}
