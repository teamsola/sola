<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<title>Vanilla JS Calendar</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="Chrissy Collins" name="author">
<meta content="A pure vanilla JS calendar by @chrisssycollins" name="description">
<link href="css/vanillaCalendar.css" rel="stylesheet">
	
<script type="text/javascript">

	
	//글저장
	function btn2(){
		
		//선택한 날짜
		var test=document.getElementById("test");
		var result=test.innerHTML;
		
		//작성내용
		var write=document.getElementById("write");
		var content=write.value;
		
		if(!content){
			alert("내용을 입력하세요");
			return false;
		}else{
		
		var aa = new Date(result);
		var result=dateToYYYYMMDD(aa);

		location.href="diaryWrite.do?result="+result+"&content="+content;
		}
	}
	
	
	// Date format 변경 함수
	function dateToYYYYMMDD(date){ 
	    function pad(num) {
	        num = num + '';
	        return num.length < 2 ? '0' + num : num;
	    }
	    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
	}
	
	
	//글 삭제
	function btn3(){
		
		var test=document.getElementById("test");
		var result=test.innerHTML;
		
		var aa = new Date(result);
		var result=dateToYYYYMMDD(aa);
		
		
		if(confirm("정말 삭제하시겠습니까?")==true){
			location.href="diaryDelete.do?diary_date="+result;
		}else{
			return false;
		}
	}
	
	
	//글 수정
	function btn4(){
		
		var content2=document.getElementById("view").value;
		var test=document.getElementById("test");
		var result=test.innerHTML;
		
		var aa = new Date(result);
		var result=dateToYYYYMMDD(aa);
		
		location.href="diaryModifyForm.do?diary_content="+content2+"&diary_date="+result;
	}
	
	
	//모아보기
	function listbtn(){
		location.href="diaryList.do";
	}

	
	</script>
	
	
<style>
html {
	box-sizing: border-box;
	font-size: 10px;
}

body {
	color: #333;
	font-size: 1.6rem;
	background-color: #FFFFFF;
	-webkit-font-smoothing: antialiased;
}

#title{
	padding:20px;
	line-height:150px;
	float:left; 
	width:100%;
	height:150px; 
	background-image: url('/sola/storage/자유게시판.jpg'); 
	background-size:cover; 
	background-position:center; 
	background-repeat: no-repeat;
}

.logo {
	margin: 1.6rem auto;
	text-align: center;
}

#atag{
	color:black;
}

footer {
	text-align: center;
	margin: 1.6rem 0;
}

h1 {
	text-align: center;
}

#hr-sect {
	padding-left:30%;
	padding-right:30%;
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0, 0, 0, 0.35);
	font-size: 16px;
	margin: 8px 0px;
}
	
#hr-sect::before,
#hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 30px 40px;
}

.demo-picked {
	font-size: 1.2rem;
	text-align: center;
}

.demo-picked span {
	font-weight: bold;
}

/* dto내용 div를 감싸는 부분 */
#view{
	text-align:center;
   	width:100%;
   	float:left;
}

/* 버튼 2개 위치 */
#view2{
	text-align:center;
   	width:100%;
   	float:left;
}

/* dto내용 나타나는 div */
#dtoContent{
	margin-left:30%;
	margin-right:30%;
	border:1px solid #BDBDBD;
	padding: 10px; 
	height: auto; 
	min-height: 120px; 
	overflow: auto;
	margin-bottom:20px;
}

/* 글쓰는 textarea */
#write{
	border:1px solid #BDBDBD;
	outline:none;
	margin-bottom:20px;
	resize: none;
}


/* 모아보기 둘러싸는 div */
#ggg{
	margin-left:1030px;
}

/* 모아보기 */
#btn{
	margin-top:40px;
	margin-bottom:30px;
	outline:none;
	text-decoration:none;
	text-indent:0px;
	line-height:16px;
	-moz-border-radius:100px;
	-webkit-border-radius:100px;
	border-radius:100px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:15px;
	background-color:#ffffff;
	color:#ff8400;
	width:150px;
	height:30px;
	border-color:#ff8400;
	border-width:1px;
	border-style:solid;
}
	
