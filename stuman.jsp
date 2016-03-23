
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbfile_db.connectdb"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<body>
	<%
			Connection con = null;
			Statement sql = null;
			ResultSet rs = null;
			
			String num = request.getParameter("ID");
			con = connectdb.connect();
			sql = con.createStatement();
			rs = sql.executeQuery("select id,name,gender,xueyuan from student where id='"+num+"'");
			rs.next();
		%>
	
	  <p>输入新信息以作修改
		<form action="dbman.jsp" method="post" name=form ENCTYPE="multipart/form-data">
			<p>编号
				<input type="text" name=id value=<%=rs.getString(1) %>>
			<p>姓名
				<input type="text" name=name value=<%=rs.getString(2) %>>
			<p>性别
				<input type="text" name=gender value=<%=rs.getString(3) %>>
			<p>学院
				<input type="text" name=xueyuan value=<%=rs.getString(4) %>>
			<p>头像
				<input type="FILE" name="FILE1">
				<input type="hidden" name=choice  value=1>
				<input type="hidden" name=num  value=<%=num %>>
				<br>
			<input type='submit' value="确认修改" name="submit">
		</form> 
</body>
</html>