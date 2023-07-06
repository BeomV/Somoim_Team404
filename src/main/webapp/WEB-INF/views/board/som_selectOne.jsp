<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="UTP-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/min.css">
    <link rel="stylesheet" href="resources/css/board.css">
    <link rel="stylesheet" href="resources/css/board_min.css">
    <script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="resources/js/board.js"></script>
</head>
<body>
    <jsp:include page="../top_menu.jsp"></jsp:include>



    <div class="join_section">
        <jsp:include page="./som_top_menu.jsp"></jsp:include>
        <div class="img_info">
            <img src="resources/uploadimg/${vo2.save_name}" height="300" width="1200">
        </div>
        <div class="som_tit">
            <h1 class="main_tit" style="padding: 10px;">${vo2.som_title}</h1>
            <p style="font-weight: 600; color: #999";>카테고리: ${vo2.category} ㅣ 모임 정원: ${vo2.max_member} ㅣ 모임 개설일: ${vo2.create_date}</p>

<%--            <p>모임 개설일: ${vo2.create_date}</p>--%>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab sapiente necessitatibus illum sint unde ad fugit, voluptatum commodi repudiandae laboriosam. Aperiam possimus, eius tenetur temporibus dolorum laudantium beatae quibusdam fuga?</p>
        </div>
        <div class="join_member">
            <h1>가입한 멤버</h1>
            <ul>
                <li>
                    <div class="round_box">
                        <i class="far fa-user"></i>
                    </div>
                </li>
                <li>
                    <div class="round_box">
                        <i class="far fa-user"></i>
                    </div>
                </li>
                <li>
                    <div class="round_box">
                        <i class="far fa-user"></i>
                    </div>
                </li>
                <li>
                    <div class="round_box">
                        <i class="far fa-user"></i>
                    </div>
                </li>
                <li>
                    <div class="round_box">
                        <i class="far fa-user"></i>
                    </div>
                </li>
                <li>
                    <div class="round_box">
                        <i class="far fa-user"></i>
                    </div>
                </li>
            </ul>
        </div>
        <div class="join_cal">
            <h1>일정</h1>
            <div class="cal_detail">
                <div class="detail_info">
                    <h1>06/17</h1>
                    <br>
                    <strong>서울여행</strong>

                    <p>일시: </p>
                    <p>장소: </p>
                    <p>회비: </p>
                    <p>참여: </p>
                </div>
                <div class="detail_member">
                    <h1>참석 멤버</h1>
                    <ul>
                        <li>
                            <div class="round_box">
                                <i class="far fa-user"></i>
                            </div>
                        </li>
                        <li>
                            <div class="round_box">
                                <i class="far fa-user"></i>
                            </div>
                        </li>
                        <li>
                            <div class="round_box">
                                <i class="far fa-user"></i>
                            </div>
                        </li>
                        <li>
                            <div class="round_box">
                                <i class="far fa-user"></i>
                            </div>
                        </li>
                        <li>
                            <div class="round_box">
                                <i class="far fa-user"></i>
                            </div>
                        </li>
                        <li>
                            <div class="round_box">
                                <i class="far fa-user"></i>
                            </div>
                        </li>
                        <li>
                            <div class="round_box">
                                <i class="far fa-user"></i>
                            </div>
                        </li>
                        <li>
                            <div class="round_box">
                                <i class="far fa-user"></i>
                            </div>
                        </li>

                    </ul>
                </div>
                <div class="detail_status">
                    <button type="button">참석</button>
                    <button type="button">취소</button>
                </div>


            </div>
        </div>
        <button type="button" id="som_register">모임 가입하기</button>
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