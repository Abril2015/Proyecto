using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace TallerBD.Articulos
{
    public partial class InsertarArticulos : Form
    {
        Conexion.Conexion conn;
        public InsertarArticulos()
        {
            conn = new Conexion.Conexion();
            InitializeComponent();
        }

        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Hide();
           Articulos formClientes = new Articulos();
            formClientes.Show();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            if (txtClave.Text.Equals("") || txtCosto.Text.Equals("") || txtDescripcion.Text.Equals("") || txtMarca.Text.Equals("") || txtModelo.Text.Equals("") || txtStock.Text.Equals("") || cbxDepartamentos.SelectedIndex > -1) {
                if (txtClave.Enabled) {
                    MessageBox.Show(conn.insertarArticulo(txtClave.Text, txtCosto.Text, txtDescripcion.Text, txtMarca.Text, txtModelo.Text, txtStock.Text, cbxDepartamentos.SelectedItem.ToString()));
                } else {
                    MessageBox.Show(conn.modificarArticulo(txtCosto.Text, txtDescripcion.Text, txtMarca.Text, txtModelo.Text, cbxDepartamentos.SelectedItem.ToString(), txtStock.Text, txtClave.Text));
                }
            } else {
                MessageBox.Show("Debe llenar todos los datos");
            }
       }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            txtMarca.Text = "";
            txtCosto.Text = "";
            txtDescripcion.Text = "";
            txtClave.Text = "";
            txtModelo.Text = "";
            txtStock.Text = "";
        }

        private void InsertarArticulos_Load(object sender, EventArgs e)
        {

            SqlDataReader departamentos = conn.obtenerDepartamentosArticulos();
            while (departamentos.Read())
            {
                cbxDepartamentos.Items.Add((departamentos[0].ToString()));
            }
            conn.cerrarConexion();

        }
    }
}
