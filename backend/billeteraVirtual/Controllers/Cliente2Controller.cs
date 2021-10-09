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
    public class Cliente2Controller : ApiController
    {
        // GET: api/Cliente2
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Cliente2/5
        public Clientes Get(int id)
        {
            GestorClientes gestorPersona = new GestorClientes();
            return gestorPersona.ObtenerPersona(id);
        }

        // POST: api/Cliente2
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Cliente2/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Cliente2/5
        public void Delete(int id)
        {
        }
    }
}
