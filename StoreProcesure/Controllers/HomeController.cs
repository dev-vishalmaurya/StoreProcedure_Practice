using StoreProcesure.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace StoreProcesure.Controllers
{
    public class HomeController : Controller
    {
        DBLayer db = new DBLayer();
        public ActionResult Index()
        {
            SqlConnection conn = new SqlConnection("Data Source=LAPTOP-CQ57ICGG\\SQLEXPRESS;Initial Catalog=ProcedureTest1;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("sp_selectdata", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            conn.Open();
            cmd.ExecuteNonQuery();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            ViewBag.data = dt;
            conn.Close();

            return View();
        }
        [HttpPost]
        public ActionResult Index(RegisterModel re)
        {
            SqlParameter[] parameters = new SqlParameter[] { 
            new SqlParameter("name",re.Name),
            new SqlParameter("mobile",re.Mobile),
            new SqlParameter("email",re.Email),
            new SqlParameter("qualification",re.Qualification),
            new SqlParameter("gender",re.gender),
            new SqlParameter("address", re.Address)

            }; 
            db.ExecuteNonQueryDB("sp_register",parameters);
            //SqlConnection conn = new SqlConnection("Data Source=LAPTOP-CQ57ICGG\\SQLEXPRESS;Initial Catalog=ProcedureTest1;Integrated Security=True");
            //SqlCommand cmd = new SqlCommand("sp_register",conn);
            //cmd.CommandType = System.Data.CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("name",re.Name);
            //cmd.Parameters.AddWithValue("mobile",re.Mobile);
            //cmd.Parameters.AddWithValue("email",re.Email);
            //cmd.Parameters.AddWithValue("qualification",re.Qualification);
            //cmd.Parameters.AddWithValue("gender",re.gender);
            //cmd.Parameters.AddWithValue("address", re.Address);

            //conn.Open();
            //cmd.ExecuteNonQuery();
            //conn.Close();
            
            return RedirectToAction("index");
        }
        
        public ActionResult Delete(string id)
        {
            SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("email",id),
            };
            db.ExecuteNonQueryDB("sp_deletedata1", parameter);
            //SqlConnection conn = new SqlConnection("Data Source=LAPTOP-CQ57ICGG\\SQLEXPRESS;Initial Catalog=ProcedureTest1;Integrated Security=True");
            //SqlCommand cmd = new SqlCommand("sp_deletedata1", conn);
            //cmd.CommandType = System.Data.CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("email",id);
            //conn.Open();
            //cmd.ExecuteNonQuery();
            //conn.Close();
            return RedirectToAction("Index");
        }
        public ActionResult Edit(RegisterModel re)
        {
            ViewBag.data = re;
            return View();
        }
        [HttpPost]
        public ActionResult Edit1(RegisterModel re)
        {
            SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("sr",re.Id),
            new SqlParameter("name",re.Name),
            new SqlParameter("mobile",re.Mobile),
            new SqlParameter("email",re.Email),
            new SqlParameter("qualification",re.Qualification),
            new SqlParameter("gender",re.gender),
            new SqlParameter("address", re.Address)

            };
            db.ExecuteNonQueryDB("sp_edit", parameters);
            return RedirectToAction("Index");
        }
    }
}