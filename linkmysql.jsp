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
    rs = sql.executeQuery("select id,name,gender,xueyuan from student");
    String[] a = new String[10];
    int i = 0;
   	out.print("<table border=2>");
    out.print("<tr>");
    out.print("<th width=20>"+"编号"); 
    out.print("<th width=60>"+"姓名"); 
    out.print("<th width=50>"+"性别"); 
    out.print("<th width=100>"+"学院");
    out.print("<th width=200>"+"操作");
    out.print("</tr>"); 
    while(rs.next()){
        out.print("<tr>");
        a[i] = rs.getString(1);
        out.print("<td>"+a[i]+"</td>");
        out.print("<td>"+rs.getString(2)+"</td>");
        out.print("<td>"+rs.getString(3)+"</td>");
        out.print("<td>"+rs.getString(4)+"</td>");
       %>
       <td>
       	<a href="stuman.jsp?ID=<%=a[i]%>">修改信息</a>
       	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       	<a href="dbman.jsp?ID=<%=a[i] %>&choice=2">删除信息</a>
       </td>
       <% 
       i++;
       out.print("</tr>");
    }
    out.print("</table>");
    %>
    <a href="stuadd.jsp">添加学生信息</a>
    <% 
    con.close(); 
}
catch(SQLException e1){
	out.print(e1);
	}
%>
</body>
</html>