/* 저장 */
#btn2{
	margin-top:40px;
	margin-bottom:30px;
	outline:none;
	text-decoration:none;
	text-indent:0px;
	line-height:16px;
	-moz-border-radius:100px;
	-webkit-border-radius:100px;
	border-radius:100px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:15px;
	background-color:#ffffff;
	color:#ff8400;
	width:150px;
	height:30px;
	border-color:#ff8400;
	border-width:1px;
	border-style:solid;
}
	
/* 삭제 */
#btn3{
	float:left;
	margin-right: 15px;
	outline:none;
	text-decoration:none;
	text-indent:0px;
	line-height:16px;
	-moz-border-radius:100px;
	-webkit-border-radius:100px;
	border-radius:100px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:15px;
	background-color:#ffffff;
	color:#ff8400;
	width:150px;
	height:30px;
	border-color:#ff8400;
	border-width:1px;
	border-style:solid;
}

/* 수정 */
#btn4{
	outline:none;
	text-decoration:none;
	text-indent:0px;
	line-height:16px;
	-moz-border-radius:100px;
	-webkit-border-radius:100px;
	border-radius:100px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:15px;
	background-color:#ffffff;
	color:#ff8400;
	width:150px;
	height:30px;
	border-color:#ff8400;
	border-width:1px;
	border-style:solid;
}

/* 모아보기 */
#btn:hover{
	margin-top:40px;
	margin-bottom:30px;
	outline:none;
	text-decoration:none;
	text-indent:0px;
	line-height:16px;
	-moz-border-radius:100px;
	-webkit-border-radius:100px;
	border-radius:100px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:15px;
	background-color:#ff8400;
	color:#ffffff;
	width:150px;
	height:30px;
	border-color:#ff8400;
	border-width:1px;
	border-style:solid;
}

/* 저장 */
#btn2:hover{
	margin-top:40px;
	margin-bottom:30px;
	outline:none;
	text-decoration:none;
	text-indent:0px;
	line-height:16px;
	-moz-border-radius:100px;
	-webkit-border-radius:100px;
	border-radius:100px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:15px;
	background-color:#ff8400;
	color:#ffffff;
	width:150px;
	height:30px;
	border-color:#ff8400;
	border-width:1px;
	border-style:solid;
}

/* 삭제 */
#btn3:hover{
	outline:none;
	text-decoration:none;
	text-indent:0px;
	line-height:16px;
	-moz-border-radius:100px;
	-webkit-border-radius:100px;
	border-radius:100px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:15px;
	background-color:#ff8400;
	color:#ffffff;
	width:150px;
	height:30px;
	border-color:#ff8400;
	border-width:1px;
	border-style:solid;
}

/* 수정 */
#btn4:hover{
	outline:none;
	text-decoration:none;
	text-indent:0px;
	line-height:16px;
	-moz-border-radius:100px;
	-webkit-border-radius:100px;
	border-radius:100px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:15px;
	background-color:#ff8400;
	color:#ffffff;
	width:150px;
	height:30px;
	border-color:#ff8400;
	border-width:1px;
	border-style:solid;
}
	
</style>
</head>

