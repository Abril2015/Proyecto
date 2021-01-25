using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TallerBD.Clientes
{
    public partial class insertarCliente : Form
    {
        Conexion.Conexion conn;
        public insertarCliente()
        {
            conn = new Conexion.Conexion();
            InitializeComponent();
        }

        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Hide();
           Clientes formClientes = new Clientes();
            formClientes.Show();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            if (txtClave.Text.Equals("") || txtDireccion.Text.Equals("") || txtTelefono.Text.Equals("") || txtNombre.Text.Equals(""))
            {
                MessageBox.Show("Debe completar todos los campos");
            }
            else {
                //Si el boton está habilitado quiere decir que es una insercion
                if (txtClave.Enabled) {
                    MessageBox.Show(conn.insertarCliente(txtClave.Text, txtNombre.Text, txtDireccion.Text, txtTelefono.Text));
                } else {
                    MessageBox.Show(conn.modificarCliente( txtNombre.Text, txtDireccion.Text, txtTelefono.Text, txtClave.Text));
                }

            }
            
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (txtClave.Enabled)
            {
                txtClave.Text = "";
            }
            txtTelefono.Text = "";
            txtNombre.Text = "";
            txtDireccion.Text = "";
        }

        private void insertarCliente_Load(object sender, EventArgs e)
        {

        }
    }
}
