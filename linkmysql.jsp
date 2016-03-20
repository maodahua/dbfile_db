<%@page import="dbfile_db.connectdb"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.jdbc.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>

<html>
<body>
<%
Connection con = null;
Statement sql = null;
ResultSet rs = null;


try{
    con = connectdb.connect();
    sql = con.createStatement();
    rs = sql.executeQuery("select name from student");
    
   	out.print("<table border=2>");
    out.print("<tr>");
    out.print("<th width=100>"+"name"); 
    out.print("</tr>"); 
    while(rs.next()){
        out.print("<tr>");
        out.print("<td>"+rs.getString(1)+"</td>");
       
        out.print("</tr>");
    }
    out.print("</table>");
    con.close(); 
}
catch(SQLException e1){
	out.print(e1);
	}
%>
</body>
</html>