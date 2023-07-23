<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page session="true" %>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="resources/js/board.js"></script>

    <script type="text/javascript">
        $(function(){
            console.log('onload.......');
            $.ajax({
                url:'som_member_profileCheck.do',
                method:'GET',
                data: {
                    num:${param.num}
                },
                success: function(data){
                    console.log('ajax successed...');
                    console.log('data : ', data);

                    let tag_vo = '';
                    $.each(data,function(index,vo){
                        console.log(index,vo);
                        console.log('save_name : ', vo.save_name);
                        tag_vo += `
                        <li>
                            
                                <img src="resources/uploadimg/\${vo.save_name}" width="50"; height="50"; style="border-radius:25px;" >
                        </li>
        			`;
                    });



                    $('#img_members').html(tag_vo);
                },
                error : function(xhr, status, error){
                    console.log('xhr.status : ', xhr.status);
                }




            });//end ajax...
            
            $.ajax({
                url: 'som_schedule_selectOne.do',
                data: {
                    somoim_num: ${param.num}
                },
                success: function(response) {
                    console.log('ajax successsed...response:', response);
                    var now = new Date();
                    console.log('현재 시각:', now); // 현재 시간 체크
                    var closestSchedule = null; // 가장 가까운 일정 저장할 변수 초기화
                    var closestTimeDiff = Infinity;

                    $.each(response, function(index, data) {
                        console.log(index, data);

                        var scheduleTime = new Date(data.schedule_date + ' ' + data.schedule_time);
                        var timeDiff = scheduleTime - now;
                        console.log('시간 확인:', scheduleTime);
                        console.log('남은 시간:', timeDiff);

                        if (timeDiff >= 0 && timeDiff < closestTimeDiff) {
                            closestSchedule = data;
                            closestTimeDiff = timeDiff;
                        }
                    });

                    if (closestSchedule) {
                        var schedule_selectOne = `
                            <h1>일정</h1>
                            <div class="cal_detail">
                                <div class="detail_info">
                                    <h1>06/17</h1>
                                    <br>
                                    <strong>\${closestSchedule.schedule_title}</strong>
                                    <p>일시: \${closestSchedule.schedule_date} \${closestSchedule.schedule_time}</p>
                                    <p>장소: \${closestSchedule.place}</p>
                                    <p>회비: \${closestSchedule.money}</p>
                                </div>
                                <div class="detail_member">
                                    <!-- 참석 멤버 목록 -->
                                    <h1>참석 멤버</h1>
                                    <ul>
                                        <li>
                                            <div class="round_box">
                                                <i class="far fa-user"></i>
                                            </div>
                                        </li>
                                    </ul>

                                </div>
                                <div class="detail_status">
                                    <button type="button"><a href="join_schedule.do?somoim_num=${vo2.num}">참석</a></button>
                                </div>
                            </div>
                        `;

                        $('.join_cal').html(schedule_selectOne);
                    } else {
                        $('.join_cal').html('<p>가까운 일정이 없습니다.</p>');
                    }
                },
                error: function(xhr, status, error) {
                    console.log('xhr.status:', xhr.status);
                }
            });//end ajax...
            
            $("input[id='som_register']").on("click", function(){
            	$.ajax({
            		url:'som_maxmember_check.do',
            		data: {
            			som_title:'${vo2.som_title}'
            		},
            		success : function(response){
            			console.log('response...........?!:', response);
            			
            			if (response >= ${vo2.max_member}) {
                            alert('가입 실패: 소모임 인원이 초과되었습니다.    모임 정원:${vo2.max_member} 명'); // max_member는 서버에서 설정한 최대 인원 수
                        } else {
                        	$.ajax({
                        		url:'som_member_insertOK.do',
                        		method:'POST',
                        		data: {
                        			user_id:'${user_id}',
                        			num:${vo2.num},
                        			som_title:'${vo2.som_title}',
                        			save_name:'${uvo2.save_name}'
                        		},
                        		success : function(response) {
                        			console.log('ajax successed...');
                        			console.log('response : ', response);
                        			
                        			if(response==='OK') {
                        				alert('가입 완료되었습니다.');
                        				location.reload();
                        			} else {
                        				alert('가입 실패: 이미 가입한 소모임입니다.');
                        			}
                        		},
                        		error : function(xhr, status, error){
                        			console.log('xhr.status : ', xhr.status);
                        		}

                        	});//end ajax
                        	
                        }
            		},
            		error : function(xhr, status, error){
            			console.log('xhr.status : ', xhr.status);
            		}

            		
            		
            		
            	});//end ajax..
            	
            	
            	
            });//end click
            
        });
        
        
        
    </script>
  
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>



