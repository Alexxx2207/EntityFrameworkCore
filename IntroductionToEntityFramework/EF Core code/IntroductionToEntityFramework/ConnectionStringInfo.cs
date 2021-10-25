using System.Text;
using System.IO;

namespace SoftUni
{
    public sealed class ConnectionStringInfo
    {
        private static string connString  = "";

        public static string ConnectionString 
        {
            get 
            {
                if(connString == "")
                {
                    connString = BuildConnectionString();
                }
 
                return connString;
            } 
        }

        private static string BuildConnectionString()
        {
            StringBuilder sb = new StringBuilder();

            FileInfo text = new FileInfo(@"..\..\..\..\ConnectionString.ini");

            StreamReader reader = text.OpenText();

            while (!reader.EndOfStream)
            {
                sb.Append(reader.ReadLine());
            }

            return sb.ToString().Trim();
        }
    }
}
