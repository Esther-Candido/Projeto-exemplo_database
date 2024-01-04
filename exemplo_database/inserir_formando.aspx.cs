using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace exemplo_database
{
    public partial class inserir_formando : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_adicionar_Click(object sender, EventArgs e)
        {

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["atec_palConnectionString"].ConnectionString);

            SqlCommand myCommand = new SqlCommand();

            myCommand.Parameters.AddWithValue("@nome", tb_nome.Text);
            myCommand.Parameters.AddWithValue("@curso", ddl_curso.SelectedItem.ToString());
            myCommand.Parameters.AddWithValue("@email", tb_email.Text);
           
            myCommand.CommandText = "insert into tb_formandos values (@nome, @curso, @email)";
            
            myCommand.Connection = myConn;
            myConn.Open();
            myCommand.ExecuteNonQuery();
            myConn.Close();
        

        }

        protected void btn_adicionarSP_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["atec_palConnectionString"].ConnectionString);

            SqlCommand myCommand = new SqlCommand();

            myCommand.Parameters.AddWithValue("@nome", tb_nome.Text);
            myCommand.Parameters.AddWithValue("@curso", ddl_curso.SelectedItem.ToString());
            myCommand.Parameters.AddWithValue("@email", tb_email.Text);

            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.CommandText = "inserir_formando"; //ir no sql e criar esse Stored Procedures

            /* 
             CREATE PROCEDURE inserir_formando 
                    @nome as varchar(50),
	                @curso as varchar(50),
	                @email as varchar(100)
                AS
                BEGIN
	                -- SET NOCOUNT ON added to prevent extra result sets from
	                -- interfering with SELECT statements.
	                SET NOCOUNT ON;

                    insert into tb_formandos values (@nome,@curso,@email)
                END
                GO
       
            //depois de criar isso noSQL, executar dentro do SP pois n se salvar e sim executa. Reflesh e vai ver que a SP foi salva
             */

            

            myCommand.Connection = myConn;
            myConn.Open();
            myCommand.ExecuteNonQuery();
            myConn.Close();
        }
    }
}