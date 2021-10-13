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
    [Authorize]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class OperacionController : ApiController
    {
        // GET: api/Operacion
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Operacion/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Operacion
        public Operacion Post([FromBody]Operacion value)
        {
            GestorOperacion gOperacion = new GestorOperacion();
            gOperacion.AgregarOperacion(value);
            return value;
        }


        // PUT: api/Operacion/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Operacion/5
        public void Delete(int id)
        {
        }
    }
}
