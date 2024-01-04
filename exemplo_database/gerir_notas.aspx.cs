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
    public partial class gerir_notas : System.Web.UI.Page
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

                ((Label)e.Item.FindControl("lbl_cod")).Text = dr["cod_avaliacao"].ToString();
                ((TextBox)e.Item.FindControl("tb_nome")).Text = dr["nome"].ToString();
                ((TextBox)e.Item.FindControl("tb_disciplina")).Text = dr["disciplina"].ToString();
                ((TextBox)e.Item.FindControl("tb_nota")).Text = dr["nota"].ToString();

                ((ImageButton)e.Item.FindControl("btn_grava")).CommandArgument = dr["cod_avaliacao"].ToString();
                ((ImageButton)e.Item.FindControl("btn_apaga")).CommandArgument = dr["cod_avaliacao"].ToString();
            }
        }

        //aparecer isso é preciso dar 2 cliques em cima do ItemCommand que fica no RAIO ao clicar em cima do REPEATER no Design
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("btn_grava"))
            {
                //conexao BD
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["atec_palConnectionString"].ConnectionString);

                string query = "update tb_avaliacao set ";
                query += "nome = '" + ((TextBox)e.Item.FindControl("tb_nome")).Text + "',";
                query += "disciplina = '" + ((TextBox)e.Item.FindControl("tb_disciplina")).Text + "',";
                query += "nota=parse( '" + ((TextBox)e.Item.FindControl("tb_nota")).Text + "' as numeric(4,2) using 'PT-pt') ";
                query += "where cod_avaliacao = " + ((ImageButton)e.Item.FindControl("btn_grava")).CommandArgument;

                myConn.Open();
                SqlCommand myCommand = new SqlCommand(query, myConn);
                myCommand.ExecuteNonQuery();
                myConn.Close();
            }

            if (e.CommandName.Equals("btn_apaga"))
            {
                //conexao BD
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["atec_palConnectionString"].ConnectionString);

                string query = "DELETE FROM tb_avaliacao WHERE cod_avaliacao = " + ((ImageButton)e.Item.FindControl("btn_apaga")).CommandArgument ;

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
                query += "update tb_avaliacao set ";
                query += "nome='" + ((TextBox)Repeater1.Items[i].FindControl("tb_nome")).Text + "', ";
                query += "disciplina='" + ((TextBox)Repeater1.Items[i].FindControl("tb_disciplina")).Text + "', ";
                query += "nota=parse('" + ((TextBox)Repeater1.Items[i].FindControl("tb_nota")).Text + "' as numeric(4,2) using 'PT-pt') ";
                query += "where cod_avaliacao = " + ((Label)Repeater1.Items[i].FindControl("lbl_cod")).Text + ";";


            }

            myConn.Open();
            SqlCommand myCommand = new SqlCommand(query, myConn);
            myCommand.ExecuteNonQuery();
            myConn.Close();
        }
    }
}