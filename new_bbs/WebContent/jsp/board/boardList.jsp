<!-- 게시판 목록 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.board.BoardModel, java.util.List" %>
<%
	List<BoardModel> boardList = (List<BoardModel>)request.getAttribute("boardList");
	BoardModel boardModel = (BoardModel)request.getAttribute("boardModel");
	int totalCount = (Integer)request.getAttribute("totalCount");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>NHNEnt. 사전 과제 게시판</title>
<style type="text/css">
	* {font-size: 9pt;}
	p {width: 600px; text-align: right;}
	table thead tr th {background-color: lightgray;}
</style>
<script type="text/javascript">
	function goUrl(url) {
		location.href=url;
	}
</script>
</head>

<body>
	<table border="1" summary="게시판 목록">
		<caption>게시판 목록</caption>
		<colgroup>
			<col width="50" />
			<col width="300" />
			<col width="80" />
			<col width="100" />
			<col width="70" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이메일</th>
				<th>등록 일시</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (totalCount == 0) {
			%>
			<tr>
				<td align="center" colspan="5">등록된 게시물이 없습니다.</td>
			</tr>
			<%
			} else {
				for (int i = 0, num = boardList.size(); i < num; i++) {
					BoardModel board = boardList.get(i);
			%>
			<tr>
				<td align="center"><%=board.getNum()%></td>
				<td><a href="BoardViewServlet?num=<%=board.getNum()%>"><%=board.getSubject()%></a></td>
				<td align="center"><%=board.getEmail()%></td>
				<td align="center"></td>
				<!--  board.getRegDate().substring(0, 10) -->
				<td align="center"><%=board.getHit()%></td>
			</tr>
			<%
				}
			}
			%>
		</tbody>
		
		<tfoot>
		</tfoot>
	</table>
	<p>
		<input type="button" value="목록" onclick="goUrl('<%=request.getContextPath()%>/board/BoardListServlet');" />
		<input type="button" value="글쓰기" onclick="goUrl('<%=request.getContextPath()%>/board/BoardWriteServlet');" />
	</p>
</body>
</html>