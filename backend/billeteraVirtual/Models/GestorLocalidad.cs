using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace billeteraVirtual.Models
{
    public class GestorLocalidad
    {
        public void AgregarLocalidad(Localidad localidad)
        {
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "insertar_localidad";
                comm.Parameters.Add(new SqlParameter("@id_localidad", localidad.Id_localidad));
                comm.Parameters.Add(new SqlParameter("@nombre", localidad.Nombre));
                comm.Parameters.Add(new SqlParameter("@cosdigo_postal", localidad.Cosdigo_postal));
                comm.Parameters.Add(new SqlParameter("@id_provincia", localidad.Id_provincia));
                comm.ExecuteNonQuery();
            }
        }
    }
}