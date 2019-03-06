using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ICT713_Lab3_LoganFidler.App_Code
{
    [DataObject(true)]
    public class TechnicianDB
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Technician> GetTechnicians()
        {
            List<Technician> technicians = new List<Technician>();
            Technician tech;
            SqlConnection con = new SqlConnection(TechSupportDB.GetConnectionString());
            string query = "SELECT TechID, Name FROM Technicians ORDER BY Name";
            SqlCommand command = new SqlCommand(query, con);
            try
            {
                con.Open();
                SqlDataReader dataReader = command.ExecuteReader();
                while (dataReader.Read())
                {
                    tech = new Technician();
                    tech.Name = dataReader["Name"].ToString();
                    tech.TechID = Convert.ToInt32(dataReader["TechID"]);
                    technicians.Add(tech);
                }
                dataReader.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return technicians;
        }
    }
}