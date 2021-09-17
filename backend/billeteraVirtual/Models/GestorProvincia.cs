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

        public List<Provincia> ObtenerProvincias()
        {
            List<Provincia> lista = new List<Provincia>();
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "obtener_provincias";
                comm.CommandType = CommandType.StoredProcedure;

                SqlDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    int id_provincia = dr.GetInt32(0);
                    string provinciaa = dr.GetString(1).Trim();
                    

                    Provincia provincia = new Provincia(id_provincia, provinciaa);
                    lista.Add(provincia);
                }

                dr.Close();
            }

            return lista;
        }
    }
}