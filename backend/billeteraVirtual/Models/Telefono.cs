using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billeteraVirtual.Models
{
    public class Telefono
    {
        private int id_telefono;
        private int id_cliente;
        private int telefono;

        public Telefono(int id_telefono, int id_cliente, int telefono)
        {
            Id_telefono = id_telefono;
            Id_cliente = id_cliente;
            Telefonoo = telefono;
        }

        public Telefono()
        {

        }

        public int Id_telefono { get => id_telefono; set => id_telefono = value; }
        public int Id_cliente { get => id_cliente; set => id_cliente = value; }
        public int Telefonoo { get => telefono; set => telefono = value; }
    }
}