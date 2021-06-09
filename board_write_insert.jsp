<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page language="java" import="java.util.*, java.sql.*, javax.servlet.http.*" %>
<%!
	Connection DB_Connection() throws ClassNotFoundException, SQLException, Exception
	{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Class.forName( "oracle.jdbc.driver.OracleDriver" );
		Connection conn = DriverManager.getConnection( url, "scott", "tiger" );
		return conn;
	}

	String TO_DB( String str ) throws Exception
	{
		if( str == null ) 
			return null;
		return new String( str.getBytes( "8859_1" ), "euc-kr" );
	}
%>

<%
	Connection conn = DB_Connection();
	Statement stmt = null;

	String dbname = request.getParameter( "dbname" );
	dbname = TO_DB( dbname );
	String dbemail = request.getParameter( "dbemail" );
	String dbhomepage = request.getParameter( "dbhomepage" );
	String dbsubject = request.getParameter( "dbsubject" );
	dbsubject = TO_DB( dbsubject );
	String dbmemo = request.getParameter( "dbmemo" );
	dbmemo = TO_DB( dbmemo );

	try
	{
		stmt = conn.createStatement();
		String seq = "select max(aid) from board";
		ResultSet rs = stmt.executeQuery( seq );

		int aid = -1;
		if( rs.next() ) 
			aid = rs.getInt(1);
		aid++;
		
		String sql = "";
		sql += "insert into board values( ";
		sql +=	aid;
		sql +=	", ";
		sql +=	aid;
		sql +=	", '";
		sql +=	dbsubject;
		sql +=	"', '";
		sql +=	dbname;
		sql +=	"', sysdate, '";
		sql +=	dbemail;
		sql +=	"', '";
		sql +=	dbhomepage;	
		sql +=	"', 0, '";
		sql +=	dbmemo;
		sql +=	"')";

		stmt.executeUpdate( sql );
		stmt.close();
	}
	catch( Exception e )
	{
		out.println( e.toString() );
	}
%>

<html>
<head>
	<script language=javascript>
		self.window.alert("입력한 글을 저장하였습니다.");
		location.href="board_list.jsp";
	</script>
</head>
</html>