using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billeteraVirtual.Models
{
    public class Operacion
    {
        private int id_operaciones;
        private int id_cuenta;
        private int id_tipo_operacion;
        private int monto;
        private int id_cuenta_destino;
        private string concepto;
        private DateTime fecha_hora;
        private string estado;

        public Operacion(int id_operaciones, int id_cuenta, int id_tipo_operacion, int monto, int id_cuenta_destino, string concepto, DateTime fecha_hora, string estado)
        {
            Id_operaciones = id_operaciones;
            Id_cuenta = id_cuenta;
            Id_tipo_operacion = id_tipo_operacion;
            Monto = monto;
            Id_cuenta_destino = id_cuenta_destino;
            Concepto = concepto;
            Fecha_hora = fecha_hora;
            Estado = estado;
        }

        public Operacion()
        {

        }

        public int Id_operaciones { get => id_operaciones; set => id_operaciones = value; }
        public int Id_cuenta { get => id_cuenta; set => id_cuenta = value; }
        public int Id_tipo_operacion { get => id_tipo_operacion; set => id_tipo_operacion = value; }
        public int Monto { get => monto; set => monto = value; }
        public int Id_cuenta_destino { get => id_cuenta_destino; set => id_cuenta_destino = value; }
        public string Concepto { get => concepto; set => concepto = value; }
        public DateTime Fecha_hora { get => fecha_hora; set => fecha_hora = value; }
        public string Estado { get => estado; set => estado = value; }
    }
}