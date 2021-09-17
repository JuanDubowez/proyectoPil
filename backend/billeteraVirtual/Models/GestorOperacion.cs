using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace billeteraVirtual.Models
{
    public class GestorOperacion
    {
        public void AgregarOperacion(Operacion operacion)
        {
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "insertar_operacion";
                comm.Parameters.Add(new SqlParameter("@id_operaciones", operacion.Id_operaciones));
                comm.Parameters.Add(new SqlParameter("@id_cuenta", operacion.Id_cuenta));
                comm.Parameters.Add(new SqlParameter("@id_tipo_operacion", operacion.Id_tipo_operacion));
                comm.Parameters.Add(new SqlParameter("@monto", operacion.Monto));
                comm.Parameters.Add(new SqlParameter("@id_cuenta_destino", operacion.Id_cuenta_destino));
                comm.Parameters.Add(new SqlParameter("@concepto", operacion.Concepto));
                comm.Parameters.Add(new SqlParameter("@fecha_hora", operacion.Fecha_hora));
                comm.Parameters.Add(new SqlParameter("@estado", operacion.Estado));
                comm.ExecuteNonQuery();
            }
    }
    }
}