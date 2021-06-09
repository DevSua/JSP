<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>과제업로드</title>
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
</head>
<body>
<div id = "menu">
 <li><img src="http://npsia.ruatic.net/files/attach/images/172370/xe2439cae9a7d6e6b213935d9c4e22b2f.gif.pagespeed.ic.15BdV4pBFA.png"
 OnClick="window.location='main.jsp'"> <%-- 온클릭 속성은 상단 이미지를 클릭했을때 메인화면으로 바로 돌아가게 설정. --%>
 		 <ul>  
        	 <li><a href="intro.jsp">소개</a></li>
            <li><a href="board_list.jsp">잡담게시판</a></li>
            <li><a href="fileupload.jsp">과제 게시판</a>
            <li class="tab_login"><a href="login.jsp">로그인</a>
            </li>
        </ul>   
    </div>
	<form action="fileupload_pro.jsp" method="post"
	enctype="multipart/form-data">
		<br><p> 파일 : <input type="file" name="filename">		
		<p> <input type ="submit" value="파일 올리기" OnClick="window.location='main.jsp'">
		<input type=button value="목록"  OnClick="window.location='main.jsp'">
		</form>
</body>
</html>