<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>save</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			//参数
			String name = (String) request.getParameter("name");
			String phone = (String) request.getParameter("phone");
			String message = (String) request.getParameter("message");
			String ip = request.getRemoteAddr();
			//数据库
			String sql = "INSERT INTO message (name, phone, mssage, ip) VALUES ('" + name + "', '" + phone + "', '"
					+ message + "', '" + ip + "')";
			String url = "jdbc:mysql://localhost/myblog?useSSL=false&user=root&password=root";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection(url);
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.executeUpdate();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			//e.printstacktrace();
		}
	%>
</body>
</html>
