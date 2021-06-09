<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page language="java" import="java.util.*, java.sql.*, javax.servlet.http.*" %>
<%@ page import="java.io.*, java.text.*" %>

<script language="javascript">
<%--빈칸 입력시  alert --%>
	function writeCheck()
	{
		var form = document.writeform;
		
		if( !form.dbname.value )
		{
			alert( "이름을 적어주세요" );
			form.dbname.focus();
			return;
		}

		if( !form.dbsubject.value )
		{
			alert( "제목을 적어주세요" );
			form.dbsubject.focus();
			return;
		}

		if( !form.dbmemo.value )
		{
			alert( "내용을 적어주세요" );
			form.dbmemo.focus();
			return;
		}

		if( !form.dbemail.value )
		{
			alert( "이메일을 적어주세요" );
			form.dbemail.focus();
			return;
		}

		if( form.dbemail.value.indexOf("@")== -1 )
		{
			alert( "정확한 이메일을 적어주세요" );
			form.dbemail.focus();
			return;
		}

		if( !form.dbhomepage.value )
		{
			alert( "홈페이지를 적어주세요" );
			form.dbhomepage.focus();
			return;
		}

		form.submit();
	}
</script> 

<html>
<head>
<title>게시판 글쓰기</title>
</head>
<%--게시글에 자바빈즈 이용 --%>
<jsp:useBean class="member.memberBean" id="board" scope="page" />
	<jsp:setProperty property="dbname" name="board" value='<%=request.getParameter("dbname")%>' />
	<jsp:setProperty property="dbemail" name="board" value='<%=request.getParameter("dbemail")%>' />
	<jsp:setProperty property="dbhomepage" name="board" value='<%=request.getParameter("dbhomepage")%>' />
	<jsp:setProperty property="dbsubject" name="board" value='<%=request.getParameter("dbsubject")%>' />
	<jsp:setProperty property="dbmemo" name="board" value='<%=request.getParameter("dbmemo")%>' />
	
<table width=700 border=1 cellspacing=0 cellpadding=5>
	<form name=writeform method=post action="board_write_insert.jsp">
		<tr>
			<td><b>이름</b></td>
			<td><input type=text name=dbname size=50  maxlength=50></td>
			<td><jsp:getProperty name="board" property="dbname" /></td>
		</tr>
			<tr><td><b>이메일</b></td>
			<td><input type=text name=dbemail size=50  maxlength=50  placeholder="xxx@xxx.xxx"></td>
			<td><jsp:getProperty name="board" property="dbemail" /></td>
		</tr>
			<tr><td><b>홈페이지</b></td>
			<td><input type=text name=dbhomepage size=50  maxlength=50 placeholder="www.naver.com"></td>
			<td><jsp:getProperty name="board" property="dbhomepage" /></td>
		</tr>
			<tr><td><b>제목</b></td>
			<td><input type=text name=dbsubject size=50  maxlength=50 placeholder="욕설, 비방글은 삭제됩니다"></td>
			<td><jsp:getProperty name="board" property="dbsubject" /></td>
		</tr>
			<tr><td><b>내용</b></td>
			<td><textarea name=dbmemo cols=50 rows=10 placeholder="욕설, 비방글은 삭제 됩니다 에쁜말만 남겨주세요"></textarea></td>
			<td><jsp:getProperty name="board" property="dbmemo" /></td>
		</tr>
	</form>
</table>

<table cellspacing = 0 cellpadding = 0 border = 0 width=500>
	<tr>
		<td><input type=button value="등록" OnClick="javascript:writeCheck();"></td>
	</tr>
</table>

</html>
