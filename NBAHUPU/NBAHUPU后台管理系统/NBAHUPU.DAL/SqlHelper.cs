//===============================================================================
// This file is based on the Microsoft Data Access Application Block for .NET
// For more information please go to 
// http://msdn.microsoft.com/library/en-us/dnbda/html/daab-rm.asp
//===============================================================================

using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace NBAHUPU.DAL
{

    /// <summary>
    /// ִ��Sql �����ͨ�÷���
    /// </summary>
    public abstract class SqlHelper
    {

        //Database connection strings
        public static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["NBAHUPU"].ConnectionString;

        #region ExecuteNonQuery

        /// <summary>
        /// ִ��sql����
        /// </summary>        
        /// <param name="commandType">��������</param>
        /// <param name="commandText">sql���/������sql���/�洢������</param>
        /// <param name="commandParameters">����</param>
        /// <returns>��Ӱ�������</returns>
        public static int ExecuteNonQuery(string commandText, CommandType commandType, params SqlParameter[] commandParameters)
        {

            SqlCommand cmd = new SqlCommand();

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                PrepareCommand(cmd, commandType,conn, commandText, commandParameters);
                int val = cmd.ExecuteNonQuery();

                return val;
            }
        }
        
        #endregion

        #region ExecuteReader

        /// <summary>
        ///  ִ��sql����
        /// </summary>        
        /// <param name="commandType">��������</param>
        /// <param name="commandText">sql���/������sql���/�洢������</param>
        /// <param name="commandParameters">����</param>
        /// <returns>SqlDataReader ����</returns>
        public static SqlDataReader ExecuteReader(string commandText, CommandType commandType, params SqlParameter[] commandParameters)
        {

            SqlConnection conn = new SqlConnection(ConnectionString);
            try
            {
                SqlCommand cmd = new SqlCommand();
                PrepareCommand(cmd, commandType, conn, commandText, commandParameters);
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                return rdr;
            }
            catch
            {
                conn.Close();
                throw;
            }
        }

        #endregion

        #region ExecuteDataset

        /// <summary>
        /// ִ��Sql ����
        /// </summary>        
        /// <param name="commandType">��������</param>
        /// <param name="commandText">sql���/������sql���/�洢������</param>
        /// <param name="commandParameters">����</param>
        /// <returns>DataSet ����</returns>
        public static DataSet ExecuteDataset(string commandText, CommandType commandType, params SqlParameter[] commandParameters)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {

                SqlCommand cmd = new SqlCommand();

                PrepareCommand(cmd, commandType, conn, commandText, commandParameters);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();

                    da.Fill(ds);

                    return ds;
                }
            }
        }

        #endregion

        #region ExecuteScalar

        /// <summary>
        /// ִ��Sql ����
        /// </summary>       
        /// <param name="commandType">��������</param>
        /// <param name="commandText">sql���/������sql���/�洢������</param>
        /// <param name="commandParameters">����</param>
        /// <returns>ִ�н������</returns>
        public static object ExecuteScalar(string commandText, CommandType commandType, params SqlParameter[] commandParameters)
        {
            SqlCommand cmd = new SqlCommand();

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                PrepareCommand(cmd, commandType, conn, commandText, commandParameters);
                object val = cmd.ExecuteScalar();

                return val;
            }
        }      
        
        #endregion

        #region Private Method

        /// <summary>
        /// ����һ���ȴ�ִ�е�SqlCommand����
        /// </summary>
        /// <param name="cmd">SqlCommand ���󣬲�����ն���</param>
        /// <param name="conn">SqlConnection ���󣬲�����ն���</param>
        /// <param name="commandText">Sql ���</param>
        /// <param name="cmdParms">SqlParameters  ����,����Ϊ�ն���</param>
        private static void PrepareCommand(SqlCommand cmd, CommandType commandType, SqlConnection conn, string commandText, SqlParameter[] cmdParms)
        {
            //������
            if (conn.State != ConnectionState.Open)
                conn.Open();

            //����SqlCommand����
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            cmd.CommandType = commandType;

            if (cmdParms != null)
            {
                foreach (SqlParameter parm in cmdParms)
                    cmd.Parameters.Add(parm);
            }
        }
        
        #endregion


    }
}