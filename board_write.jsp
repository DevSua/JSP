<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page language="java" import="java.util.*, java.sql.*, javax.servlet.http.*" %>
<%@ page import="java.io.*, java.text.*" %>

<script language="javascript">
<%--��ĭ �Է½�  alert --%>
	function writeCheck()
	{
		var form = document.writeform;
		
		if( !form.dbname.value )
		{
			alert( "�̸��� �����ּ���" );
			form.dbname.focus();
			return;
		}

		if( !form.dbsubject.value )
		{
			alert( "������ �����ּ���" );
			form.dbsubject.focus();
			return;
		}

		if( !form.dbmemo.value )
		{
			alert( "������ �����ּ���" );
			form.dbmemo.focus();
			return;
		}

		if( !form.dbemail.value )
		{
			alert( "�̸����� �����ּ���" );
			form.dbemail.focus();
			return;
		}

		if( form.dbemail.value.indexOf("@")== -1 )
		{
			alert( "��Ȯ�� �̸����� �����ּ���" );
			form.dbemail.focus();
			return;
		}

		if( !form.dbhomepage.value )
		{
			alert( "Ȩ�������� �����ּ���" );
			form.dbhomepage.focus();
			return;
		}

		form.submit();
	}
</script> 

<html>
<head>
<title>�Խ��� �۾���</title>
</head>
<%--�Խñۿ� �ڹٺ��� �̿� --%>
<jsp:useBean class="member.memberBean" id="board" scope="page" />
	<jsp:setProperty property="dbname" name="board" value='<%=request.getParameter("dbname")%>' />
	<jsp:setProperty property="dbemail" name="board" value='<%=request.getParameter("dbemail")%>' />
	<jsp:setProperty property="dbhomepage" name="board" value='<%=request.getParameter("dbhomepage")%>' />
	<jsp:setProperty property="dbsubject" name="board" value='<%=request.getParameter("dbsubject")%>' />
	<jsp:setProperty property="dbmemo" name="board" value='<%=request.getParameter("dbmemo")%>' />
	
<table width=700 border=1 cellspacing=0 cellpadding=5>
	<form name=writeform method=post action="board_write_insert.jsp">
		<tr>
			<td><b>�̸�</b></td>
			<td><input type=text name=dbname size=50  maxlength=50></td>
			<td><jsp:getProperty name="board" property="dbname" /></td>
		</tr>
			<tr><td><b>�̸���</b></td>
			<td><input type=text name=dbemail size=50  maxlength=50  placeholder="xxx@xxx.xxx"></td>
			<td><jsp:getProperty name="board" property="dbemail" /></td>
		</tr>
			<tr><td><b>Ȩ������</b></td>
			<td><input type=text name=dbhomepage size=50  maxlength=50 placeholder="www.naver.com"></td>
			<td><jsp:getProperty name="board" property="dbhomepage" /></td>
		</tr>
			<tr><td><b>����</b></td>
			<td><input type=text name=dbsubject size=50  maxlength=50 placeholder="�弳, ������ �����˴ϴ�"></td>
			<td><jsp:getProperty name="board" property="dbsubject" /></td>
		</tr>
			<tr><td><b>����</b></td>
			<td><textarea name=dbmemo cols=50 rows=10 placeholder="�弳, ������ ���� �˴ϴ� ���۸��� �����ּ���"></textarea></td>
			<td><jsp:getProperty name="board" property="dbmemo" /></td>
		</tr>
	</form>
</table>

<table cellspacing = 0 cellpadding = 0 border = 0 width=500>
	<tr>
		<td><input type=button value="���" OnClick="javascript:writeCheck();"></td>
	</tr>
</table>

</html>