<body>
	
	<div class="container">

		<div id="title">
				<a href="diaryIndex.do" id="atag"><span style="font-size:25px;padding:10px 13px 10px 3px;margin:7px;background: rgba(255,255,255, 0.7);">DIARY</span></a>
			</div>
		
		
		<!-- 모아보기 버튼 -->
		<div id="ggg">
		<input id="btn" type="button" value="모아보기" onclick="location.href='javascript:listbtn()'" >
		</div>
		

		<!-- 전체달력폼 -->
		<div id="v-cal">
		
		
			<!-- 달력상단구성 -->
			<div class="vcal-header">
			
			
				<!-- 이전달 -->
				<button class="vcal-btn" data-calendar-toggle="previous">
					<svg height="24" version="1.1" viewbox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
						<path d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z"></path>
					</svg>
				</button>


				<!-- 현재달 -->
				<div class="vcal-header__label" data-calendar-label="month">
					2017 March
				</div>



				<!-- 다음달 -->
				<button class="vcal-btn" data-calendar-toggle="next">
					<svg height="24" version="1.1" viewbox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
						<path d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z"></path>
					</svg>
				</button>
			</div>
			
			
			<!-- 달력 상단 요일 -->
			<div class="vcal-week">
				<span>Mon</span>
				<span>Tue</span>
				<span>Wed</span>
				<span>Thu</span>
				<span>Fri</span>
				<span>Sat</span>
				<span>Sun</span>
			</div>
			
			
			<!-- 달력 하단 일 표시(1~30) -->
			<div class="vcal-body" data-calendar-area="month" id="zz"></div>
		</div>
		<!-- 전체달력폼 끝 -->
		
		
		
		<!-- 선택한 날짜표시 -->
		<p class="demo-picked">
			<div id="hr-sect">
			<span data-calendar-label="picked" id="test"></span><br><br>
			</div>
		</p>	
	
		
		
		<!-- 선택한 날짜에 따라 내용 표시 or 텍스트박스 생성-->
		<div id="view"></div>	<!-- db에 저장된 내용 -->
		<div id="view2"></div>	<!-- 삭제/저장 -->
		<div id="view3"></div>	<!-- 수정 -->
		<div id="ttt"></div>
	</div>
	
	
	<!-- 달력구성 스크립트 -->
	<script type="text/javascript">
	
	
	var vanillaCalendar = {
			  month: document.querySelectorAll('[data-calendar-area="month"]')[0],
			  next: document.querySelectorAll('[data-calendar-toggle="next"]')[0],
			  previous: document.querySelectorAll('[data-calendar-toggle="previous"]')[0],
			  label: document.querySelectorAll('[data-calendar-label="month"]')[0],
			  activeDates: null,
			  date: new Date(),
			  todaysDate: new Date(),

			  init: function (options) {
			    this.options = options
			    this.date.setDate(1)
			    this.createMonth()
			    this.createListeners()
			  },

			  createListeners: function () {
			    var _this = this
			    
			    
			    
			    //다음달 버튼클릭시
			    this.next.addEventListener('click', function () {
			      _this.clearCalendar()
			      var nextMonth = _this.date.getMonth() + 1
			      _this.date.setMonth(nextMonth)
			      _this.createMonth()
			    })

			    
			    
			    //이전달 버튼클릭시
			    this.previous.addEventListener('click', function () {
			      _this.clearCalendar()
			      var prevMonth = _this.date.getMonth() - 1
			      _this.date.setMonth(prevMonth)
			      _this.createMonth()
			    })
			  },

			  createDay: function (num, day, year) {
			    var newDay = document.createElement('div')
			    var dateEl = document.createElement('span')
			    
			    dateEl.innerHTML = num
			    newDay.className = 'vcal-date'
			    
			   newDay.classList.add(num);
			    
			    
			    
			    <c:if test="${fn:length(list) > 0}">

				  //달력에 내용있으면 일에 밑줄 표시하기
				    /* DTO에 있는 날짜 */
				    <c:forEach var="diaryDTO" items="${list}">
					    var result2= "${diaryDTO.diary_date}";
						
					    /*  달력에있는날짜->date형식변환 */
					    var dateall=this.date
					    var dateall2=dateToYYYYMMDD(dateall)
					    
					    /* 달력에있는날짜 (1~30일 동안) */
					    for(var i=0; i<dateall2.length; i++){
					    	
					    	
					    	/* DTO날짜==달력날짜 같으면 */
						    if(dateall2==result2){
						    		
						    		//해당 일에 밑줄
						    		newDay.style.textDecoration='underline';
						    		newDay.style.color='#ff8400';
					    
					  		  }
					    }
					    
				    </c:forEach>
				</c:if>
			  
				 /*  달력에있는날짜->date형식변환 */
			    var dateall=this.date;
			    newDay.setAttribute('data-calendar-date', dateall)

			    
				
			    
			    // if it's the first day of the month
			    if (num === 1) {
			      if (day === 0) {
			        newDay.style.marginLeft = (6 * 14.28) + '%'
			      } else {
			        newDay.style.marginLeft = ((day - 1) * 14.28) + '%'
			      }
			    }

			    if (this.options.disablePastDays && this.date.getTime() <= this.todaysDate.getTime() - 1) {	//오늘보다 전날짜
			      newDay.classList.add('vcal-date--active')	
			       newDay.setAttribute('data-calendar-status', 'active')
			    } else {	//오늘 이후 날짜
			      newDay.classList.add('vcal-date--active')
			      newDay.setAttribute('data-calendar-status', 'active')
			    }

			    if (this.date.toString() === this.todaysDate.toString()) {
			      newDay.classList.add('vcal-date--today')
			    }

			    newDay.appendChild(dateEl)
			    this.month.appendChild(newDay)
			    
			    
			   
			    
			  },

			  
			  
			  //날짜 클릭했을때
			  dateClicked: function () {
			    var _this = this
			    this.activeDates = document.querySelectorAll(
			      '[data-calendar-status="active"]'
			    )
			    
			    for (var i = 0; i < this.activeDates.length; i++) {
			      this.activeDates[i].addEventListener('click', function (event) {
			        var picked = document.querySelectorAll(
			          '[data-calendar-label="picked"]'
			        )[0]

			        
			        var result=this.dataset.calendarDate
			        
					var aa = new Date(result);
					var result=dateToYYYYMMDD(aa);
					

			        picked.innerHTML = result
			        
			        			        
			        
			        _this.removeActiveClass()
			        this.classList.add('vcal-date--selected')
			        
			       
			        
			        
			      //선택한 날짜
			    	var test=document.getElementById("test");
			    	var result=test.innerHTML
			    	
					var aa = new Date(result);
					var result=dateToYYYYMMDD(aa);

			    	//dto에 내용 존재 확인용
			    	var flag=false;
			    	
			    	//텍스트박스 존재 확인용
			    	var exist=false;
			    	
			    	//index.jsp 에서 받아온 LIST(DTO)
			    	<c:forEach var="diaryDTO" items="${list}">
			    	
			    		//넘어온 date,content
			    		var result2= "${diaryDTO.diary_date}";
			    		var content= "${diaryDTO.diary_content}";
			    	
			    			//선택한 날짜 == DB에 저장된 날짜
			    			while(result==result2){
			    				
			    				if(result==result2){
			    					
			    					
			    					$("#view").html("<div id='dtoContent'>${diaryDTO.diary_content}</div>");
			    					$("#view2").html("<input id='btn3' type='button' value='삭제' onclick='javascript:btn3()'>");
			    					$("#view3").html("<input id='btn4' type='button' value='수정' onclick='javascript:btn4()'>");
			    					
			    					
			    					flag=true;
			    					break;

			    				}else if(result!=result2){
			    					
			    				}
			    			}
			    		
			    	</c:forEach> 
			    	
			    	
			    	
			    	//dto에 저장된 내용이 없을때
			    	if(flag==false){
			    		//텍스트박스 생성
			    		$("#view").html("<textarea rows='10' cols='93' id='write' placeholder='내용을 입력하세요'></textarea>");
			    		$("#view2").html("<input id='btn2' type='button' value='저장' onclick='javascript:btn2()'>");
			    		$("#view3").html("<div></div>");
			    		
			    		}
			        
			      }
			      )//리스너 끝
			    }//for문 끝
			  },
	
		
			  createMonth: function () {
			    var currentMonth = this.date.getMonth()
			    while (this.date.getMonth() === currentMonth) {
			      this.createDay(
			        this.date.getDate(),
			        this.date.getDay(),
			        this.date.getFullYear()
			      )
			      this.date.setDate(this.date.getDate() + 1)
			    }
			    // while loop trips over and day is at 30/31, bring it back
			    this.date.setDate(1)
			    this.date.setMonth(this.date.getMonth() - 1)

			    
			    
			    // 달력에서 년도 달 나타나는부분
			    this.label.innerHTML =
			      this.monthsAsString(this.date.getMonth()) + ' ' + this.date.getFullYear()
			    this.dateClicked()
			  },

			  monthsAsString: function (monthIndex) {
			    return [
			      'January',
			      'Febuary',
			      'March',
			      'April',
			      'May',
			      'June',
			      'July',
			      'August',
			      'September',
			      'October',
			      'November',
			      'December'
			    ][monthIndex]
			  },

			  clearCalendar: function () {
			    vanillaCalendar.month.innerHTML = ''
			  },

			  removeActiveClass: function () {
			    for (var i = 0; i < this.activeDates.length; i++) {
			      this.activeDates[i].classList.remove('vcal-date--selected')
			    }
			  }
			}
	 
	</script>
	<script>
		window.addEventListener('load', function () {
			vanillaCalendar.init({
				disablePastDays: true
				
			});
		})
	</script>
	
</body>

</html>