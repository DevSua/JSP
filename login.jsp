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
<title>글보기</title>
<style type="text/css">
         /* 기본 설정*/
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
        	 <li><a href="intro.jsp">소개</a></li>
            <li><a href="board_list.jsp">잡담게시판</a></li>
            <li><a href="fileupload.jsp">과제 게시판</a>
            <li class="tab_login"><a href="login.jsp">로그인</a>
            </li>
        </ul>   
    </div>
    <%
        // 현재 로그인된 아이디가 없다면 (= session에 저장된 id가 없다면)
        if(session.getAttribute("id") == null) {
            %>
            <h1> 로그인 페이지 </h1> 
            <br /> <form action="LOGINCHECK.jsp" method="post">
            <br />
            <br /> ID <input name="input_id" type="text">
            <br />
            <br /> PASSWORD <input name="input_pw" type="password"><br><br> <button> 로그인 </button>
            <br /> </form>
            <br /> <button onClick="location.href='join.jsp'"> 회원가입 </button>
            <%
        } 
        // 현재 로그인된 아이디가 있다면 (= session에 저장된 id가 있다면)
        else {
            out.print(session.getAttribute("id") + " 님 환영합니다");
            %>
            <h1> 로그인 페이지 </h1> 
            <br /> <form action="logout.jsp" method="post">
            <br />
            <br /> <button> 로그아웃 </button>
            <br />
            <br /> </form>
            <%
        }
    %>
    
 
</body>
</html>