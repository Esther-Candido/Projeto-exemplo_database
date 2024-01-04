using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace exemplo_database
{
    public partial class lista_produtos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //aparecer isso é preciso dar 2 cliques em cima do ItemDataBound que fica no RAIO ao clicar em cima do REPEATER no Design
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;

                ((Label)e.Item.FindControl("lbl_cod")).Text = dr["cod_produto"].ToString();
                ((TextBox)e.Item.FindControl("tb_nome")).Text = dr["nome"].ToString();
                ((TextBox)e.Item.FindControl("tb_stock")).Text = dr["stock"].ToString();
                ((TextBox)e.Item.FindControl("tb_pvp")).Text = dr["pvp"].ToString();

                ((ImageButton)e.Item.FindControl("btn_grava")).CommandArgument = dr["cod_produto"].ToString();
                ((ImageButton)e.Item.FindControl("btn_apaga")).CommandArgument = dr["cod_produto"].ToString();
       
            }
        }

        //aparecer isso é preciso dar 2 cliques em cima do ItemCommand que fica no RAIO ao clicar em cima do REPEATER no Design
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
         
            if (e.CommandName.Equals("btn_grava"))
            {
                //conexao BD
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["atec_palConnectionString"].ConnectionString);

                string query = "update tb_lista_produtos set ";
                query += "nome = '" + ((TextBox)e.Item.FindControl("tb_nome")).Text + "',";
                query += "stock = '" + ((TextBox)e.Item.FindControl("tb_stock")).Text + "',";
                query += "pvp=parse( '" + ((TextBox)e.Item.FindControl("tb_pvp")).Text + "' as numeric(4,2) using 'PT-pt') ";
                query += "where cod_produto = " + ((ImageButton)e.Item.FindControl("btn_grava")).CommandArgument;

                myConn.Open();
                SqlCommand myCommand = new SqlCommand(query, myConn);
                myCommand.ExecuteNonQuery();
                myConn.Close();
            }

            if (e.CommandName.Equals("btn_apaga"))
            {
                //conexao BD
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["atec_palConnectionString"].ConnectionString);

                string query = "DELETE FROM tb_lista_produtos WHERE cod_produto = " + ((ImageButton)e.Item.FindControl("btn_apaga")).CommandArgument;

                myConn.Open();
                SqlCommand myCommand = new SqlCommand(query, myConn);
                myCommand.ExecuteNonQuery();
                myConn.Close();
            }
        }

        protected void btn_saveAll_Click(object sender, ImageClickEventArgs e)
        {
            //conexao BD
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["atec_palConnectionString"].ConnectionString);

            string query = "";

            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                query += "update tb_lista_produtos set ";
                query += "nome='" + ((TextBox)Repeater1.Items[i].FindControl("tb_nome")).Text + "', ";
                query += "stock='" + ((TextBox)Repeater1.Items[i].FindControl("tb_stock")).Text + "', ";
                query += "pvp=parse('" + ((TextBox)Repeater1.Items[i].FindControl("tb_pvp")).Text + "' as numeric(4,2) using 'PT-pt') ";
                query += "where cod_produto = " + ((Label)Repeater1.Items[i].FindControl("lbl_cod")).Text + ";";


            }

            myConn.Open();
            SqlCommand myCommand = new SqlCommand(query, myConn);
            myCommand.ExecuteNonQuery();
            myConn.Close();
        }



        protected void ddl_ordena_SelectedIndexChanged(object sender, EventArgs e)
        {
            //conexao BD
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["atec_palConnectionString"].ConnectionString);

            if (ddl_ordena.Text == "+Caro")
            {
                string query = "Select * FROM tb_lista_produtos order by pvp ASC";

                SqlDataSource1.SelectCommand = query;

                myConn.Open();
                SqlCommand myCommand = new SqlCommand(query, myConn);
                myCommand.ExecuteNonQuery();
                myConn.Close();

            }
            else if (ddl_ordena.Text == "+Barato")
            {
                string query = "Select * FROM tb_lista_produtos order by pvp DESC";

                SqlDataSource1.SelectCommand = query;

                myConn.Open();
                SqlCommand myCommand = new SqlCommand(query, myConn);
                myCommand.ExecuteNonQuery();
                myConn.Close();
            }
            else if (ddl_ordena.Text == "---")
            {
                string query = "Select * FROM tb_lista_produtos";

                SqlDataSource1.SelectCommand = query;

                myConn.Open();
                SqlCommand myCommand = new SqlCommand(query, myConn);
                myCommand.ExecuteNonQuery();
                myConn.Close();
            }
        }




        /*
         
        
        //COLOCAR OS BOTAO NO ASPX
           <!--<td><asp:Button ID="btn_ordenar" runat="server" text="+Barato" OnClick="btn_ordenar_Click"/></td> -->
            <!--<td><asp:Button ID="btn_ordenar2" runat="server" text="+Caro" Onclick="btn_ordenar2_Click"/></td> -->

       //organizar Preço para o mais barato
       protected void btn_ordenar_Click(object sender, EventArgs e)
       {
           //conexao BD
           SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["atec_palConnectionString"].ConnectionString);


           string query = "Select * FROM tb_lista_produtos order by pvp ASC";

           SqlDataSource1.SelectCommand = query;

           myConn.Open();
           SqlCommand myCommand = new SqlCommand(query, myConn);
           myCommand.ExecuteNonQuery();
           myConn.Close();
       }



       //organizar Preço para o mais caro
       protected void btn_ordenar2_Click(object sender, EventArgs e)
       {
           //conexao BD
           SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["atec_palConnectionString"].ConnectionString);


           string query = "Select * FROM tb_lista_produtos order by pvp DESC";

           SqlDataSource1.SelectCommand = query;

           myConn.Open();
           SqlCommand myCommand = new SqlCommand(query, myConn);
           myCommand.ExecuteNonQuery();
           myConn.Close();
       }
       */
    }
}