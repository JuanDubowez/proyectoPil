using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billeteraVirtual.Models
{
    public class Clientes
    {
        private int id_cliente;
        private string nombre;
        private string apellido;
        private DateTime fecha_de_nacimiento;
        private int documento;
        private string cuil;
        private string nacionalidad;
        private string genero;
        private int id_localidad;
        private string mail;
        private string contrasena;
        private string imagen_delantera;
        private string imagen_trasera;

        public Clientes(int id_cliente, string nombre, string apellido, DateTime fecha_de_nacimiento, int documento, string cuil, string nacionalidad, string genero, int id_localidad, string mail, string contrasena, string imagen_delantera, string imagen_trasera)
        {
            Id_cliente = id_cliente;
            Nombre = nombre;
            Apellido = apellido;
            Fecha_de_nacimiento = fecha_de_nacimiento;
            Documento = documento;
            Cuil = cuil;
            Nacionalidad = nacionalidad;
            Genero = genero;
            Id_localidad = id_localidad;
            Mail = mail;
            Contrasena = contrasena;
            Imagen_delantera = imagen_delantera;
            Imagen_trasera = imagen_trasera;
        }

        public Clientes()
        {

        }

        public int Id_cliente { get => id_cliente; set => id_cliente = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public DateTime Fecha_de_nacimiento { get => fecha_de_nacimiento; set => fecha_de_nacimiento = value; }
        public int Documento { get => documento; set => documento = value; }
        public string Cuil { get => cuil; set => cuil = value; }
        public string Nacionalidad { get => nacionalidad; set => nacionalidad = value; }
        public string Genero { get => genero; set => genero = value; }
        public int Id_localidad { get => id_localidad; set => id_localidad = value; }
        public string Mail { get => mail; set => mail = value; }
        public string Contrasena { get => contrasena; set => contrasena = value; }
        public string Imagen_delantera { get => imagen_delantera; set => imagen_delantera = value; }
        public string Imagen_trasera { get => imagen_trasera; set => imagen_trasera = value; }
    }
}