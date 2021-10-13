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
    public class CuentaController : ApiController
    {
        // GET: api/Cuenta
        public IEnumerable<Cuenta> Get()
        {
            GestorCuenta gCuenta = new GestorCuenta();
            return gCuenta.ObtenerCuentas();
        }

        // GET: api/Cuenta/1
        public IEnumerable<Operacion> Get(int id_cuenta)
        {
            GestorCuenta gCuenta = new GestorCuenta();
            return gCuenta.ObtenerOperacion(id_cuenta);
        }

        // GET: api/Cuenta/2
        public Cuenta Get2(int id_cliente)
        {
            GestorCuenta gestorCuenta = new GestorCuenta();
            return gestorCuenta.ObtenerCuentaCliente(id_cliente);
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
