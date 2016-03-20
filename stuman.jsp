
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
		<form action="" method="post" name=form>
			<p>编号
				<input type="text" name=id value=<%=rs.getString(1) %>>
			<p>姓名
				<input type="text" name=name value=<%=rs.getString(2) %>>
			<p>性别
				<input type="text" name=gender value=<%=rs.getString(3) %>>
			<p>学院
				<input type="text" name=xueyuan value=<%=rs.getString(4) %>>
				<br>
			<input type='submit' value="确认修改" name="submit">
		</form> 
	
	<%
		String nnum = request.getParameter("id");
		if(nnum != null)
			nnum = new String(nnum.getBytes("ISO-8859-1"),"utf-8");
		String nname = request.getParameter("name");
		if(nname != null)
			nname = new String(nname.getBytes("ISO-8859-1"),"utf-8");
		String ngender = request.getParameter("gender");
		if(ngender != null)
			ngender = new String(ngender.getBytes("ISO-8859-1"),"utf-8");
		String nxueyuan = request.getParameter("xueyuan");
		if(nxueyuan != null)
		nxueyuan = new String(nxueyuan.getBytes("ISO-8859-1"),"utf-8");
		out.print(nxueyuan);
		try{
			sql.executeUpdate("update student set id='"+nnum+"', name='"+nname+"',gender='"+ngender+"',xueyuan='"+nxueyuan+"' where id='"+num+"'");
			
		%>
		<% }
		catch(Exception e)
		{
			out.print(e);
		}
		
	%>
			
	
</body>
</html>