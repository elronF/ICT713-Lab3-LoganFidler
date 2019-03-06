using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace ICT713_Lab3_LoganFidler.App_Code
{
    public static class TechSupportDB
    {
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["TechSupportConnectionString"].ConnectionString;
        }
    }
}