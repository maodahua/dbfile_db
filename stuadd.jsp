<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<body>
	<p>输入新信息
		<form action="dbman.jsp" method="post" name=form ENCTYPE="multipart/form-data">
			<p>编号
				<input type="text" name=id >
			<p>姓名
				<input type="text" name=name >
			<p>性别
				<input type="text" name=gender >
			<p>学院
				<input type="text" name=xueyuan >
			<p>头像
				<input type="FILE" name="FILE1">
				<input type="hidden" name=choice  value=3>
				<br>
			<input type='submit' value="确认修改" name="submit">
		</form> 
</body>
</html>