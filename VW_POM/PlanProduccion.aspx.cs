using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.XtraPrinting;
using System.Text;
using DevExpress.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.ServiceModel.Channels;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.Security.Policy;


namespace VW_POM
{

    public partial class PlanProduccion : System.Web.UI.Page
    {
        void PlanLoad(string Machine)
        {
                this.ASPxGridView1.DataSource = MyData._SQLOperations.SQLDataTable(@"SELECT ID, Bahia, CutCode, SetCode, Relation, Locacion, Maquina, Tml1, Seal1, Tml2, Seal2, Cable, Calibre, Color, Length, Status, DOH, Cortar, [Cut?], 
Result, Release, Diferencia, InvTotal--, StatusMaterial, OrderMaquina 
FROM (
    SELECT DISTINCT 
        P.ID,U.Bahia,P.CutCode,P.SetCode,P.Relation,P.Location AS Locacion,P.Machine AS Maquina, 
        ISNULL(P.Tml1, '') AS Tml1,ISNULL(P.Seal1, '') AS Seal1,ISNULL(P.Tml2, '') AS Tml2,ISNULL(P.Seal2, '') AS Seal2, 
        ISNULL(P.Wire, '') AS Cable,P.SQ AS Calibre,P.Color,P.LengthCode AS Length,P.Status1 AS Status,P.DOH,P.Cortar, 
        P.Cut_Plan AS [Cut?],P.Result,P.Release,P.Diferencia,P.InvTotal--,MRK.ProductSend AS StatusMaterial,SUBSTRING(P.Machine, 6, 2) AS OrderMaquina 
    FROM Prod.PlanProduccion AS P 
    INNER JOIN Prod.UPH AS U ON LTRIM(RTRIM(P.Machine)) = LTRIM(RTRIM(U.Maquina)) 
    --LEFT OUTER JOIN Prod.Material_Requirement_Komax AS MRK ON MRK.CutCode = P.CutCode 
    WHERE (LTRIM(RTRIM(U.IPMachine)) LIKE '%"+Machine+@"%') 
        AND (P.DOH <= 5) 
        AND (P.Area = 'Plan de Corte')
) AS x 
--ORDER BY OrderMaquina");
                this.ASPxGridView1.DataBind();
        }
        private string _CutCode = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] computer_name = System.Net.Dns.GetHostEntry(Request.ServerVariables["remote_addr"]).HostName.Split(new Char[] { '.' });
            String ecn = System.Environment.MachineName;

            string ComputerName = computer_name[0].ToString();
            /*string ComputerName = "SAP-80-1007";
            this.HiddenField1.Value = ComputerName;*/
            
            DataTable dtUPH = MyData._SQLOperations.SQLDataTable("Select * from Prod.UPH where IPMachine ='" + ComputerName + "'");//'" + ComputerName + "'
            if (dtUPH.Rows.Count > 0)
            {
                this.HiddenField3.Value = dtUPH.Rows[0]["Maquina"].ToString();
                this.Panel2.Visible = false;             
                this.ASPxButton1.Visible = false;
                PlanLoad(ComputerName);
                }
            else
            {
                this.HiddenField1.Value = "%";
                //this.HiddenField3.Value = "CTKX-16";
                this.Panel1.Visible = false;
                ASPxButton4.Visible = false;
            }
            this.Label1.Text = "Plan de Produccion Corte  | Maquina: " + this.HiddenField3.Value;
            if (IsPostBack == false)
            {
                // this.Panel1.Visible = false; //deshabilitado por ever - 31 de Marzo 2023
                this.Panel2.Visible = false;
            }
            // Console.WriteLine(this.HiddenField3.Value);
            this.ASPxGridView7.DataBind();
          
            //SqlConnection cnm = new SqlConnection(@"Data Source= HNCRSAP-SQL01 ;Initial Catalog=HEDS ;User ID=sa;Password=Lear2005" + ";Connect Timeout = 999990000");
            //using (SqlCommand cmd = new SqlCommand("Select SetCode=' ' union all Select distinct CutCode from Prod.PlanProduccion P join Prod.UPH U on ltrim(rtrim(P.Machine)) = ltrim(rtrim(U.Maquina)) where P.DOH <= 5 and P.Area = 'Plan de Corte' and P.CutCode not in ( Select Product from Prod.Material_Requirement_Komax where ProductSend is null)"))
            //{
            //    cmd.CommandType = CommandType.Text;
            //    cmd.Connection = cnm;
            //    cnm.Open();
            //    ddCircuito.DataSource = cmd.ExecuteReader();
            //    ddCircuito.DataTextField = "SetCode";
            //    ddCircuito.DataValueField = "SetCode";
            //    ddCircuito.DataBind();
            //    cnm.Close();
            //}

