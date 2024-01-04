using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace exemplo_database
{
    public partial class pauta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<pauta_notas> lst_pauta = new List<pauta_notas>();

            string query = "select nome, disciplina, nota from tb_avaliacao";


            //conexao BD
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["atec_palConnectionString"].ConnectionString);

            SqlCommand myCommand = new SqlCommand(query, myConn);
            myConn.Open();

            SqlDataReader reader = myCommand.ExecuteReader();
            
            while (reader.Read()) { 
                pauta_notas notaObj = new pauta_notas();
                notaObj.nome = reader.GetString(0);
                notaObj.disciplina = reader.GetString(1);
                notaObj.nota = reader.GetDecimal(2);
                notaObj.estiloCSS = notaObj.nota < 10 ? "negativa" : "positiva";

                lst_pauta.Add(notaObj);
            }
            reader.Close();
            myConn.Close();

            rpt_pauta.DataSource = lst_pauta;
            rpt_pauta.DataBind();
        }

        //classe da bd
        public class pauta_notas
        {
            public string nome { get; set; }
            public string disciplina { get; set; }
            public decimal nota { get; set; }

            public string estiloCSS { get; set; }

        }
    }
}