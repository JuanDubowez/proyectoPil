using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace billeteraVirtual.Models
{
    public class GestorProvincia
    {
        public void AgregarProvincia(Provincia provincia)
        {
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "insertar_provincia";
                comm.Parameters.Add(new SqlParameter("@id_provincia", provincia.Id_provincia));
                comm.Parameters.Add(new SqlParameter("@provincia", provincia.Provinciaa));
                comm.ExecuteNonQuery();
            }
        }
    }
}