<%@ page language="java" 
    contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*"%>
<%
    request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> Login_Check </title>
</head>
<body>
 
    <h1> �α��� üũ ������ </h1>
    
    <%
    try {
        // ����̹� �ε�
        String driver = "oracle.jdbc.driver.OracleDriver";
        Class.forName(driver);
        
        // ������ Login
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String id = "scott";
        String pw = "tiger";
        
        // ����
        Connection conn = DriverManager.getConnection(url, id, pw);
        
         // sql ����
         // �� �������� LOGIN.jsp input�� �Է��� ������ ������ ��´�
         String user_id= request.getParameter("input_id");
         String user_pw= request.getParameter("input_pw");
         
        Statement st = conn.createStatement();
        // ���� �Է��� id�� pw ���� DB�ȿ� �ִ��� Ȯ���Ѵ�
        String sql = "SELECT * FROM USERTABLE WHERE USER_ID ='" + user_id + "' AND USER_PW='" + user_pw + "'";
        st.executeUpdate(sql);
        ResultSet rs = st.executeQuery(sql);
        
        // isLogin �� �α��� Ȯ�� ������ ���� ����
        Boolean isLogin = false;
        while(rs.next()) {
            // rs.next�� true ��� = ������ �ִ�
            isLogin = true;
        }
        
        // DB�� ���� ���� ������ �ִٸ�
        if(isLogin) {
            // ���� �α����� id�� pw�� session�� �����ϰ�
            session.setAttribute("id", user_id); 
            session.setAttribute("pw", user_pw);
            // ù �������� ����������
            response.sendRedirect("login.jsp");    
        } else {
            // DB�� �������� ������ ���ٸ� ���â�� ����ش�
            %> <script> alert("�α��� ����"); history.go(-1); </script> <%            
        }
        
        
    } catch (Exception e) {       
        out.println("DB ���� ����");
    }
    %>
 
</body>
</html>