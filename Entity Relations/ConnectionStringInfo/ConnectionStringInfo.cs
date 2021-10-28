using System;
using System.IO;
using System.Text;

namespace ConnectionStringInfo
{
    public static class ConnectionStringInfo
    {
        private static string connection = "";

        public static string ConnectionString
        {
            get 
            {
                if (connection == "")
                    connection = BuildConnectionString();

                return connection;
            }
        }

        private static string BuildConnectionString()
        {
            var reader = new StreamReader(@"..\..\..\..\ConnectionString.ini");
            var sb = new StringBuilder();

            while (!reader.EndOfStream)
            {
                sb.Append(reader.ReadLine());
            }

            return sb.ToString();
        }
    }
}
