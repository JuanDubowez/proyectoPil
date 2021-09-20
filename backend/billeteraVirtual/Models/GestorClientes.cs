using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace billeteraVirtual.Models
{
    public class GestorClientes
    {
        public void AgregarClientes(Clientes clientes)
        {
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "insertar_persona";
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@nombre", clientes.Nombre));
                comm.Parameters.Add(new SqlParameter("@apellido", clientes.Apellido));
                comm.Parameters.Add(new SqlParameter("@fecha_de_nacimiento", clientes.Fecha_de_nacimiento));
                comm.Parameters.Add(new SqlParameter("@documento", clientes.Documento));
                comm.Parameters.Add(new SqlParameter("@cuil", clientes.Cuil));
                comm.Parameters.Add(new SqlParameter("@nacionalidad", clientes.Nacionalidad));
                comm.Parameters.Add(new SqlParameter("@genero", clientes.Genero));
                comm.Parameters.Add(new SqlParameter("@id_localidad", clientes.Id_localidad));
                comm.Parameters.Add(new SqlParameter("@mail", clientes.Mail));
                comm.Parameters.Add(new SqlParameter("@contrasena", clientes.Contrasena));
                comm.Parameters.Add(new SqlParameter("@imagen_delantera", clientes.Imagen_delantera));
                comm.Parameters.Add(new SqlParameter("@imagen_trasera", clientes.Imagen_trasera));
                comm.ExecuteNonQuery();
            }
        }


        public Clientes ObtenerPersona(int id)
        {
            Clientes persona = null;
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "obtener_persona";
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id_cliente", id));

                SqlDataReader dr = comm.ExecuteReader();

                if (dr.Read())
                {
                    int id_cliente = dr.GetInt32(0);
                    string nombre = dr.GetString(1).Trim();
                    string apellido = dr.GetString(2).Trim();
                    DateTime fecha_de_nacimiento = System.DateTime.Now;
                    int documento = dr.GetInt32(4);
                    string cuil = dr.GetString(5).Trim();
                    string nacionalidad = dr.GetString(6).Trim();
                    string genero = dr.GetString(7).Trim();
                    int id_localidad = dr.GetInt32(8);
                    string mail = dr.GetString(9).Trim();
                    string contrasena = dr.GetString(10).Trim();
                    string imagen_delantera = dr.GetString(11).Trim();
                    string imagen_trasera = dr.GetString(12).Trim();

                    persona = new Clientes(id_cliente, nombre, apellido, fecha_de_nacimiento, documento, cuil, nacionalidad, genero, id_localidad, mail, contrasena,imagen_delantera,imagen_trasera);
                }

                dr.Close();
            }

            return persona;

        }


        public List<Clientes> ObtenerPersonas()
        {
            List<Clientes> lista = new List<Clientes>();
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "obtener_personas";
                comm.CommandType = CommandType.StoredProcedure;

                SqlDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    int id_cliente = dr.GetInt32(0);
                    string nombre = dr.GetString(1).Trim();
                    string apellido = dr.GetString(2).Trim();
                    DateTime fecha_de_nacimiento = System.DateTime.Now;
                    int documento = dr.GetInt32(4);
                    string cuil = dr.GetString(5);
                    string nacionalidad = dr.GetString(6).Trim();
                    string genero = dr.GetString(7).Trim();
                    int id_localidad = dr.GetInt32(8);
                    string mail = dr.GetString(9).Trim();
                    string contraseña = dr.GetString(10).Trim();
                    string imagen_delantera = dr.GetString(11).Trim();
                    string imagen_trasera = dr.GetString(12).Trim();

                    Clientes persona = new Clientes(id_cliente, nombre, apellido, fecha_de_nacimiento, documento, cuil, nacionalidad, genero, id_localidad, mail,contraseña, imagen_delantera, imagen_trasera);
                    lista.Add(persona);
                }

                dr.Close();
            }

            return lista;
        }

        public void AgregarPersona(Clientes persona)
        {
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "insertar_persona";
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@nombre", persona.Nombre));
                comm.Parameters.Add(new SqlParameter("@apellido", persona.Apellido));
                comm.Parameters.Add(new SqlParameter("@fecha_de_nacimiento", persona.Fecha_de_nacimiento));
                comm.Parameters.Add(new SqlParameter("@documento", persona.Documento));
                comm.Parameters.Add(new SqlParameter("@cuil", persona.Cuil));
                comm.Parameters.Add(new SqlParameter("@nacionalidad", persona.Nacionalidad));
                comm.Parameters.Add(new SqlParameter("@genero", persona.Genero));
                comm.Parameters.Add(new SqlParameter("@id_localidad", persona.Id_localidad));
                comm.Parameters.Add(new SqlParameter("@mail", persona.Mail));
                comm.Parameters.Add(new SqlParameter("@contrasena", persona.Contrasena));
                comm.Parameters.Add(new SqlParameter("@imagen_delantera", persona.Imagen_delantera));
                comm.Parameters.Add(new SqlParameter("imagen_trasera", persona.Imagen_trasera));
                comm.ExecuteNonQuery();


            }
        }

        public int ObtenerId(string cuil)
        {
            int id = 0;
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "obtener_id";
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@cuil", cuil));

                SqlDataReader dr = comm.ExecuteReader();

                if (dr.Read())
                {
                    int id_cliente = dr.GetInt32(0);


                    id = id_cliente;
                }

                dr.Close();
            }

            return id;

        }


    }
}