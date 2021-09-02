using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace billeteraVirtual.Models
{
    public class GestorCuenta
    {
        public void AgregarCuenta(Cuenta cuenta) 
        {
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "insertar_cuenta";
                comm.Parameters.Add(new SqlParameter("@id_cuenta", cuenta.Id_cuenta));
                comm.Parameters.Add(new SqlParameter("@id_cliente", cuenta.Id_cliente));
                comm.Parameters.Add(new SqlParameter("@cvu", cuenta.Cvu));
                comm.Parameters.Add(new SqlParameter("@numero_de_cuenta", cuenta.Numero_de_cuenta));
                comm.Parameters.Add(new SqlParameter("@saldo", cuenta.Saldo));
                comm.Parameters.Add(new SqlParameter("@id_tipo_cuenta", cuenta.Id_tipo_cuenta));
                comm.ExecuteNonQuery();
            }
    }
    }
}