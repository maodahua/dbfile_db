<%@page import="dbfile_db.connectdb"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<body>
	<%
	Connection con = null;
	Statement sql = null;
	ResultSet rs = null; 
	String num = request.getParameter("ID");
	String lo = "http://localhost:8080/dbfile_db";
	
	con = connectdb.connect();
	sql = con.createStatement();
	rs = sql.executeQuery("select * from student where id='"+num+"'");
	rs.next();
	%>
	<p>详细信息
	<p>编号
		<input type="text" name=id value=<%=rs.getString(1) %>>
	<p>姓名
		<input type="text" name=name value=<%=rs.getString(2) %>>
	<p>性别
		<input type="text" name=gender value=<%=rs.getString(3) %>>
	<p>学院
		<input type="text" name=xueyuan value=<%=rs.getString(4) %>>
		<br>
	<img  src=<%=lo+rs.getString(5) %>>
</body>
</html>