using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EmlakProjesi.Database
{
    public class DbBaglanti
    {
        public SqlConnection baglan()//veritabanina baglanti kurar
        {
            SqlConnection baglanti = new SqlConnection("Data Source=FURKAN\\SQLEXPRESS;Initial Catalog=EMLAK;Integrated Security=True");
            baglanti.Open();
            SqlConnection.ClearPool(baglanti);
            SqlConnection.ClearAllPools();
            return baglanti;
        }

        public DataTable DataTableGetir(string sql)// veri çeker
        {
            SqlConnection baglan = this.baglan();
            SqlDataAdapter adapter = new SqlDataAdapter(sql, baglan);
            DataTable dt = new DataTable();
            try
            {
                adapter.Fill(dt);
            }
            catch (SqlException ex)
            {

                throw new Exception(ex.Message);
            }
            adapter.Dispose();
            baglan.Close();
            baglan.Dispose();
            return dt;

        }


    }
}