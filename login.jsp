<%@ page language="java" 
    contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ۺ���</title>
<style type="text/css">
         /* �⺻ ����*/
         a{text-decoration:none; color:#000000;}         
         a:hover{color:#ff0000;}                    
         
         div ul{padding-top:10px;}   
        div ul li {
            display:inline;                   
            border-left:1px solid #999;   
            font:bold 20px Dotum;                   
            padding:0 10px;                      
        }
         div ul li:first-child{border-left:none;}   
         #menu li.tab_login{float:right;} 
    </style>
<title> Login </title>
</head>
<body>
<div id = "menu">
 <li><img src="http://npsia.ruatic.net/files/attach/images/172370/xe2439cae9a7d6e6b213935d9c4e22b2f.gif.pagespeed.ic.15BdV4pBFA.png"
 OnClick="window.location='main.jsp'">
 		 <ul>  
        	 <li><a href="intro.jsp">�Ұ�</a></li>
            <li><a href="board_list.jsp">���Խ���</a></li>
            <li><a href="fileupload.jsp">���� �Խ���</a>
            <li class="tab_login"><a href="login.jsp">�α���</a>
            </li>
        </ul>   
    </div>
    <%
        // ���� �α��ε� ���̵� ���ٸ� (= session�� ����� id�� ���ٸ�)
        if(session.getAttribute("id") == null) {
            %>
            <h1> �α��� ������ </h1> 
            <br /> <form action="LOGINCHECK.jsp" method="post">
            <br />
            <br /> ID <input name="input_id" type="text">
            <br />
            <br /> PASSWORD <input name="input_pw" type="password"><br><br> <button> �α��� </button>
            <br /> </form>
            <br /> <button onClick="location.href='join.jsp'"> ȸ������ </button>
            <%
        } 
        // ���� �α��ε� ���̵� �ִٸ� (= session�� ����� id�� �ִٸ�)
        else {
            out.print(session.getAttribute("id") + " �� ȯ���մϴ�");
            %>
            <h1> �α��� ������ </h1> 
            <br /> <form action="logout.jsp" method="post">
            <br />
            <br /> <button> �α׾ƿ� </button>
            <br />
            <br /> </form>
            <%
        }
    %>
    
 
</body>
</html>