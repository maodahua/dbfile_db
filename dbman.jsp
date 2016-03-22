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
		String ID = request.getParameter("ID");
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
		int choice = Integer.valueOf(request.getParameter("choice"));
		String num = request.getParameter("num");
		//out.print(ID+""+choice);		
		
		try{
			if(choice == 1)
			{
				sql.executeUpdate("update student set id='"+nnum+"', name='"+nname+"',gender='"+ngender+"',xueyuan='"+nxueyuan+"' where id='"+num+"'");
				
			}
			if(choice == 2)
			{
				sql.executeUpdate("DELETE from student where id='"+ID+"';");
			}
			if(choice == 3)
			{
				//out.print("INSERT into student (id,name,gender,xueyuan) VALUES('"+nnum+"','"+nname+"','"+ngender+"','"+nxueyuan+"')");
				sql.executeUpdate("INSERT into student (id,name,gender,xueyuan) VALUES('"+nnum+"','"+nname+"','"+ngender+"','"+nxueyuan+"')");
			}
			response.sendRedirect("success.html");
		}
		catch(Exception e){
			response.sendRedirect("fail.html");
		}
		
		
	 %>
</body>
</html>