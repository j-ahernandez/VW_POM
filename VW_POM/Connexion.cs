using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace VW_POM
{
    public class Connexion
    {

            SqlConnection con = new SqlConnection(@"Data Source= HNCRSAP-SQL01 ;Initial Catalog=HEDS ;User ID=hedsDB ;Password=HedsDB214 ;Connect Timeout = 999990000");
            public static String cs2 = @"Data Source= HNCRSAP-SQL01 ;Initial Catalog=CYRE ;User ID=cyreDB;Password=cyreDB214 ;Connect Timeout = 999990000";
            private SqlCommandBuilder cmb;
            public DataSet ds = new DataSet();
            public SqlDataAdapter da;
            public SqlCommand command;
            public DataTable dtt = new DataTable();
            public SqlDataReader read;
            public static String xyz;
            public void conectar()
            {
                try
                {
                    con.Open();
                    //MessageBox.Show("Connected", "Successfully", MessageBoxButtons.OK);
                }
                catch (Exception e)
                {
                    //MessageBox.Show("Failed to connect" + e.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                finally
                {
                    con.Close();
                }

            }

            public void cerrarconexion()
            {
                con.Close();
            }

            public void consulta(string sql, string tabla)
            {
                try
                {
                    ds.Tables.Clear();
                    da = new SqlDataAdapter(sql, con);
                    Console.WriteLine(sql);
                    cmb = new SqlCommandBuilder(da);
                    da.Fill(ds, tabla);
                    da.Fill(dtt);
                }
                catch (Exception e)
                {
                    Console.Write(e.Message);
                }
            }

            public SqlDataReader Leer(string tabla, string campos, string condicion)
            {
                try
                {
                    con.Open();
                    string consultar = @"SELECT " + campos + " FROM " + tabla + " WHERE " + condicion;
                    Console.WriteLine(consultar);
                    command = new SqlCommand(consultar, con);
                    read = command.ExecuteReader();
                }
                catch (Exception e)
                {
                    Console.Write(e.Message);
                }

                return read;
            }

            public bool insertar(string sql)
            {
                con.Open();
                command = new SqlCommand(sql, con);
                Console.WriteLine(sql);
                int i = command.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }

            public bool actualizar(string tabla, string campos, string condicion)
            {
                con.Open();
                string actualizar = "UPDATE " + tabla + " SET " + campos + " WHERE " + condicion;
                Console.WriteLine(actualizar);
                command = new SqlCommand(actualizar, con);
                int i = command.ExecuteNonQuery();
                con.Close();

                if (i > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }

            public bool actualizarNoCondition(string tabla, string campos)
            {
                con.Open();
                string actualizar = "UPDATE " + tabla + " SET " + campos;
                Console.WriteLine(actualizar);
                command = new SqlCommand(actualizar, con);
                int i = command.ExecuteNonQuery();
                con.Close();

                if (i > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }

            public bool Eliminar(string tabla, string condicion)
            {
                con.Open();
                string elimina = "DELETE FROM " + tabla + " WHERE " + condicion;
                Console.WriteLine(elimina);
                command = new SqlCommand(elimina, con);
                int i = command.ExecuteNonQuery();
                con.Close();

                if (i > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
        }

}