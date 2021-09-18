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

        public List<Localidad> ObtenerLocalidades()
        {
            List<Localidad> lista = new List<Localidad>();
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "obtener_localidades";
                comm.CommandType = CommandType.StoredProcedure;

                SqlDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    int id_localidad = dr.GetInt32(0);
                    string nombre = dr.GetString(1).Trim();
                    int cosfigo_postal = dr.GetInt32(2);
                    int id_provincia = dr.GetInt32(3);


                    Localidad localidad = new Localidad(id_localidad, nombre, cosfigo_postal, id_provincia);
                    lista.Add(localidad);
                }

                dr.Close();
            }

            return lista;
        }
    }
}