<!-- <form action="som_member_insertOK.do" method="POST"> -->
    <div class="join_section">

        <c:set var="isMenuShown" value="false" />

        <%-- somoimUser_id 리스트를 순회하며 일치하는 값이 있는지 검사 --%>
        <c:forEach items="${somoimUser_id}" var="som_user_id">
            <c:if test="${som_user_id.user_id eq user_id}">
                <%-- 일치하는 값이 있으면 isMenuShown 변수를 true로 설정 --%>
                <c:set var="isMenuShown" value="true" />
                <%-- som_top_menu.jsp를 포함시킴 --%>
                <jsp:include page="./som_top_menu.jsp"></jsp:include>
            </c:if>
        </c:forEach>

        <%-- isMenuShown 변수가 false일 경우에만 메뉴를 두 번째로 출력 --%>
        <c:if test="${!isMenuShown}">
            <div class="join_gnb">
                <li><a href="som_selectOne.do?num=${num}">홈</a></li>
            </div>
        </c:if>
        <div class="img_info">
            <img style="width: 100%;" src="resources/uploadimg/${vo2.somoim_img}">
        </div>
        <div class="som_tit">
            <h1 class="main_tit" style="padding: 20px;">${vo2.som_title}</h1>
            <p style="font-weight: 600; color: #999; padding-top: 0;">카테고리: ${vo2.category} ㅣ 모임 정원: ${vo2.max_member} ㅣ 모임 개설일: ${formattedDate}</p>
            <p style="font-weight: 600; color: #999;">모임장: ${vo2.somoim_master }</p>

            <%--            <p>모임 개설일: ${vo2.create_date}</p>--%>
            <p style="white-space: pre-wrap">${vo2.som_content}</p>
        </div>
        <div class="join_member">
            <h1>가입한 멤버</h1>
            <ul id="img_members">
	             <li>
	                 <div class="round_box">
	                     <i class="far fa-user"></i>
	                 </div>
	             </li>
                
            </ul>

        </div>
        <div class="join_cal">

        </div>

        <input type="hidden" name="user_id" value="${user_id}">
        <input type="hidden" name="num" value="${vo2.num}">
        <input type="hidden" name="som_title" value="${vo2.som_title}">
        <input type="hidden" name="save_name" value="${uvo2.save_name}">
        <input type="submit" id="som_register" value="모임 가입하기">
        <a href="login.do" id="loginCheck">로그인이 필요합니다.</a>
        <br>
        <br>
        <a href="som_update.do?num=${vo2.num }"><input type="button" id="som_update" value="수정"></a>
        <a href="som_delete.do?num=${vo2.num }&user_id=${user_id}"><input type="button" id="som_delete" value="삭제"></a>

    </div>

<!-- </form> -->
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
            <li>주소: 서울시 강남구 태헤란로</li>
        </ul>
    </div>

</div>

<script type="text/javascript">
    if('${user_id}'==='${vo2.somoim_master}'){
        console.log('${user_id}')
        console.log('너 모임장이네!!');
        $('#som_update').show();
        $('#som_delete').show();
// 	$('#som_register').hide();
    } else {
        console.log('아닌데?');
        $('#som_update').hide();
        $('#som_delete').hide();
    }
    
    if('${user_id}'==='') {
    	console.log('로그인 풀렸어요;;');
    	$('#som_register').hide();
    	$('#loginCheck').show();
    } else {
    	console.log('로그인 OK');
    	$('#loginCheck').hide();
    	$('#som_register').show();
    }
</script>


</body>
</html>