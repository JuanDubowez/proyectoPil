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

       

        public Cuenta ObtenerCuentaCliente(int number)
        {
            int id = 0;
            Cuenta cuenta = null;
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "obtener_cuenta";
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id_cliente", number));
                

                SqlDataReader dr = comm.ExecuteReader();

                if (dr.Read())
                {
                    int id_cuenta = dr.GetInt32(0);
                    int id_cliente = dr.GetInt32(1);
                    string cvu = dr.GetString(2).Trim();
                    string numero_de_cuenta = dr.GetString(3).Trim();
                    int saldo = dr.GetInt32(4);
                    int id_tipo_cuenta = dr.GetInt32(5);

                    cuenta = new Cuenta(id_cuenta,id_cliente,cvu,numero_de_cuenta,saldo,id_tipo_cuenta);


                }

                dr.Close();
            }

            return cuenta;

        }


         public List<Operacion> ObtenerOperacion(int id_cuenta1)
        {
            List<Operacion> lista = new List<Operacion>();
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "obtener_operacion";
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id_cuenta", id_cuenta1));


                SqlDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    int id_operaciones = dr.GetInt32(0);
                    int id_cuenta = dr.GetInt32(1);
                    int id_tipo_operacion = dr.GetInt32(2);
                    int monto = dr.GetInt32(3);
                    int id_cuenta_destino = dr.GetInt32(4);
                    string concepto = dr.GetString(5).Trim();
                    DateTime fecha_hora= System.DateTime.Now;
                    string estado = dr.GetString(7).Trim();

                    Operacion operacion = new Operacion(id_operaciones,id_cuenta,id_tipo_operacion,monto,id_cuenta_destino,concepto,fecha_hora,estado);
                    lista.Add(operacion);
                }

                dr.Close();
            }

            return lista;
        }

        public int ObtenerIdCuenta(string cvu)
        {
            int id = 0;
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "obtener_id_cuenta";
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@cvu", cvu));


                SqlDataReader dr = comm.ExecuteReader();

                if (dr.Read())
                {
                    int id_cuenta = dr.GetInt32(0);
         
                    id = id_cuenta;


                }

                dr.Close();
            }

            return id;

        }

        public int ObtenerIdCuenta2(int id_c)
        {
            int id = 0;
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "obtener_id_cuenta2";
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id_cliente", id_c));


                SqlDataReader dr = comm.ExecuteReader();

                if (dr.Read())
                {
                    int id_cuenta = dr.GetInt32(0);

                    id = id_cuenta;


                }

                dr.Close();
            }

            return id;

        }

    }
        

   
}