using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ICT713_Lab3_LoganFidler.App_Code
{
    [DataObject(true)]
    public static class IncidentDB
    {
        // 
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IEnumerable GetTechIncidents(int TechID)
        {
            SqlConnection con = new SqlConnection(TechSupportDB.GetConnectionString());
            string query = "SELECT IncidentID, DateOpened, "
                + "Title, Description, CustomerID, ProductCode, DateClosed "
                + "FROM Incidents WHERE TechID = @TechID "
                + "ORDER BY DateOpened";
            SqlCommand command = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dataReader = command.ExecuteReader();
            return dataReader;
        }
        //[DataObjectMethod(DataObjectMethodType.Update)]
        //public static int UpdateIncident(Incident original_Incident, Incident incident)
        //{
        //    int updateCount = 0;
        //}
    }
}