package connectionProvider;

import java.sql.*;
public class ConnectionProvider 
{
    Connection con=null;
    String url="jdbc:mysql://127.0.0.1/PresentationHub";
    String usr="root";
    String ps="";
    public static ConnectionProvider cp=null;
    public ConnectionProvider()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch(Exception ex)
        {
            
        }
    }
    public static ConnectionProvider getInstance() throws Exception
    {
        if(cp==null)
        {
            cp=new ConnectionProvider();
        }
        return cp;
    }
    public Connection getConnection() throws Exception
    {
        con=DriverManager.getConnection(url,usr,ps);
        return con;
    }
}
