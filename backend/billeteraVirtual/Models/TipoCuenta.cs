using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billeteraVirtual.Models
{
    public class TipoCuenta
    {
        private int id_tipo_cuenta;
        private string nombre;
        private string moneda;

        public TipoCuenta(int id_tipo_cuenta, string nombre, string moneda)
        {
            Id_tipo_cuenta = id_tipo_cuenta;
            Nombre = nombre;
            Moneda = moneda;
        }

        public TipoCuenta()
        {

        }

        public int Id_tipo_cuenta { get => id_tipo_cuenta; set => id_tipo_cuenta = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Moneda { get => moneda; set => moneda = value; }
    }
}