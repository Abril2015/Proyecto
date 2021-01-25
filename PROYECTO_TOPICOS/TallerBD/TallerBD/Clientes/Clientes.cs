using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TallerBD.Conexion;
using System.Data.SqlClient;

namespace TallerBD.Clientes
{
    public partial class Clientes : Form 
    {

        Conexion.Conexion conn;
        public Clientes()
        {
            InitializeComponent();
            conn = new Conexion.Conexion();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Hide();
            Principal formPrincipal = new Principal();
            formPrincipal.Show();
        }

        private void Clientes_Load(object sender, EventArgs e)
        {
            cargarClientes();
        }

    private void btnAgregar_Click(object sender, EventArgs e)
        {
            this.Hide();
            insertarCliente formInsertar = new insertarCliente();
            formInsertar.Show();
        }

        private void dgvClientes_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (dgvClientes.SelectedRows.Count < 1)
            {
                MessageBox.Show("Debe seleccionar toda la fila");
            }
            else {
                MessageBox.Show(conn.eliminarCliente(dgvClientes.SelectedCells[0].Value.ToString()));
                cargarClientes();
            }
            
        }

        public void cargarClientes()
        {
            var columnas = new List<String>();
            columnas = conn.obtenerColumnasClientes();
            dgvClientes.Columns.Clear();
            // comboBoxMonth.Items.AddRange(UsageRptConstsAndUtils.Months.ToArray<object>());
            int numeroColumnas = columnas.Count;
            for (var i = 0; i < numeroColumnas; i++)
            {
                dgvClientes.Columns.Add(i.ToString(), columnas[i]);
            }

            String filtro = "";
            String orden = "";
            if (cbxOrden.SelectedIndex > -1)
            {
                orden = cbxOrden.SelectedItem.ToString();
            }
            else {
                if (cbxOrden.Items.Count > 1)
                {
                    cbxOrden.Items.Clear();
                }
                cbxOrden.Items.AddRange(columnas.ToArray());
            }
            if (!txtFiltro.Text.Equals("")){
                filtro = txtFiltro.Text;
            }

            try
            {
                SqlDataReader clientes = conn.obtenerClientes(filtro, orden);
                int numeroFila = 0;
                int filas = clientes.FieldCount;

                while (clientes.Read())
                {
                    dgvClientes.Rows.Add();

                    for (int i = 0; i < numeroColumnas; i++)
                    {
                        dgvClientes[i, numeroFila].Value = clientes[i].ToString();
                    }
                    numeroFila++;

                }
                conn.cerrarConexion();
                
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                
            }
            
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            cargarClientes();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            if (dgvClientes.SelectedRows.Count < 1)
            {
                MessageBox.Show("Debe seleccionar toda la fila");
            }
            else
            {
                this.Hide();
                List<String> cliente = new List<string>();
                cliente = conn.obtenerClientePorId(dgvClientes.SelectedCells[0].Value.ToString());
                insertarCliente formInsertar = new insertarCliente();
                //Colocamos los datos del cliente en los text box para editar
                formInsertar.txtClave.Text = cliente[0];
                formInsertar.txtClave.Enabled = false;
                formInsertar.txtNombre.Text = cliente[1];
                formInsertar.txtDireccion.Text = cliente[2];
                formInsertar.txtTelefono.Text = cliente[3];
                formInsertar.Show();
            }
            

        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {
            this.Hide();
            Principal formPrincipal = new Principal();
            formPrincipal.Show();
        }
    }
}
