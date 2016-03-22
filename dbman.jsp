<%@page import="dbfile_db.connectdb"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<body>
	<%
		Connection con = null;
		Statement sql = null;
		ResultSet rs = null;
		
		con  = connectdb.connect();
		sql = con.createStatement();
		
		
		
		//get the data from mannage page
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
		//out.print(nxueyuan);
		int choice = Integer.valueOf(request.getParameter("choice"));
		String num = request.getParameter("num");
		try{
			if(choice == 1)
			{
				sql.executeUpdate("update student set id='"+nnum+"', name='"+nname+"',gender='"+ngender+"',xueyuan='"+nxueyuan+"' where id='"+num+"'");
				response.sendRedirect("success.html");
			}
		}
		catch(Exception e){
				response.sendRedirect("fail.html");
		}
		
		
	 %>
</body>
</html>