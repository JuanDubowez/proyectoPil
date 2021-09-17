using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace billeteraVirtual.Models
{
    public class GestorTelefono
    {
        public void AgregarTelefono(Telefono telefono)
        {
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "insertar_telefono";
                comm.Parameters.Add(new SqlParameter("@id_telefono",telefono.Id_telefono));
                comm.Parameters.Add(new SqlParameter("@id_cliente",telefono.Id_cliente));
                comm.Parameters.Add(new SqlParameter("@telefono", telefono.Telefonoo));
                comm.ExecuteNonQuery();
            }
        }
    }
}