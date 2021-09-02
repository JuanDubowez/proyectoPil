using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billeteraVirtual.Models
{
    public class Localidad
    {
        private string id_localidad;
        private string nombre;
        private int cosdigo_postal;
        private string id_provincia; 

        public Localidad(string id_localidad, string nombre, int cosdigo_postal, string id_provincia)
        {
            Id_localidad = id_localidad;
            Nombre = nombre;
            Cosdigo_postal = cosdigo_postal;
            Id_provincia = id_provincia;
        }

        public Localidad()
        {

        }

        public string Id_localidad { get => id_localidad; set => id_localidad = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public int Cosdigo_postal { get => cosdigo_postal; set => cosdigo_postal = value; }
        public string Id_provincia { get => id_provincia; set => id_provincia = value; }
    }
}