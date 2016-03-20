<%@ page contentType="text/html;charset=utf-8" import="java.util.*,com.jspsmart.upload.*"%>
<title>文件上传</title>
   <body>
   <div align="center">
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
   su.setAllowedFilesList("doc,txt,jpg,bmp,swf,rm,mp3,gif,mid,png");
   //设定禁止上传的文件(通过扩展名限制),禁止上传带有exe,bat,jsp,htm,html
   //扩展名的文件和没有扩展名的文件
   su.setDeniedFilesList("exe,bat,jsp,htm,html,,");
   //上传文件
   su.upload();
   //将上传文件全部保存到指定目录
   int count=su.save("/uploadfiles");
   out.println("<font color=red>"+count+"</font>个文件上传成功!<br>");
   //逐一提取上传文件信息,同时可保存文件
   for(int i=0;i<su.getFiles().getCount();i++){
      com.jspsmart.upload.File file=su.getFiles().getFile(i);
    //若文件表单中的文件选项没有选择文件则继续
     if(file.isMissing()){
      continue; 
}
    //显示当前文件信息
     out.println("<table border=1>");
     out.println("<tr><td>表单项名(FiledName)</td><td>"+file.getFieldName()+"</td></tr>");
     out.println("<tr><td>文件长度(Size)</td><td>"+file.getSize()+"</td></tr>");
     out.println("<tr><td>文件名(FileName)</td><td>"+file.getFileName()+"</td></tr>");
     out.println("<tr><td>文件扩展名(FileExt)</td><td>"+file.getFileExt()+"</td></tr>");
     out.println("<tr><td>文件全名(FilePathName)</td><td>"+file.getFilePathName()+"</td></tr>");
     out.println("</table><br>");
 }
%>
</div>
</body>