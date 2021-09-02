using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billeteraVirtual.Models
{
    public class Provincia
    {
        private string id_provincia;
        private string provincia;

        public Provincia(string id_provincia, string provinciaa)
        {
            Id_provincia = id_provincia;
            Provinciaa = provinciaa;
        }

        public Provincia()
        {

        }

        public string Id_provincia { get => id_provincia; set => id_provincia = value; }
        public string Provinciaa{ get => provincia; set => provincia = value; }
    }
}