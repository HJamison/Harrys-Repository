using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;

namespace HumansVsZombies
{
    public partial class LoadingScreen : Form
    {
        public LoadingScreen()
        {
            InitializeComponent();
        }

        private void LoadingScreen_Load(object sender, EventArgs e)
        {
            int temp = 0;
            Thread.Sleep(1000);
            do
            {
                progressBar2.Value = temp;
                Thread.Sleep(100);
                temp++;
            }
            while (temp <= 100);


            var newForm = new MainMenu();
            newForm.Show();
            this.Hide();
        }

        private void progressBar2_Click(object sender, EventArgs e)
        {

        }
    }
}
