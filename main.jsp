<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>부산학생통역협회(PSIA)</title>
     <style type="text/css">
         a{text-decoration:none; color:#000000;}         
         a:hover{color:#ff0000;}                    
         
         div ul{padding-top:10px;
          }   
        div ul li {
            display:inline;                   
            border-left:1px solid #999;   
            font:bold 20px Dotum;                   
            padding:0 10px; 
             text-align:center;                     
        }
         div ul li:first-child{border-left:none;}   
         #menu li.tab_login{float:right;} /*로그인 버튼은 맨 오른쪽으로 보이게 위치설정*/
    </style>

</head>
<body>  
    <div id = "menu">
    <li><img src="http://npsia.ruatic.net/files/attach/images/172370/xe2439cae9a7d6e6b213935d9c4e22b2f.gif.pagespeed.ic.15BdV4pBFA.png">
        <ul>
        	 <li><a href="intro.jsp">소개</a></li>
            <li><a href="board_list.jsp">잡담게시판</a></li>
            <li><a href="fileupload.jsp">과제 게시판</a></li>
            <li class="tab_login"><a href="login.jsp">로그인</a>
            </li>
        </ul>   
    </div>
	<jsp:include page="mainphoto.html" flush="true"/>
   
</body>

</body>
</html>