using System.IO;
using System.Text;

namespace ServiceCodeFirstExercise.ConnectionStringBuilder
{
    public static class ConnectionStringBuilder
    {
        private static string connectionString = "";

        public static string ConnectionString
        {
            get {
                if (connectionString == "")
                    connectionString = BuildConnectionString();

                    return connectionString;
            }
        }

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
