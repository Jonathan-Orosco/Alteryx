using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using JsonToCsv.Model;
using System.IO;


namespace JsonToCsv.Utils
{
    public static class FileConverter
    {
        public static void ConvertFile(string FileName, string OutputFolder)
        {
            if (File.Exists(FileName) && Directory.Exists(OutputFolder))
            {
                FileInfo inputFile = new FileInfo(FileName);
                System.Diagnostics.Debug.WriteLine(inputFile.Name);
                FileStream fileStream = new FileStream(FileName, FileMode.Open, FileAccess.Read);
                using (StreamReader streamReader = new StreamReader(fileStream, Encoding.UTF8))
                {
                    List<StockDailyInfo> stocks = System.Text.Json.JsonSerializer.Deserialize<List<StockDailyInfo>>(streamReader.ReadToEnd());
                    using (StreamWriter writer = new StreamWriter(Path.Combine(OutputFolder, string.Format("{0}.{1}", inputFile.Name, "csv"))))
                    {
                        List<System.Reflection.PropertyInfo> properties = new List<System.Reflection.PropertyInfo>();
                        properties.AddRange(FileConverter.GetPropertyInfos<StockDailyInfo>());
                        writer.WriteLine(string.Join(",", properties.Select(prp => prp.Name)));

                        foreach (StockDailyInfo stock in stocks)
                        {
                            writer.WriteLine(string.Join(",", FileConverter.GetPropertyValues(properties, stock)));
                        }
                        writer.Flush();
                        writer.Close();
                    }
                }
            }
        }

        private static IEnumerable<System.Reflection.PropertyInfo> GetPropertyInfos<T>()
        {
            foreach (System.Reflection.PropertyInfo property in typeof(T).GetProperties())
            {
                yield return property;
            }
        }

        private static IEnumerable<string> GetPropertyValues<T>(IEnumerable<System.Reflection.PropertyInfo> propertyInfos, T objectWithValues)
        {
            if (objectWithValues != null)
            {
                foreach (System.Reflection.PropertyInfo property in propertyInfos)
                {
                    if (property.CanRead)
                    {
                        object tempForChecks = property.GetValue(objectWithValues, null);

                        if (tempForChecks != null && !(tempForChecks is DBNull))
                        {
                            yield return tempForChecks.ToString();
                        }
                    }
                }
            }
        }
    }
}
