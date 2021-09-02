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
                comm.Parameters.Add(new SqlParameter("@id_cliente", clientes.Id_cliente));
                comm.Parameters.Add(new SqlParameter("@nombre", clientes.Nombre));
                comm.Parameters.Add(new SqlParameter("@apellido", clientes.Apellido));
                comm.Parameters.Add(new SqlParameter("@fecha_de_nacimiento", clientes.Fecha_de_nacimiento));
                comm.Parameters.Add(new SqlParameter("@documento", clientes.Documento));
                comm.Parameters.Add(new SqlParameter("@cuil", clientes.Cuil));
                comm.Parameters.Add(new SqlParameter("@nacionalidad", clientes.Nacionalidad));
                comm.Parameters.Add(new SqlParameter("@genero", clientes.Genero));
                comm.Parameters.Add(new SqlParameter("@id_localidad", clientes.Id_localidad));
                comm.Parameters.Add(new SqlParameter("@contraseña", clientes.Contraseña));
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
                    int cuil = dr.GetInt32(5);
                    string nacionalidad = dr.GetString(6).Trim();
                    string genero = dr.GetString(7).Trim();
                    string id_localidad = dr.GetString(8).Trim();
                    string contraseña = dr.GetString(9).Trim();
                    string imagen_delantera = dr.GetString(10).Trim();
                    string imagen_trasera = dr.GetString(11).Trim();

                    persona = new Clientes(id_cliente, nombre, apellido, fecha_de_nacimiento, documento, cuil, nacionalidad, genero, id_localidad, contraseña,imagen_delantera,imagen_trasera);
                }

                dr.Close();
            }

            return persona;

        }



    }
}