            TextBox3.Focus();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            // Exporter.WritePdfToResponse(new PdfExportOptions() { ShowPrintDialogOnOpen = true });
            //this.Panel1.Visible = false; //deshabilitado por ever - 31 deMArzo 2023
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.Cell != null)
            {

                //e.Cell.Attributes.Add("onclick", "ShowEditPopup('" + e.Cell.ClientID + "','" + e.DataColumn.FieldName + "','" + e.KeyValue + "','" + e.CellValue + "');");
                //e.Cell.Attributes.Add("onclick", "ShowEditPopup('" + e.Cell.ClientID + "','" + e.DataColumn.FieldName + "','" + e.KeyValue + "','" + e.CellValue + "');");
                //e.Cell.Attributes.Add("onclick", "ShowEditPopup('" + e.Cell.ClientID + "','" + e.DataColumn.FieldName + "','" + e.KeyValue + "','" + str + "');");
                //e.Cell.Attributes.Add("onclick", "ShowEditPopup('" + e.Cell.ClientID + "','" + e.DataColumn.FieldName + "','" + e.KeyValue + "','" + sb.ToString() + "');");
                //e.Cell.Attributes.Add("onclick", "ShowEditPopup('" + e.Cell.ClientID + "','" + e.DataColumn.FieldName + "','" + e.KeyValue + "','" + HttpUtility.HtmlEncode(sb.ToString()) + "');");
            }
        }

        protected void ASPxButton4_Click(object sender, EventArgs e)
        {
            this.Panel1.Visible = true;
        }
        protected void ASPxButton1_Click1(object sender, EventArgs e)
        {
            this.Panel2.Visible = true;
        }
        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                throw;
            }
        }

        protected void ASPxGridView1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            //if (e.RowType != GridViewRowType.Data) return;
            //int QtySend = Convert.ToInt32(e.GetValue("StatusMaterial"));
            //string Tkt = Convert.ToString(e.GetValue("Tml1"));
            //if (Tkt.ToString().Length>0)
            //{

            //}
            //if (QtySend == 1)
            //{
            //    e.Row.BackColor = System.Drawing.Color.LightSkyBlue;
            //}
            //if (QtySend == 2)
            //{
            //    e.Row.BackColor = System.Drawing.Color.LightYellow;
            //}
            //if (QtySend == 3)
            //{
            //    e.Row.BackColor = System.Drawing.Color.LightSkyBlue;
            //}
        }

        protected void ASPxComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.HiddenField2.Value = Convert.ToString(this.ASPxComboBox1.Value);
            this.ASPxGridView2.DataBind();
            this.TmlControl.Text = null;
            string consulta_ticket = "Select D.ID,D.Tml1,D.SQ,D.Color from (Select P.ID,Tml1,SQ = '',Color = ''from Prod.PlanProduccion P join Prod.UPH U on ltrim(rtrim(P.Machine)) = ltrim(rtrim(U.Maquina)) where P.DOH <= 5 and P.Area = 'Plan de Corte' and CutCode = '" + this.HiddenField2.Value + "' union all Select P.ID,Tml2,SQ = '',Color = '' from Prod.PlanProduccion P join Prod.UPH U on ltrim(rtrim(P.Machine)) = ltrim(rtrim(U.Maquina)) where P.DOH <= 5 and P.Area = 'Plan de Corte' and CutCode = '" + this.HiddenField2.Value + "' union all Select P.ID,Seal1 = ISNULL(Seal1, ''),SQ = '',Color = '' from Prod.PlanProduccion P  join  Prod.UPH U on ltrim(rtrim(P.Machine)) = ltrim(rtrim(U.Maquina)) where P.DOH <= 5 and P.Area = 'Plan de Corte' and CutCode = '" + this.HiddenField2.Value + "' union all Select P.ID,Seal2 = ISNULL(Seal2, ''),SQ = '',Color = '' from Prod.PlanProduccion P join Prod.UPH U on ltrim(rtrim(P.Machine)) = ltrim(rtrim(U.Maquina)) where P.DOH <= 5 and P.Area = 'Plan de Corte' and CutCode = '" + this.HiddenField2.Value + "' union all Select P.ID,Wire = CAST(Wire as varchar),SQ = CAST(SQ as varchar),Color from Prod.PlanProduccion P join Prod.UPH U on ltrim(rtrim(P.Machine))= ltrim(rtrim(U.Maquina)) where P.DOH <= 5 and P.Area ='Plan de Corte' and CutCode = '" + this.HiddenField2.Value + "' ) D where D.Tml1 > '' and D.SQ = ''";

            DataTable dtx = MyData._SQLOperations.SQLDataTable(consulta_ticket);
            if (dtx.Rows.Count > 0)
            {
                for (int ix = 0; ix < dtx.Rows.Count; ix++)
                {
                    string terminal1 = dtx.Rows[ix]["TML1"].ToString();
                    string ID = dtx.Rows[ix]["ID"].ToString();

                    string consulta = "select partnum from [HEDS].[Mat].[tblTmls] where tkic='" + terminal1 + "'";
                    DataTable dtx1 = MyData._SQLOperations.SQLDataTable(consulta);
                    if (dtx1.Rows.Count > 0)
                    {
                        string terminal_Almacen = dtx1.Rows[0]["partnum"].ToString();

                        string consulta1 = "SELECT PARTNUM FROM [HEDS].[Mat].[tblRegistro] WHERE PartNum = '" + terminal_Almacen + " ' AND STAT = '1'";
                        DataTable dtx2 = MyData._SQLOperations.SQLDataTable(consulta1);
                        if (dtx2.Rows.Count > 0)
                        {
                            string javaScriptCritico = "MaterialCritico();";
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", javaScriptCritico, true);
                            string inicio = "";
                            string pleca = "";
                            string xxx = dtx.Rows[ix]["TML1"].ToString();
                            this.TmlControl.Text = inicio + pleca + xxx;
                            pleca = " | ";
                            inicio = this.TmlControl.Text;
                        }
                        this.ASPxGridView7.DataBind();
                    }
                }
            }
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {
            try
            {                                              
               
                this.TmlControl.Text = null;
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                DataTable dt_HEDS = new DataTable();
                DataSet ds_HEDS = new DataSet();
                SqlConnection dataConnection = new SqlConnection("Data Source=192.168.155.13;Initial Catalog=HIMES_HEDS;User ID=PlantMachine ;Password=plantmachine1015 ;Connect Timeout = 999990000");
                //SqlConnection dataConnection = new SqlConnection("Data Source=192.168.155.13;Initial Catalog=HIMES_HEDS;User ID=PlantSupport ;Password=plantsupport1522 ;Connect Timeout = 999990000");
                SqlConnection dataConnection_HEDS = new SqlConnection("Data Source=HNCRSAP-SQL01;Initial Catalog=HEDS;User ID=hedsDB;Password=HedsDB214;Connect Timeout = 999990000");
                //SqlDataAdapter da = new SqlDataAdapter("[dbo].[Km_Job_Order_Plan_Barcode_Check]", dataConnection);
                //da.SelectCommand.CommandType = CommandType.StoredProcedure;
                //da.SelectCommand.Parameters.AddWithValue("@strBarcode", this.TextBox4.Text);
                //da.SelectCommand.Parameters.AddWithValue("@IpAddress", "''");
                //da.Fill(dt);
                //DataView dtview = new DataView(dt);
                //DataTable _dtdt2 = dtview.ToTable(false, "Flag", "FlagMsg", "Barcode", "MachineName", "LotNo", "JobNo", "JobDate", "SetCount", "BunchCount", "WireName", "WireSQ", "WireColor", "WireLen", "WireCode", "Strip1", "Terminal1", "Seal1", "Strip2",
                //                                         "Terminal2", "Seal2", "TmlPressId1", "Height1", "Height2", "CCW1", "CCW2", "ICH1", "ICH2", "ICW1", "ICW2", "SetCode", "Circuit", "SplitNo", "Posttension", "ProcessCode", "ProcessNameSimple",
                //                                         "TwistedLength", "Remark1", "CommonCutWireCode", "RelationType");

                string consultax = @"Set Transaction Isolation Level Read Uncommitted;                                   
                                    Select T1.CommonCutWireCode, T1.Tml1 AS 'Terminal1', T1.Tml2 AS 'Terminal2'
                                    From [dbo].[TMES_PROCESSORDER_CIRCUITAUTO] As T1 With(Nolock)
                                    Where T1.[MesSiteCode] = 7 -- Fixed value for HEDS
                                    And T1.[UniqueID] = '" + TextBox4.Text + "'";

                Console.WriteLine(consultax);
                DataTable _dtdt2 = MyData._SQLOperationsKL2.SQLDataTable(consultax);

                if (_dtdt2.Rows.Count == 0)
                {
                    string _t = "Información";
                    string _tx = "El ticket que escaneo " + TextBox4.Text.Trim() + ", no se encuentra registrado en HIMESS o no pertenece al proceso, por favor valide los registros con el area de HIMESS";
                    string _ty = "warning";
                    string _bc = "btn-info";
                    string javaScript = "Mensaje('" + _t + "','" + _tx + "','" + _ty + "','" + _bc + "');";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", javaScript, true);
                    TextBox4.Text = "";
                    TextBox4.Focus();
                    return;
                }

                /*string _consulta = @"
                        SELECT DOH 
                        FROM [HEDS].[Prod].[PlanProduccion] 
                        where DOH > 5 and CutCode = '"+ _dtdt2.Rows[0]["CommonCutWireCode"].ToString() + "'";

                Console.WriteLine(_consulta);
                DataTable _dt = MyData._SQLOperations.SQLDataTable(_consulta);

                if (_dt.Rows.Count > 0)
                {
                    string _t="Información";
                    string _tx = "Los dias en mano(DOH) de este CIRCUITO segun sistema esta en: "+ _dt.Rows[0]["DOH"].ToString() + " Por favor reportarlo a su supervisor, para que validen el inventario fisico del circuito";
                    string _ty = "warning";
                    string _bc = "btn-info";
                    string javaScript = "Mensaje('"+_t+"','"+_tx+"','"+_ty+"','"+_bc+"');";                   
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", javaScript, true);
                    //TmlControl0.Text = _tx;
                }*/
                
                //ds.Tables.Add(_dtdt2);
                if (_dtdt2.Rows.Count > 0)
                {
                    this.HiddenField2.Value = _dtdt2.Rows[0]["CommonCutWireCode"].ToString();
                    _CutCode = _dtdt2.Rows[0]["CommonCutWireCode"].ToString();
                    string terminal1 = _dtdt2.Rows[0]["Terminal1"].ToString();
                    string terminal2 = _dtdt2.Rows[0]["Terminal2"].ToString();
                    this.ASPxGridView2.DataBind();
                    //Response.Redirect("#");   //REINICIA LA PAGINA.

                    //CONSULTAMOS DONDE ESTA ESTA TERMINAL PARA INDICAR AL USUARIO DONDE PUEDE IR A BUSARLA
                    /*
                        0. Pendiente
                        1. En Proceso
                        2. Disponible para Entrega
                        3. Recibido
                    */

                    string query_terminal = @"SELECT [Id]
                            ,[ReceiveMachine]
                        FROM [HEDS].[Prod].[Material_Requirement_Komax]
                        WHERE Product = '" + terminal1 + "' AND [Estado] = 3 AND [ReceiveMachine] IS NOT NULL AND CAST([RequestDate] AS DATE) = CAST(GETDATE() AS DATE)";
                    DataTable dtConsulta = MyData._SQLOperations.SQLDataTable(query_terminal);

                    if (dtConsulta.Rows.Count > 0)
                    {
                        string MaquinaRecibida = dtConsulta.Rows[0]["ReceiveMachine"].ToString();
                        string _t = "Información";
                        string _tx = "El ticket que escaneo " + TextBox4.Text.Trim() + ", con la terminal " + terminal1 + ", se encuentra en la maquina " + MaquinaRecibida + ", por favor validar en el área antes de hacer la solicitud del material";
                        string _ty = "warning";
                        string _bc = "btn-info";
                        string javaScript = "Mensaje('" + _t + "','" + _tx + "','" + _ty + "','" + _bc + "');";
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", javaScript, true);
                    }
                    
                    string consulta = "select partnum from [HEDS].[Mat].[tblTmls] where tkic='" + terminal1 + "' or tkic='" + terminal2 + "'";
                    DataTable dtx1 = MyData._SQLOperations.SQLDataTable(consulta);

                    if (dtx1.Rows.Count > 0)
                    {
                        string terminal_Almcen = dtx1.Rows[0]["partnum"].ToString();

                        //INICIO CALCULO DE REQUERIMIENTOS SEMANAL
                        double reqDiario = 0.00;
                        double reqSemanal = 0.00;
                        double EntregadoPzs = 0.00;

                        string _queryReqD = @"
                            Set Transaction Isolation Level Read Uncommitted;
                            Declare @QADPno As Nvarchar(max) = N''
                            Select @QADPno = N'" + terminal_Almcen + @"'
                            SELECT Daily 
                            FROM [HEDS].[Mat].[tblREQs] With (Nolock)
                            WHERE PARTNUM = @QADPno";
                        DataTable dtx2_ReqD = MyData._SQLOperations.SQLDataTable(_queryReqD);

                        if (dtx2_ReqD.Rows.Count > 0)
                        {
                            reqDiario = Convert.ToDouble(dtx2_ReqD.Rows[0]["Daily"].ToString());
                            reqSemanal = reqDiario * 5;
                        }

                        //LLENAR EL REQUERIMIENTO SEMANAL PZS
                        string _qrySumaSalio = @"
                                Set Transaction Isolation Level Read Uncommitted;
                                Declare @QADPno As Nvarchar(max) = N''
                                Select @QADPno = N'" + terminal_Almcen + @"'
                                SELECT QtySalidas
                                       ,([Daily]*5) as 'Req'
                                        ,Saldo 
                                FROM qrySumaSalio With (Nolock)
                                WHERE QADPno = @QADPno";

                        DataTable dtx2_SumaSalio = MyData._SQLOperations.SQLDataTable(_qrySumaSalio);

                        if (dtx2_SumaSalio.Rows.Count > 0)
                        {
                            EntregadoPzs = Convert.ToDouble(dtx2_SumaSalio.Rows[0]["QtySalidas"].ToString());
                        }

                        if (EntregadoPzs > reqSemanal)
                        {
                            string _t = "Información";
                            string _tx = "El ticket que escaneo " + TextBox4.Text.Trim() + ", excede el requerimiento semanal.";
                            string _ty = "warning";
                            string _bc = "btn-info";
                            string javaScript = "Mensaje('" + _t + "','" + _tx + "','" + _ty + "','" + _bc + "');";
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", javaScript, true);
                            TextBox4.Text = "";
                            TextBox4.Focus();
                        }
                        //FIN CALCULO DE REQUERIMIENTOS SEMANAL

                        //Consulta Material Controlado
                        string consultaCritico = "select partnum from [HEDS].[Mat].[tblRegistro] where PartNum='" + terminal_Almcen + "' and STAT=1";
                        DataTable dtxCritico = MyData._SQLOperations.SQLDataTable(consultaCritico);
                        if (dtxCritico.Rows.Count > 0)
                        {
                            string javaScript = "MaterialCritico();";
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", javaScript, true);
                            string inicio = "";
                            for (int i = 0; i < _dtdt2.Rows.Count; i++)
                            {
                                string xxx = _dtdt2.Rows[i]["Terminal1"].ToString();
                                string xxx2 = _dtdt2.Rows[i]["Terminal2"].ToString();
                                this.TmlControl.Text = inicio + " | " + xxx + " | " + xxx2;
                                inicio = this.TmlControl.Text;
                            }
                            this.ASPxGridView7.DataBind();
                        }                       
                    }
                }
            }
            catch (Exception ex)
            {
                string _t = "Información";
                string _tx = ex.ToString();
                string _ty = "warning";
                string _bc = "btn-info";
                string javaScript = "Mensaje('" + _t + "','" + _tx + "','" + _ty + "','" + _bc + "');";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", javaScript, true);
            }

        }

        protected void btnSendData_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ImageButton btn = (ImageButton)sender;
                int start = ASPxGridView2.PageIndex * ASPxGridView2.SettingsPager.PageSize;
                int end = (ASPxGridView2.PageIndex + 1) * ASPxGridView2.SettingsPager.PageSize;
                Console.WriteLine("start " + start);
                Console.WriteLine("end " + end);

                GridViewDataColumn column1 = ASPxGridView2.Columns["ASPxTextBox1"] as GridViewDataColumn;
                for (int i = start; i < end; i++)
                {
                    string _consulta_____ = @"
                        SELECT DOH 
                        FROM [HEDS].[Prod].[PlanProduccion] 
                        where DOH > 5 and CutCode = '" + _CutCode + "'";

                    Console.WriteLine(_consulta_____);
                    DataTable _dt___ = MyData._SQLOperations.SQLDataTable(_consulta_____);

                    if (_dt___.Rows.Count > 0)
                    {
                        string _t = "Información";
                        string _tx = "Los dias en mano(DOH) de este CIRCUITO segun sistema esta en: " + _dt___.Rows[0]["DOH"].ToString() + " Por favor reportarlo a su supervisor, para que validen el inventario fisico del circuito";
                        string _ty = "warning";
                        string _bc = "btn-info";
                        string javaScript = "Mensaje('" + _t + "','" + _tx + "','" + _ty + "','" + _bc + "');";
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", javaScript, true);
                        //TmlControl0.Text = _tx;
                    }


                    ASPxTextBox txtQuantity = (ASPxTextBox)ASPxGridView2.FindRowCellTemplateControl(i, column1, "ASPxTextBox1");
                    if (txtQuantity != null)
                    {                      
                        if (txtQuantity.Text.Length > 0)
                        {
                            if (Convert.ToInt32(txtQuantity.Text) > 5)
                            {
                                string _t = "Información";
                                string _tx = $"La cantidad a solicitar {txtQuantity.Text}, no puede ser mayor que 5";
                                string _ty = "warning";
                                string _bc = "btn-info";
                                string javaScript = "Mensaje('" + _t + "','" + _tx + "','" + _ty + "','" + _bc + "');";
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", javaScript, true);
                                txtQuantity.Focus();

                                return;
                            }

                            if (Convert.ToInt32(txtQuantity.Text) < 0)
                            {
                                string _t = "Información";
                                string _tx = $"La cantidad a solicitar {txtQuantity.Text}, no puede ser menor que 0";
                                string _ty = "warning";
                                string _bc = "btn-info";
                                string javaScript = "Mensaje('" + _t + "','" + _tx + "','" + _ty + "','" + _bc + "');";
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", javaScript, true);
                                txtQuantity.Focus();

                                return;
                            }

                            var script = @"Select D.ID,D.Machine,D.Tml1,D.SQ,D.Color 
                                                                                from (
                                                                                    Select P.ID, p.Machine , Tml1, SQ = '0', Color = ''
                                                                                    from Prod.PlanProduccion P

                                                                                        join Prod.UPH U on ltrim(rtrim(P.Machine)) = ltrim(rtrim(U.Maquina))
                                                                                    where  P.Area = 'Plan de Corte' and CutCode = '" + this.HiddenField2.Value + @"'
                                                                                    union all
                                                                                    Select P.ID, p.Machine , Tml2, SQ = '0', Color = ''
                                                                                    from Prod.PlanProduccion P

                                                                                        join Prod.UPH U on ltrim(rtrim(P.Machine)) = ltrim(rtrim(U.Maquina))
                                                                                    where  P.Area = 'Plan de Corte' and CutCode = '" + this.HiddenField2.Value + @"'
                                                                                    union all
                                                                                    Select P.ID, p.Machine , Seal1 = ISNULL(Seal1, ''), SQ = '0', Color = ''
                                                                                    from Prod.PlanProduccion P

                                                                                        join Prod.UPH U on ltrim(rtrim(P.Machine)) = ltrim(rtrim(U.Maquina))
                                                                                    where  P.Area = 'Plan de Corte' and CutCode = '" + this.HiddenField2.Value + @"'
                                                                                    union all
                                                                                    Select P.ID, p.Machine , Seal2 = ISNULL(Seal2, ''), SQ = '0', Color = ''
                                                                                    from Prod.PlanProduccion P

                                                                                        join Prod.UPH U on ltrim(rtrim(P.Machine)) = ltrim(rtrim(U.Maquina))
                                                                                    where  P.Area = 'Plan de Corte' and CutCode = '" + this.HiddenField2.Value + @"'
                                                                                    union all
                                                                                    Select P.ID, p.Machine , Wire = d.Wire_Name, SQ = CAST(P.SQ as varchar), P.Color
                                                                                    from Prod.PlanProduccion P
                                                                                        join Prod.UPH U on ltrim(rtrim(P.Machine)) = ltrim(rtrim(U.Maquina))
		                                                                                join [HEDS].[Prod].[Details2] d ON P.CutCode = d.CutCode
                                                                                    where  P.Area = 'Plan de Corte' and P.CutCode = '" + this.HiddenField2.Value + @"') D 
                                                                            where D.Tml1 > '' and D.Tml1 ='" + btn.CommandArgument + "'";
                            Console.WriteLine(script);
                            DataTable dtx = MyData._SQLOperations.SQLDataTable(script);

                            var _validaquery = @"Select *
                                            from (
		                                            Select *,Turno=case when CONVERT(VARCHAR(5),RequestDate,108)>='06:00:00.000' and CONVERT(VARCHAR(5),RequestDate,108)<='14:47:59.000' then 1
							                                            when CONVERT(VARCHAR(5),RequestDate,108)>='14:48:00.000' and CONVERT(VARCHAR(5),RequestDate,108)<='23:14:59.000' then 2 else 3 end
		                                            from     Prod.Material_Requirement_Komax K)dt
                                            where dt.SendDate is null 
	                                            and CAST(dt.RequestDate as date)=case when dt.Turno=3 then CAST(GETDATE()-1 as date) else CAST(GETDATE() as date) end 
	                                            and dt.Turno= case when CONVERT(VARCHAR(5),getdate(),108)>='06:00:00.000' and CONVERT(VARCHAR(5),getdate(),108)<='14:47:59.000' then 1
			                                                        when CONVERT(VARCHAR(5),getdate(),108)>='14:48:00.000' and CONVERT(VARCHAR(5),getdate(),108)<='23:14:59.000' then 2 else 3 end
	                                            and dt.Product='" + btn.CommandArgument + "' and dt.Machine='" + this.HiddenField3.Value + "' and Estado in('0','1','2')";
                            DataTable dtExists = MyData._SQLOperations.SQLDataTable(_validaquery);
                            if (dtExists.Rows.Count > 0) // VALIDACION QUE PERMITIRA PEDIR MAS MATERIAL A ALMACEN
                            {
                                //this.Page.Response.Write("<script language='JavaScript'>window.alert('Information: Producto ya fue solicitado, Esperar que sea entregado');</script>");
                                string _consulta = @"Select *
                                            from (
		                                            Select *,Turno=case when CONVERT(VARCHAR(5),RequestDate,108)>='06:00:00.000' and CONVERT(VARCHAR(5),RequestDate,108)<='14:47:59.000' then 1
							                                            when CONVERT(VARCHAR(5),RequestDate,108)>='14:48:00.000' and CONVERT(VARCHAR(5),RequestDate,108)<='23:14:59.000' then 2 else 3 end
		                                            from     Prod.Material_Requirement_Komax K)dt
                                            where dt.SendDate is null 
	                                            and CAST(dt.RequestDate as date)=case when dt.Turno=3 then CAST(GETDATE()-1 as date) else CAST(GETDATE() as date) end 
	                                            and dt.Turno= case when CONVERT(VARCHAR(5),getdate(),108)>='06:00:00.000' and CONVERT(VARCHAR(5),getdate(),108)<='14:47:59.000' then 1
			                                                        when CONVERT(VARCHAR(5),getdate(),108)>='14:48:00.000' and CONVERT(VARCHAR(5),getdate(),108)<='23:14:59.000' then 2 else 3 end
	                                            and dt.Product='" + btn.CommandArgument + "' and dt.Machine='" + this.HiddenField3.Value + "'";
                                string _estado = "";
                                DataTable _dt = MyData._SQLOperations.SQLDataTable(_consulta);
                                if (_dt.Rows.Count > 0)
                                {
                                    if (_dt.Rows[0]["Estado"].ToString() == "0")
                                    {
                                        _estado = "RECIBIDO EN ALMACEN";
                                    }
                                    if (_dt.Rows[0]["Estado"].ToString() == "1")
                                    {
                                        _estado = "EN PROCESO";
                                    }
                                    if (_dt.Rows[0]["Estado"].ToString() == "2")
                                    {
                                        _estado = "DISPONIBLE PARA ENTREGA";
                                    }
                                    if (_dt.Rows[0]["Estado"].ToString() == "3")
                                    {
                                        _estado = "ENTREGADO";
                                    }
                                }

                                string _t = _estado;
                                string _tx = "Material con el siguiente estado: " + _estado + ".   Esperar que sea entregado,....    Recuerda, escanerlo para completar el proceso de entrega, de lo contrario no podra solicitar el mismo material.";
                                string _ty = "warning";
                                string _bc = "btn-info";
                                string javaScript = "Mensaje('" + _t + "','" + _tx + "','" + _ty + "','" + _bc + "');";
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", javaScript, true);
                                return;
                            }
                            //Console.WriteLine(Convert.ToString(dtx.Rows[0]["Tml1"].ToString()));
                            string Query = @"Insert into [Prod].[Material_Requirement_Komax] ([CutCode],[Machine],Product,SQ,Color,[Qty],[RequestDate],[RequestUser],[Estado]) 
                                    values ('" + this.HiddenField2.Value + "','" + this.HiddenField3.Value + "','" + dtx.Rows[0]["Tml1"].ToString() + "','" + dtx.Rows[0]["SQ"] + @"',
                                            '" + dtx.Rows[0]["Color"].ToString() + "'," + txtQuantity.Text + ",Getdate(),'" + TextBox3.Text.ToString() + "','0')";
                            Console.WriteLine(Query);
                            MyData._SQLOperations.SQLCommand(Query);
                            this.ASPxGridView2.DataBind();
                            this.ASPxGridView3.DataBind();
                            this.ASPxGridView7.DataBind();
                        }
                    }                                                          
                }
            }
            catch (NullReferenceException ex1)
            {
                Console.WriteLine(ex1.Message);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        protected void ASPxButton5_Click(object sender, EventArgs e)
        {
            //this.Panel1.Visible = false; //deshabilitado por ever - 31 deMArzo 2023
            this.Panel2.Visible = false;
        }

        protected void ASPxButton6_Click(object sender, EventArgs e)
        {
            this.ASPxGridView1.DataBind();
            this.ASPxGridView3.DataBind();
            this.ASPxGridView4.DataBind();
            this.ASPxGridView5.DataBind();
            this.ASPxGridView6.DataBind();
            this.ASPxGridView7.DataBind();
        }

        protected void txtTrokel_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (TextBox3.Text.Length == 0)
                {
                    this.Page.Response.Write("<script language='JavaScript'>window.alert('Information: Especificar un # Gafete Valido');</script>");
                    return;
                }
                DataTable dtValidaGafete = new DataTable();
                dtValidaGafete = MyData._SQLOperations.SQLDataTable("Select * from Coffe.Empleados where Num_Gafete='" + TextBox3.Text + "'");
                if (dtValidaGafete.Rows.Count == 0)
                {
                    this.Page.Response.Write("<script language='JavaScript'>window.alert('Information: Codigo de Gafete No valido, Revisar');</script>");
                    return;
                }
                var Validar = @"Update Prod.Tokel_in_Machine set Status='False' where Trokel='" + this.txtTrokel.Text.Trim().ToString() + @"' and Status='True'";
                var Query = @"Insert into Prod.Tokel_in_Machine (CodEmployee,Machine,Shift,Trokel,RegisterDate,Status) 
                          values ('" + this.TextBox3.Text + "','" + this.HiddenField3.Value + @"',(Select case when CONVERT(VARCHAR(5),getdate(),108)>='06:00:00.000' and CONVERT(VARCHAR(5),getdate(),108)<='14:47:59.000' then 1
                                                                                                               when CONVERT(VARCHAR(5),getdate(),108)>= '14:48:00.000' and CONVERT(VARCHAR(5),getdate(),108)<= '23:14:59.000' then 2 else 3 end),'" + this.txtTrokel.Text.Trim().ToString() + @"',Getdate(),'True')";
                MyData._SQLOperations.SQLCommand(Validar);
                MyData._SQLOperations.SQLCommand(Query);
                this.txtTrokel.Text = "";
                this.txtTrokel.Focus();
                this.ASPxGridView4.DataBind();
                this.ASPxGridView5.DataBind();
                //this.ASPxGridView6.DataBind();
                //this.ASPxGridView7.DataBind();
            }
            catch (Exception)
            {

            }

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            TextBox4.Focus();
        }
        Connexion con = new Connexion();
        protected void TextBox7_TextChanged(object sender, EventArgs e)
        {
            //if (con.actualizar("Prod.Material_Requirement_Komax", "Estado='3'", " Product='" + TextBox7.Text.Trim() + "' and Machine='" + this.HiddenField3.Value + "' and Estado='2'"))
            if (con.actualizar("Prod.Material_Requirement_Komax", "Estado='3', ReceiveMachine='" + this.HiddenField3.Value + "', CompleteDate = getdate()", "ID='" + TextBox7.Text.Trim() +"' and Estado='2'"))
            {
                string _t = "Completado";
                string _tx = "Material Recibido correctamente.";
                string _ty = "success";
                string _bc = "btn-success";
                string javaScript = "Mensaje('" + _t + "','" + _tx + "','" + _ty + "','" + _bc + "');";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", javaScript, true);
                TextBox7.Text = "";             
            }
            else
            {
                string _t = "Advertencia";
                string _tx = "MATERIAL NO HA SIDO PROCESADO POR EL AREA DE ALMACEN,  PORFAVOR DEVUELVA EL MATERIAL PARA SU DEBIDO PROCESO DE ESCANEO.";
                string _ty = "warning";
                string _bc = "btn-warning";
                string javaScript = "Mensaje('" + _t + "','" + _tx + "','" + _ty + "','" + _bc + "');";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", javaScript, true);
                TextBox7.Text = "";
            }

            this.ASPxGridView7.DataBind();

            //var Validar = @"Update Prod.Material_Requirement_Komax set Estado='3' where Product='" + TextBox7.Text.Trim() + "' and Machine='" + this.HiddenField3.Value + "' and Estado='2'";
            //    if (MyData._SQLOperations.SQLCommand(Validar) ==true)
            //    {    

            //    }

        }

        protected void ASPxGridView7_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
          
        }

        protected void ASPxGridView7_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName != "Estado")
                return;
            if (e.CellValue.ToString() == "SOLICITUD ENVIADA") { 
                e.Cell.BackColor = System.Drawing.Color.OrangeRed;
            e.Cell.ForeColor = System.Drawing.Color.White; }
            if (e.CellValue.ToString() == "EN PROCESO")
                e.Cell.BackColor = System.Drawing.Color.Yellow;
            if (e.CellValue.ToString() == "EN ESTANTE PARA RECOGER")
                e.Cell.BackColor = System.Drawing.Color.GreenYellow;
            if (e.CellValue.ToString() == "RECIBIDA") { 
                e.Cell.BackColor = System.Drawing.Color.BlueViolet;
                e.Cell.ForeColor = System.Drawing.Color.White;
            }
        }

        protected void ddCircuito_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.HiddenField2.Value = Convert.ToString(this.ddCircuito.SelectedItem.Value);
            this.ASPxGridView2.DataBind();
            this.TmlControl.Text = null;
            string consulta_ticket = "Select D.ID,D.Tml1,D.SQ,D.Color from (Select P.ID,Tml1,SQ = '',Color = ''from Prod.PlanProduccion P join Prod.UPH U on ltrim(rtrim(P.Machine)) = ltrim(rtrim(U.Maquina)) where P.DOH <= 5 and P.Area = 'Plan de Corte' and CutCode = '" + this.HiddenField2.Value + "' union all Select P.ID,Tml2,SQ = '',Color = '' from Prod.PlanProduccion P join Prod.UPH U on ltrim(rtrim(P.Machine)) = ltrim(rtrim(U.Maquina)) where P.DOH <= 5 and P.Area = 'Plan de Corte' and CutCode = '" + this.HiddenField2.Value + "' union all Select P.ID,Seal1 = ISNULL(Seal1, ''),SQ = '',Color = '' from Prod.PlanProduccion P  join  Prod.UPH U on ltrim(rtrim(P.Machine)) = ltrim(rtrim(U.Maquina)) where P.DOH <= 5 and P.Area = 'Plan de Corte' and CutCode = '" + this.HiddenField2.Value + "' union all Select P.ID,Seal2 = ISNULL(Seal2, ''),SQ = '',Color = '' from Prod.PlanProduccion P join Prod.UPH U on ltrim(rtrim(P.Machine)) = ltrim(rtrim(U.Maquina)) where P.DOH <= 5 and P.Area = 'Plan de Corte' and CutCode = '" + this.HiddenField2.Value + "' union all Select P.ID,Wire = CAST(Wire as varchar),SQ = CAST(SQ as varchar),Color from Prod.PlanProduccion P join Prod.UPH U on ltrim(rtrim(P.Machine))= ltrim(rtrim(U.Maquina)) where P.DOH <= 5 and P.Area ='Plan de Corte' and CutCode = '" + this.HiddenField2.Value + "' ) D where D.Tml1 > '' and D.SQ = ''";

            DataTable dtx = MyData._SQLOperations.SQLDataTable(consulta_ticket);
            if (dtx.Rows.Count > 0)
            {
                for (int ix = 0; ix < dtx.Rows.Count; ix++)
                {
                    string terminal1 = dtx.Rows[ix]["TML1"].ToString();
                    string ID = dtx.Rows[ix]["ID"].ToString();

                    string consulta = "select partnum from [HEDS].[Mat].[tblTmls] where tkic='" + terminal1 + "'";
                    DataTable dtx1 = MyData._SQLOperations.SQLDataTable(consulta);
                    if (dtx1.Rows.Count > 0)
                    {
                        string terminal_Almacen = dtx1.Rows[0]["partnum"].ToString();

                        string consulta1 = "SELECT PARTNUM FROM [HEDS].[Mat].[tblRegistro] WHERE PartNum = '" + terminal_Almacen + " ' AND STAT = '1'";
                        DataTable dtx2 = MyData._SQLOperations.SQLDataTable(consulta1);
                        if (dtx2.Rows.Count > 0)
                        {
                            string javaScriptCritico = "MaterialCritico();";
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", javaScriptCritico, true);
                            string inicio = "";
                            string pleca = "";
                            string xxx = dtx.Rows[ix]["TML1"].ToString();
                            this.TmlControl.Text = inicio + pleca + xxx;
                            pleca = " | ";
                            inicio = this.TmlControl.Text;
                        }
                        this.ASPxGridView7.DataBind();
                    }
                }
            }
        }

        protected void ASPxButton7_Click(object sender, EventArgs e)
        {
            // Supongamos que esta es tu URL de destino
            string url = "http://hncrsap-sql01:2030/";

            // Genera el script JavaScript para abrir la URL en una nueva pestaña
            string script = "window.open('" + url + "', '_blank');";

            // Registra el script en la página
            ClientScript.RegisterStartupScript(this.GetType(), "openWindow", script, true);
        }



        //[WebMethod]
        //public static List<DropDownItem> GetDropDownData()
        //{
        //    List<DropDownItem> dropDownListData = new List<DropDownItem>();

        //    string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
        //    string query = "SELECT Valor, Texto FROM TablaEjemplo"; // Replace with your SQL query

        //    using (SqlConnection con = new SqlConnection(connectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand(query, con))
        //        {
        //            con.Open();
        //            SqlDataReader reader = cmd.ExecuteReader();

        //            while (reader.Read())
        //            {
        //                DropDownItem item = new DropDownItem();
        //                item.Valor = reader["Valor"].ToString();
        //                item.Texto = reader["Texto"].ToString();
        //                dropDownListData.Add(item);
        //            }

        //            con.Close();
        //        }
        //    }

        //    return dropDownListData;
        //}

        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        // Call the JavaScript function to populate the DropDownList using AJAX
        //        ScriptManager.RegisterStartupScript(this, GetType(), "FillDropDownList", "FillDropDownList();", true);
        //    }
        //}

        //public class DropDownItem
        //{
        //    public string Valor { get; set; }
        //    public string Texto { get; set; }
        //}

    }
}
