<%@page import="dbfile_db.connectdb"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*,com.jspsmart.upload.*"%>

<html>
<body>
	<%
		Connection con = null;
		Statement sql = null;
		ResultSet rs = null;
		con = connectdb.connect();
		sql = con.createStatement();

		int choice;
		String ID = null;
		String nnum = null;
		String nname = null;
		String ngender = null;
		String nxueyuan = null;
		String num = null;
		String location = null;
	
		//新建一个SmartUpload对象
		SmartUpload su = new SmartUpload();
		try
		{	
			//上传初始化
			su.initialize(pageContext);
			//设定上传限制
			//限制每个上传文件的最大长度
			su.setMaxFileSize(1000000);
			//限制总上传数据的长度
			su.setTotalMaxFileSize(4000000);
			//设定允许上传的文件(通过扩展名限制),公允许doc,txt,jpg,bmp,swf,rm,mp3,gif,mid文件
			su.setAllowedFilesList("jpg,bmp,gif,png");
			//设定禁止上传的文件(通过扩展名限制),禁止上传带有exe,bat,jsp,htm,html
			//扩展名的文件和没有扩展名的文件
			su.setDeniedFilesList("exe,bat,jsp,htm,html");
			//上传文件
			su.upload();
			//将上传文件全部保存到指定目录
			su.save("/uploadfiles");
			com.jspsmart.upload.File file = su.getFiles().getFile(0);
			location = "/uploadfiles/"
					+ file.getFilePathName().toString();
			choice = Integer.valueOf(su.getRequest().getParameter("choice"));
		}
		catch(Exception e1)
		{
			choice = Integer.valueOf(request.getParameter("choice"));
			ID = request.getParameter("ID");
			
		}
		if (choice == 1 || choice == 3) {
			//get  data 
			nnum = su.getRequest().getParameter("id");//request.getParameter("id");
			if (nnum != null)
				nnum = new String(nnum.getBytes("ISO-8859-1"), "utf-8");
			nname = su.getRequest().getParameter("name");//request.getParameter("name");
			if (nname != null)
				nname = new String(nname.getBytes("ISO-8859-1"), "utf-8");
			ngender = su.getRequest().getParameter("gender");//request.getParameter("gender");
			if (ngender != null)
				ngender = new String(ngender.getBytes("ISO-8859-1"),
						"utf-8");
			nxueyuan = su.getRequest().getParameter("xueyuan");//request.getParameter("xueyuan");
			if (nxueyuan != null)
				nxueyuan = new String(nxueyuan.getBytes("ISO-8859-1"),
						"utf-8");
			//int choice = Integer.valueOf(request.getParameter("choice"));
			num = su.getRequest().getParameter("num");//request.getParameter("num");
			//out.print(ID+""+choice);		
		}
		try {
			if (choice == 1) {
				sql.executeUpdate("update student set id='" + nnum
						+ "', name='" + nname + "',gender='" + ngender
						+ "',xueyuan='" + nxueyuan + "',photo='"+location+"' where id='" + num + "'");

			}
			if (choice == 2) {
				sql.executeUpdate("DELETE from student where id='" + ID
						+ "';");//ID wait to check
			}
			if (choice == 3) {
				//out.print("INSERT into student (id,name,gender,xueyuan) VALUES('"+nnum+"','"+nname+"','"+ngender+"','"+nxueyuan+"')");
				sql.executeUpdate("INSERT into student (id,name,gender,xueyuan,photo) VALUES('"
						+ nnum
						+ "','"
						+ nname
						+ "','"
						+ ngender
						+ "','"
						+ nxueyuan 
						+ "','" 
						+ location+"')");
			}
			response.sendRedirect("success.html");
		} catch (Exception e) {
			response.sendRedirect("fail.html");
		}
	%>
</body>
</html>