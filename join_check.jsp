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
<title> JoinCheck </title>
</head>
<body>
 
    <%
        // JOIN.jsp input ���� �Է��� ȸ�����Կ� �ʿ��� ������ ������ ����ش�
        String his_id     = request.getParameter("JOIN_id");
        String his_pw     = request.getParameter("JOIN_pw");
        String his_hobby= request.getParameter("JOIN_hobby");
        
        try {
            // ����̹� �ε�
            String driver = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driver);
            
            // ������ Login
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String id = "scott";
            String pw = "tiger";
            
            // ����
            // INSERT �ش޶� USERTABLE�� 
            // id, pw, hobby ��� �ʵ带 ����
            Connection conn = DriverManager.getConnection(url, id, pw);
            Statement st = conn.createStatement();
            String sql = "INSERT INTO USERTABLE VALUES ('" + his_id + 
                    "','" + his_pw + 
                    "','" + his_hobby + 
                    "')";
            st.executeUpdate(sql);
            
            // ȸ�����Կ� �����Ͽ����� ù �������� ������
            response.sendRedirect("login.jsp");        
            
        } catch (Exception e) {       
            out.println("DB ���� ����");
        }    
    %>
 
</body>
</html>
