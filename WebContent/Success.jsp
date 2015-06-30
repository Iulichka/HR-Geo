<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <div  class="centerStyle" style="position: absolute; top: 100px; left:400px; width:600px; margin:auto;" align="center">
			<p style="color:red; font-size: 18px;">თქვენ წარმატებით გაიარეთ ვერიფიკაცია </p>
				<form method="get" action="PersonServlet">
					<input class="field" type="text" size="30" name="code">
					<input class="submitButton" type="submit" value="დადასტურება"/>
				</form>
		</div>
</body>
</html>