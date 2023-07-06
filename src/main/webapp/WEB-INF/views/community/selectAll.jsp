<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="UTP-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/min.css">
<link rel="stylesheet" href="resources/css/community.css">


</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
<body>

	<div class="community_section_top">
		<div class="community_title">
			<h2>
				비슷한 관심사를 가진 <br> 멤버들의 취향 피드 구독하기
			</h2>
			<p>
				나와 비슷한 멤버를 찾아 팔로우하면 <br> 언제 어디서나 더 가볍게 연결할 수 있어요.
			</p>

		</div>
	</div>

	<div class="community_navigation">
		<div class="community_navigation_func">
			<a>인기피드</a> <a>모임후기</a>
		</div>
	</div>
	<div class="community_navigation_upload">
		<button type="button">
			<a href="/community_insert.do">피드 작성</a>
		</button>
	</div>

	<div class="community_review_section">
		<div class="community_review_view">
			<ul class="review_grid">
				<c:forEach var="vo" items="${vos}">
					<li><a href="community_selectOne.do?num=${vo.num}">
							<div class="community_review_img">
								<!-- 이미지를 여기에 추가할 수 있습니다 -->
							</div><strong>${vo.title}</strong>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<div class="footer">
		<div>
			<strong>온앤오프</strong>
			<ul>
				<li>공지사항</li>
				<li>이벤트</li>
				<li>자주 믿는 질문</li>
			</ul>
		</div>
		<div>
			<strong>소셜 미디어</strong>
			<ul>
				<li>인스타그램</li>
				<li>네이버 블로그</li>

			</ul>
		</div>
		<div class="footer_company">
			<strong>온앤오프</strong>
			<ul>
				<li>대표: 팀404 개인정보관리책임자: 팀404</li>
				<li>이메일: Team404@Team404.com 대표번호: 123-1234-1234</li>
				<li>주소: 서울시 강남구 태헤란로 ~~~~~</li>
			</ul>
		</div>

	</div>
</body>
</html>