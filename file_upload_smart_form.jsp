<%@ page contentType="text/html;charset=utf-8" language="java"%>
<title>文件上传</title>
<body>
    <h1 align="center">用smartUpload组件实现文件上传</h1>
    <p align="center">请选择要上传的文件:</p>
    <form method="post" action="file_upload_smart_do.jsp" ENCTYPE="multipart/form-data">
    <table width="75%" border="1" align="center">
    <tr>
    <td height="25">上传文件1:</td>
    <td height="25"><input type="FILE" name="FILE1" size="30"></td>
    </tr>
    <tr>
    <td height="25">上传文件2:</td>
    <td height="25"><input type="FILE" name="FILE2" size="30"></td>
    </tr>
    <tr>
    <td height="25">上传文件3:</td>
    <td height="25"><input type="FILE" name="FILE3" size="30"></td>
    </tr>
    <tr>
    <td height="25">上传文件4:</td>
    <td height="25"><input type="FILE" name="FILE4" size="30"></td>
    </tr>
    <tr>
    <td colspan="2" align="center" height="40">
    <input type="submit" name="Submit" value="上传">
    <td>
    </tr> 
    </table>
    </form>
<body>
</html>

