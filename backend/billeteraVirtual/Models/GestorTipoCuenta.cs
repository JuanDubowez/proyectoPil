using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace billeteraVirtual.Models
{
    public class GestorTipoCuenta
    {
        public void AgregarTipoCuenta(TipoCuenta tipoCuenta)
        {
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "insertar_tipo_cuenta";
                comm.Parameters.Add(new SqlParameter("@id_tipo_cuenta", tipoCuenta.Id_tipo_cuenta));
                comm.Parameters.Add(new SqlParameter("@nombre", tipoCuenta.Nombre));
                comm.Parameters.Add(new SqlParameter("@moneda", tipoCuenta.Moneda));
                comm.ExecuteNonQuery();
            }
    }
    }
}