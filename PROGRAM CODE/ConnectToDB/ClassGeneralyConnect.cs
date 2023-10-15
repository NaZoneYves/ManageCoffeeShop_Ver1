using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PROJECT.Connect
{
    internal class ClassGeneralyConnect
    {
        
    }
    public interface IConnect
    {
        SqlConnection Connect();
    }
}
