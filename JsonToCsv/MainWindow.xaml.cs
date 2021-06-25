using JsonToCsv.Utils;
using System.Windows;

namespace JsonToCsv
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        private void CmdGo_Click(object sender, RoutedEventArgs e)
        {
            FileConverter.ConvertFile(this.TxtFileName.Text, this.TxtDstFldr.Text);
        }
    }
}
