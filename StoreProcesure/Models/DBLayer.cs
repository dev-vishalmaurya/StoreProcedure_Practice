using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace StoreProcesure.Models
{
    public class DBLayer
    {
        public int ExecuteNonQueryDB(string procname, SqlParameter[] sqlParameters)
        {
            SqlConnection conn = new SqlConnection("Data Source=LAPTOP-CQ57ICGG\\SQLEXPRESS;Initial Catalog=ProcedureTest1;Integrated Security=True");
            SqlCommand cmd = new SqlCommand(procname, conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            foreach (SqlParameter param in sqlParameters)
            {
                cmd.Parameters.Add(param);
            }
            conn.Open();
            int rowsaffected = cmd.ExecuteNonQuery();
            conn.Close();
            return rowsaffected;
        }
    }
}