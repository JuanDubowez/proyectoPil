using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace billeteraVirtual.Models
{
    public class GestorTipoOperacion
    {
        public void AgregarTipoOperacion(TipoOperacion tipoOperacion)
        {
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "insertar_tipo_operacion";
                comm.Parameters.Add(new SqlParameter("@id_tipo_operacion", tipoOperacion.Id_tipo_operacion));
                comm.Parameters.Add(new SqlParameter("@nombre", tipoOperacion.Nombre));
                comm.ExecuteNonQuery();
            }
        }
    }
}