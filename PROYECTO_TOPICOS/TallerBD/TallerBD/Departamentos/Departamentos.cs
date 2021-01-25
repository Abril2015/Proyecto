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

namespace TallerBD.Departamentos
{
    public partial class Departamentos : Form 
    {

        Conexion.Conexion conn;
        public Departamentos()
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
            cargarDepartamentos();
        }

    private void btnAgregar_Click(object sender, EventArgs e)
        {
            this.Hide();
            InsertarDepartamento formInsertar = new InsertarDepartamento();
            formInsertar.Show();
        }

        private void dgvClientes_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
           
            if (dgvDepartamento.SelectedRows.Count < 1)
            {
                MessageBox.Show("Debe seleccionar toda la fila");
            }
            else
            {
                //MessageBox.Show(conn.eliminarDepartamento(dgvDepartamento.SelectedCells[0].Value.ToString()));
                cargarDepartamentos();
            }
        }

        public void cargarDepartamentos()
        {
            var columnas = new List<String>();
            //columnas = conn.obtenerColumnasDepartamento();
            dgvDepartamento.Columns.Clear();
            // comboBoxMonth.Items.AddRange(UsageRptConstsAndUtils.Months.ToArray<object>());
            int numeroColumnas = columnas.Count;
            for (var i = 0; i < numeroColumnas; i++)
            {
                dgvDepartamento.Columns.Add(i.ToString(), columnas[i]);
            }

            String filtro = "";
            String orden = "";
            if (cbxOrden.SelectedIndex > -1)
            {
                orden = cbxOrden.SelectedItem.ToString();
            }
            else
            {
                if (cbxOrden.Items.Count > 1)
                {
                    cbxOrden.Items.Clear();
                }
                cbxOrden.Items.AddRange(columnas.ToArray());
            }
            if (!txtFiltro.Text.Equals(""))
            {
                filtro = txtFiltro.Text;
            }

            try
            {
                //SqlDataReader articulos = conn.obtenerDepartamentos(filtro, orden);
                int numeroFila = 0;
                //int filas = articulos.FieldCount;

               // while (articulos.Read())
                {
                    dgvDepartamento.Rows.Add();

                    for (int i = 0; i < numeroColumnas; i++)
                    {
                     //   dgvDepartamento[i, numeroFila].Value = articulos[i].ToString();
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
            cargarDepartamentos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            if (dgvDepartamento.SelectedRows.Count < 1)
            {
                MessageBox.Show("Debe seleccionar toda la fila");
            }
            else
            {
                this.Hide();
                List<String> departamento = new List<string>();
                //departamento = conn.obtenerDepartamentoPorId(dgvDepartamento.SelectedCells[0].Value.ToString());
                InsertarDepartamento formInsertar = new InsertarDepartamento();
                //Colocamos los datos del cliente en los InsertarDepartamento box para editar

                formInsertar.txtClave.Text = departamento[0];
                formInsertar.txtClave.Enabled = false;
                formInsertar.txtNombre.Text = departamento[1];
                formInsertar.Show();
            }
        }
    }
}
