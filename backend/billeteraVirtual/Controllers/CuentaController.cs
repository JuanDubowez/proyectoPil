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
    public class CuentaController : ApiController
    {
        // GET: api/Cuenta
        public IEnumerable<Cuenta> Get()
        {
            GestorCuenta gCuenta = new GestorCuenta();
            return gCuenta.ObtenerCuentas();
        }

        // GET: api/Cuenta/5
        public int Get(int documento, string cuil, string mail)
        {
            GestorCuenta gestorCuenta = new GestorCuenta();
            return gestorCuenta.ObtenerPersonaCuenta(documento, cuil, mail);
        }

        // POST: api/Cuenta
        public Cuenta Post([FromBody]Cuenta value)
        {
            GestorCuenta gCuenta = new GestorCuenta();
            gCuenta.AgregarCuenta(value);
            return value;

        }

        // PUT: api/Cuenta/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Cuenta/5
        public void Delete(int id)
        {
        }
    }
}
