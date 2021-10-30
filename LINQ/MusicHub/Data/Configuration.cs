using System.IO;
using System.Text;

namespace MusicHub.Data
{
   public static class Configuration
    {
        public static string ConnectionString = BuildConnectionString();


        private static string BuildConnectionString()
        {
            StreamReader reader = new StreamReader(@"..\..\..\..\ConnectionString.ini");

            var sb = new StringBuilder();

            while (!reader.EndOfStream)
            {
                sb.Append(reader.ReadLine());
            }
            return sb.ToString().Trim();
        }
    }
}
