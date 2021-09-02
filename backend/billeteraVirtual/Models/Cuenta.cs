using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billeteraVirtual.Models
{
    public class Cuenta
    {
        private int id_cuenta;
        private int id_cliente;
        private int cvu;
        private int numero_de_cuenta;
        private int saldo;
        private int id_tipo_cuenta;

        public Cuenta(int id_cuenta, int id_cliente, int cvu, int numero_de_cuenta, int saldo, int id_tipo_cuenta)
        {
            Id_cuenta = id_cuenta;
            Id_cliente = id_cliente;
            Cvu = cvu;
            Numero_de_cuenta = numero_de_cuenta;
            Saldo = saldo;
            Id_tipo_cuenta = id_tipo_cuenta;
        }

        public Cuenta()
        {

        }

        public int Id_cuenta { get => id_cuenta; set => id_cuenta = value; }
        public int Id_cliente { get => id_cliente; set => id_cliente = value; }
        public int Cvu { get => cvu; set => cvu = value; }
        public int Numero_de_cuenta { get => numero_de_cuenta; set => numero_de_cuenta = value; }
        public int Saldo { get => saldo; set => saldo = value; }
        public int Id_tipo_cuenta { get => id_tipo_cuenta; set => id_tipo_cuenta = value; }
    }
}