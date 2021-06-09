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
	ResultSet rs = null;
	
	Vector v_name = new Vector();
	Vector v_email = new Vector();
	Vector v_homepage = new Vector();
	Vector v_subject = new Vector();
	Vector v_memo = new Vector();
	Vector v_hits = new Vector();
	int hits = 0;
	int aid = 0;

	String str_aid = request.getParameter( "str_aid" );
	String str_c_page = request.getParameter( "str_c_page" );

	String sql = "select ";
	sql += "dbname, nvl(dbemail,' '), nvl(dbhomepage,' '), dbsubject, dbmemo, dbhits ";		//	nvl(string, replace_with) - string 값이 null 값일때 replace_with 값으로 바꿀 때 사용
	sql += "from board where aid=" + str_aid;

	try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery( sql );
		if( rs.next() ) 
		{
			v_name.addElement( rs.getString(1) );
			v_email.addElement( rs.getString(2) );
			v_homepage.addElement( rs.getString(3) );
			v_subject.addElement( rs.getString(4) );
			v_memo.addElement( rs.getString(5) );
			v_hits.addElement( rs.getString(6) );
		}
		hits = Integer.parseInt( v_hits.elementAt(0).toString() );
		aid = Integer.parseInt( str_aid );
		hits++;
		sql = "update board set dbhits=" + hits + " where aid=" + aid;
		//글 내용을 볼때마다 hit이 1씩증가
		stmt.executeUpdate( sql );
		rs.close();
		stmt.close();
	} catch( SQLException e ) {
		out.println( e.toString() );
	}
%>
<script language='javascript'>

</script>
<html>
<head>
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
</head>
<body>
<div id = "menu">
 <li><img src="http://npsia.ruatic.net/files/attach/images/172370/xe2439cae9a7d6e6b213935d9c4e22b2f.gif.pagespeed.ic.15BdV4pBFA.png"
 OnClick="window.location='main.jsp'">
 		 <ul>  
        	 <li><a href="intro.jsp">소개</a></li>
            <li><a href="board_list.jsp">잡담게시판</a></li>
            <li><a href="fileupload.jsp">과제 게시판</a></li>
            <li class="tab_login"><a href="login.jsp">로그인</a>
            </li>
        </ul>   
    </div>
</body>
</head>

<table cellspacing = 0 cellpadding = 5 border = 1 width=500>
	<tr><td><b>조회수</b></td><td><%=hits%></td></tr>
	<tr><td><b>이름 </b></td><td><%=v_name.elementAt(0)%></td></tr>
	<tr><td><b>이메일 </b></td><td><%=v_email.elementAt(0)%></td></tr>
	<tr><td><b>홈페이지 </b></td><td><%=v_homepage.elementAt(0)%></td></tr>
	<tr><td><b>제목 </b></td><td><%=v_subject.elementAt(0)%></td></tr>
	<tr><td><b>내용 </b></td><td width=350><%=v_memo.elementAt(0)%></td></tr>
</table>
 
<table  cellspacing = 0 cellpadding = 0 border = 0 width=500>
	<tr><td>
		<input type=button value="목록" OnClick="window.location='board_list.jsp'">
	</td></tr>
</table>

</html>