using PROJECT.Connect;
using PROJECT.ConnectToDB;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PROJECT
{
    public partial class fAdmin : Form
    {
        public fAdmin()
        {
            InitializeComponent();

            LoadAccountList();
        }

        //đưa danh sách account lên dtgvAccount
        void LoadAccountList()
        {
            IConnect ConnectSQL = new ConnectToSQL();
            SqlConnection sqlCon = new SqlConnection();
            sqlCon = ConnectSQL.Connect();

            string Query = "select * from dbo.Account";
            SqlCommand sqlCmd = new SqlCommand(Query, sqlCon);

            DataTable data = new DataTable();

            //trung gian lấy dữ liệu
            SqlDataAdapter adapter = new SqlDataAdapter(sqlCmd);

            adapter.Fill(data);

            sqlCon.Close();

            dtgvAccount.DataSource = data;

        }
        private void fAdmin_Load(object sender, EventArgs e)
        {

        }
    }
}
