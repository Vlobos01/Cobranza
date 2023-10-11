using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cobranza
{
    public partial class Gestion_Cobranzas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.FilterExpression = "idCliente =" + DropDownList1.SelectedValue;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlDataSource1.FilterExpression = string.Empty;
            SqlDataSource1.FilterParameters.Clear();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != string.Empty)
            {
                SqlDataSource1.Insert();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Text = GridView1.SelectedRow.Cells[1].Text;
            TextBox2.Text = GridView1.SelectedRow.Cells[2].Text;
            DropDownList2.SelectedValue = GridView1.SelectedRow.Cells[3].Text;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
        }
    }
}