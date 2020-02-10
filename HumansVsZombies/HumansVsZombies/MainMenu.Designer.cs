namespace HumansVsZombies
{
    partial class MainMenu
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.playBtn = new System.Windows.Forms.Button();
            this.highscoreBtn = new System.Windows.Forms.Button();
            this.exitBtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // playBtn
            // 
            this.playBtn.Location = new System.Drawing.Point(100, 70);
            this.playBtn.Name = "playBtn";
            this.playBtn.Size = new System.Drawing.Size(134, 61);
            this.playBtn.TabIndex = 0;
            this.playBtn.Text = "Play";
            this.playBtn.UseVisualStyleBackColor = true;
            this.playBtn.Click += new System.EventHandler(this.playBtn_Click);
            // 
            // highscoreBtn
            // 
            this.highscoreBtn.Location = new System.Drawing.Point(100, 189);
            this.highscoreBtn.Name = "highscoreBtn";
            this.highscoreBtn.Size = new System.Drawing.Size(134, 70);
            this.highscoreBtn.TabIndex = 1;
            this.highscoreBtn.Text = "button2";
            this.highscoreBtn.UseVisualStyleBackColor = true;
            // 
            // exitBtn
            // 
            this.exitBtn.Location = new System.Drawing.Point(100, 351);
            this.exitBtn.Name = "exitBtn";
            this.exitBtn.Size = new System.Drawing.Size(134, 48);
            this.exitBtn.TabIndex = 2;
            this.exitBtn.Text = "button3";
            this.exitBtn.UseVisualStyleBackColor = true;
            // 
            // MainMenu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1178, 694);
            this.Controls.Add(this.exitBtn);
            this.Controls.Add(this.highscoreBtn);
            this.Controls.Add(this.playBtn);
            this.Name = "MainMenu";
            this.Text = "MainMenu";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button playBtn;
        private System.Windows.Forms.Button highscoreBtn;
        private System.Windows.Forms.Button exitBtn;
    }
}