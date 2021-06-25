using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using JsonToCsv.Utils;

namespace JsonToCsv
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        private void Application_Startup(object sender, StartupEventArgs e)
        {

            if(e.Args.Length == 2)
            {
                string fileToConvert = e.Args[0];
                string destinationFolder = e.Args[1];

                if (string.IsNullOrEmpty(fileToConvert) == false
                    && string.IsNullOrWhiteSpace(fileToConvert) == false
                    && string.IsNullOrEmpty(destinationFolder) == false
                    && string.IsNullOrWhiteSpace(destinationFolder) == false)
                {
                    FileConverter.ConvertFile(fileToConvert, destinationFolder);
                }
                System.Windows.Application.Current.Shutdown();
            }
            else
            {
                MainWindow window = new MainWindow();
                window.Show();
            }
        }
    }
}
