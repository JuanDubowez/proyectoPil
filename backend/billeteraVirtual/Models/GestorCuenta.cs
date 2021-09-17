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
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id_cliente", cuenta.Id_cliente));
                comm.Parameters.Add(new SqlParameter("@cvu", cuenta.Cvu));
                comm.Parameters.Add(new SqlParameter("@numero_de_cuenta", cuenta.Numero_de_cuenta));
                comm.Parameters.Add(new SqlParameter("@saldo", cuenta.Saldo));
                comm.Parameters.Add(new SqlParameter("@id_tipo_cuenta", cuenta.Id_tipo_cuenta));
                comm.ExecuteNonQuery();
            }
        }

        public List<Cuenta> ObtenerCuentas()
        {
            List<Cuenta> lista = new List<Cuenta>();
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "obtener_cuentas";
                comm.CommandType = CommandType.StoredProcedure;

                SqlDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    int id_cuenta = dr.GetInt32(0);
                    int id_cliente = dr.GetInt32(1);
                    string cvu = dr.GetString(2).Trim();
                    string numero_de_cuenta = dr.GetString(3).Trim();
                    int saldo = dr.GetInt32(4);
                    int id_tipo_cuenta = dr.GetInt32(5);

                    Cuenta cuenta = new Cuenta(id_cuenta, id_cliente, cvu, numero_de_cuenta, saldo, id_tipo_cuenta);
                    lista.Add(cuenta);
                }

                dr.Close();
            }

            return lista;
        }
    }
}