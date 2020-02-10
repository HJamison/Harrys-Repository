using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HumansVsZombies
{
    public partial class Game : Form
    {
        Button[,] btn = new Button[51, 51];
        public Game()
        {
            InitializeComponent();
            // grid generator 
            for (int x = 0; x < btn.GetLength(0); x++)         // Loop for x
            {
                for (int y = 0; y < btn.GetLength(1); y++)     // Loop for y
                {
                    
                    btn[x, y] = new Button();
                    btn[x, y].SetBounds((7 * x)+220, (7 * y)+30, 7, 7);
                    btn[x, y].BackColor = Color.White;
                    Controls.Add(btn[x, y]);
                }
            }
           
        }

        private void Game_Load(object sender, EventArgs e)
        {

        }

        private void gamePanel_Paint(object sender, PaintEventArgs e)
        {

        }

        private void Game_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.Left)
            {
                MessageBox.Show("Success");
            }

        }
    }
}
