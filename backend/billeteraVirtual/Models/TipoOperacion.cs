using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billeteraVirtual.Models
{
    public class TipoOperacion
    {
        private int id_tipo_operacion;
        private string nombre;

        public TipoOperacion(int id_tipo_operacion, string nombre)
        {
            Id_tipo_operacion = id_tipo_operacion;
            Nombre = nombre;
        }

        public TipoOperacion()
        {

        }

        public int Id_tipo_operacion { get => id_tipo_operacion; set => id_tipo_operacion = value; }
        public string Nombre { get => nombre; set => nombre = value; }
    }
}