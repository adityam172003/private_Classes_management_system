/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CommonFunctions;
import java.sql.*;
/**
 *
 * @author adity
 */
public class Functions
{
    
    public static Connection getConnection() throws SQLException
    {
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sesystem","root","Adity@98.321");
        
        return con;
    }
    
}
