using PROJECT.Connect;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static PROJECT.Connect.ClassGeneralyConnect;
using System.Data.SqlClient;
using System.Data;

namespace PROJECT.ConnectToDB
{
    internal class ConnectToSQL: IConnect
    {

        public SqlConnection Connect()
        {
            string strCon = @"Data Source=DESKTOP-LII2CR4\SQLEXPRESS;
                                Initial Catalog=dbcoffeeshop;
                                Integrated Security=True";
            SqlConnection sqlCon = new SqlConnection(strCon);
            sqlCon.Open();
            return sqlCon;
        }
    }
}
