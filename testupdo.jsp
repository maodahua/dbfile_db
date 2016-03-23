 <%@ page contentType="text/html;charset=utf-8" import="java.util.*,com.jspsmart.upload.*"%>
 <body>

 <%
    //新建一个SmartUpload对象
   SmartUpload su=new SmartUpload();
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
   su.setDeniedFilesList("exe,bat,jsp,htm,html,,");
   //上传文件
   su.upload();
   //将上传文件全部保存到指定目录
   su.save("/uploadfiles");
   com.jspsmart.upload.File file=su.getFiles().getFile(0);
   //out.print(file.getFilePathName());
   out.print("insert fsdjf  photo='/uploadfiles/"+file.getFilePathName()+"'");
     %>
 </body>