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
    public class ClienteController : ApiController
    {
        // GET: api/Cliente
        public IEnumerable<Clientes> Get()
        {
            GestorClientes gPersona = new GestorClientes();
            return gPersona.ObtenerPersonas();
        }

        // GET: api/Cliente/5
        public int Get(string cuil)
        {
            GestorClientes gestorPersona = new GestorClientes();
            return gestorPersona.ObtenerId(cuil);
        }

        // POST: api/Cliente
        public Clientes Post([FromBody]Clientes value)
        {
            GestorClientes gPersona = new GestorClientes();
            gPersona.AgregarPersona(value);
            return value;


        }

        // PUT: api/Cliente/5
        public Clientes Put(int id_cliente, [FromBody] Clientes value)
        {
            GestorClientes gPersona = new GestorClientes();
            gPersona.ActualizarPersona(id_cliente, value);
            return value;
        }

        // DELETE: api/Cliente/5
        public void Delete(int id)
        {
        }
    }
}
