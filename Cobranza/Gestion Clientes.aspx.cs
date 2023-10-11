using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cobranza
{
    public partial class Gestion_Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                completarTabla();
            }
        }

        protected void completarTabla()
        {
            try
            {
                DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);

                if (dv != null && dv.Count > 0)
                {
                    //Rellenar cabecera
                    TableRow headerRow = new TableRow();

                    TableCell headerCell1 = new TableCell();
                    headerCell1.Text = "Nombre";
                    headerRow.Cells.Add(headerCell1);

                    TableCell headerCell2 = new TableCell();
                    headerCell2.Text = "Apellido";
                    headerRow.Cells.Add(headerCell2);

                    Table1.Rows.Add(headerRow);

                    // Rellenar las filas
                    foreach (DataRowView rowView in dv)
                    {
                        DataRow row = rowView.Row;
                        TableRow tableRow = new TableRow();

                        TableCell Cell1 = new TableCell();
                        Cell1.Text = row["nombre"].ToString();
                        tableRow.Cells.Add(Cell1);

                        TableCell Cell2 = new TableCell();
                        Cell2.Text = row["apellido"].ToString();
                        tableRow.Cells.Add(Cell2);

                        Table1.Rows.Add(tableRow);
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AletScript", $"alert('Error');", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource1.Insert();
            if(result != 0)
            {
                Label1.Text = "Se ha agregado " + result.ToString() + " registros";
                completarTabla();
                TextBox1.Text = string.Empty; TextBox2.Text = string.Empty;
            }
            else
            {
                Label1.Text = "No se agregaron registros";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource1.Delete();
            if (result != 0)
            {
                MessageLabel.Text = "Se ha eliminado " + result.ToString() + " registros";
                completarTabla();
                Label1.Text = string.Empty;
                TextBox1.Text = string.Empty; TextBox2.Text = string.Empty;
            }
            else
            {
                MessageLabel.Text = "No se eliminado registros";
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            if(dv != null && dv.Count > 0)
            {
                DataRowView row = dv[0];
                TextBox1.Text = row["nombre"].ToString();
                TextBox2.Text = row["apellido"].ToString();
            }
            completarTabla();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource1.Update();
            if (result != 0)
            {
                Label1.Text = "Actualizado " + result.ToString() + " registros";
                completarTabla();
                TextBox1.Text = string.Empty; TextBox2.Text = string.Empty;
            }
            else
            {
                Label1.Text = "No se actualizado registros";
            }
        }
    }
}