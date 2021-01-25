using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TallerBD.Departamentos
{
    public partial class InsertarDepartamento : Form
    {
        Conexion.Conexion conn;
        public InsertarDepartamento()
        {
            conn = new Conexion.Conexion();
            InitializeComponent();
        }

        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Hide();
            Departamentos formClientes = new Departamentos();
            formClientes.Show();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            String nombre = txtNombre.Text;
            String clave = txtClave.Text;
            MessageBox.Show(clave);
            MessageBox.Show(nombre);
            if (!nombre.Equals("") || !clave.Equals(""))
            {
                if (txtClave.Enabled)
                {
                    //MessageBox.Show(conn.insertarDepartamento(clave, nombre));
                }
                else
                {
                    //MessageBox.Show(conn.modificarDepartamento(nombre, clave));
                }
            }
            else
            {
                MessageBox.Show("Debe llenar todos los datsdfos");
            }
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (txtClave.Enabled) {
                txtNombre.Text = "";
            }
            txtClave.Text = "";
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
