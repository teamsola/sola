<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
session.setAttribute("memId","hello");
session.setAttribute("memName", "박안녕");
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert_title_here</title>
<link rel="stylesheet" type="text/css" href="/sola/css/tip.css">
	<script type="text/javascript" src="/sola/js/jquery-3.3.1.min.js"></script>
	<style type="text/css">
		#r_add_title{width:100%; height:170px;background: url("/sola/img/recipe001.jpg") repeat center center;}
		#r_add_content{margin:40px; float:left; width:1200px; overflow:hidden;height:auto;}
		#r_add_subtitle{margin:20px 0;}
		#r_add_subtitle .subtitle_detail{border:1px solid #DCDCDC;height:80px; padding: 20px; font-size:17px; line-height: 26px;}
		#r_add_form{ background-color: #FFE08C; padding:40px;overflow:hidden;height:auto;}
		#r_add_form .form_title{border-bottom:1px solid #5D5D5D; font-size:20px;padding:10px 0;}
		#r_add_form .form_detail{height:100%;}
		.form_input{float:left;width:100%;border-bottom: 1px solid white; padding:40px 0 20px 0;}
		.form_input .write_required{font-weight: bold;color:red; margin-left: 2px;}
		.form_input .subtt{font-size:14px; color:gray;}
		.form_input input[type='text']{width: 98%;font-size: 18px; padding:10px;border-style: none;}
		.form_input_half{float:left;width:50%;}
		.form_input_half select{width:200px;font-size: 17px; padding:10px; height:45px;border-style: none;}
		.form_input_half .subtt{font-size:14px; color:gray;}
		.form_input_half input[type='text']{width: 95%;font-size: 18px; padding:10px;border-style: none;}
		#addBtn{width:100%;border-style: none; cursor:pointer; background:url("/sola/img/add.png") no-repeat center center; height: 40px; font-size: 17px; color:gray; border:1px solid #ff8400; border-radius:10px;}
		#addBtn:hover, #addBtn:active{background: #ff8400 url("/sola/img/add_hover.png") no-repeat center center; color: white;}
		.recipe_btn{outline: none;border-style:none;width:200px; border:1px solid #ff8400; background: none;font-size:16px;border-radius:20px;height:40px;}
		.recipe_btn:hover, .recipe_btn:active{background: #ff8400;color:white;}
	</style>
	<script type="text/javascript">
			var add_count = 4;
			
			
			function minusBtn(){
				add_count--;
				if(add_count<4){
					alert("레시피는 최소 5단계까지 적어주셔야 합니다.");
					add_count = 4;
				}else{
					$('.recipe_pro').find('.recipe'+(add_count+1)).remove();
				}
			};
			
			function plusBtn(){
				add_count++;
				if(add_count>9){
					alert("레시피는 최대 10단계까지 적으실 수 있습니다.");
					add_count = 9;
				}else{
					var content = '';
					content += '<div class="recipe'+add_count+'" style="float:left;width:100%; margin:5px 0;">'+
						'<div style="font-size:14px;float:left;width:10%;text-align:center; line-height: 80px;">단계 '+(add_count+1)+'(선택)</div>'+
						'<div style="float:left;width:90%;"><textarea class="recipe'+add_count+'_detail" name="recipe'+add_count+'" rows="3" style="width:97%;font-size: 16px; padding: 10px; border-style: none; resize: none;"></textarea></div>'+
					'</div>';
					$('.recipe_pro').append(content);
				}
			};


			function cancelBtn(){
				if(confirm("등록을 취소하시겠습니까?")){
					location.href="recipe.do";
				}
			};
			
			function recipe_submit(){
				if($('#foodname').val() == ''){
					alert("요리명은 필수 입력사항입니다.");
					$('#foodname').focus();
					return false;
				}
				if($('#cookingtime').val() == ''){
					alert("조리시간은 필수 입력사항입니다.");
					$('#cookingtime').focus();
					return false;
				}
				if($('#difficulty option:selected').val() == '0'){
					alert("난이도를 선택해주세요.");
					$('#difficulty').focus();
					return false;
				}
				if($('#jaeryo_necessary').val() == ''){
					alert("재료(필수) 항목은 필수 입력사항입니다.");
					$('#jaeryo_necessary').focus();
					return false;
				}
				if($('#jaeryo_nonecessary').val() == 'null'){
					alert("재료(선택) 항목에 null 이라는 단어는 입력할 수 없습니다.");
					$('#jaeryo_nonecessary').val('');
					$('#jaeryo_nonecessary').focus();
					return false;
				}
				if($('.recipe0_detail').val() == ''){
					alert("조리법은 필수 입력사항입니다.\n조리법 1단계 내용을 채워주세요.");
					$('.recipe0_detail').focus();
					return false;
				}

				if($('.recipe1_detail').val() == ''){
					alert("조리법은 필수 입력사항입니다.\n조리법 2단계 내용을 채워주세요.");
					$('.recipe1_detail').focus();
					return false;
				}
				if($('.recipe2_detail').val() == ''){
					alert("조리법은 필수 입력사항입니다.\n조리법 3단계 내용을 채워주세요.");
					$('.recipe2_detail').focus();
					return false;
				}
				if($('.recipe3_detail').val() == ''){
					alert("조리법은 필수 입력사항입니다.\n조리법 4단계 내용을 채워주세요.");
					$('.recipe3_detail').focus();
					return false;
				}
				if($('.recipe4_detail').val() == ''){
					alert("조리법은 필수 입력사항입니다.\n조리법 5단계 내용을 채워주세요.");
					$('.recipe4_detail').focus();
					return false;
				}
				if($('#foodimage').val() == ''){
					if(confirm("이미지가 등록되지 않았습니다.\n그래도 등록하시겠습니까?")){
						$('#recipeForm').submit();
					}
				}else{
					if(confirm("이대로 등록하시겠습니까?")){
						$('#recipeForm').submit();
					}
				}
			};
			$(function(){
				$('#cookingtime').on("keyup", function(){
					$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
				});
				$('#price').on("keyup", function(){
					$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
				});
			});

	</script>
	</head>
	<body>
		<div id="r_add_title">
			<h1 style=" float:left;background: white; font-family:'NanumGothic';font-weight:normal;font-size:40px; margin-top:60px;margin-left: 30px;">레시피 공유하기</h1>
		</div>
		<div id="r_add_content">
			<div id="r_add_subtitle">
				<h2>회원님만의 SOLA récipe 를 기다립니다</h2>
				<div class="subtitle_detail">
					아주 기적적인 확률로 '오늘은 뭔가 요리해먹고 싶다'는 생각이 들 때가 있죠.<br>
					그런 10년에 한 번 나올까말까 한 날에 해드시는 요리가 있나요?<br>
					지금 바로 SOLA 회원들과 요리를 공유해보세요!
				</div>
			</div>
			<div id="r_add_form">
				<div class="form_title">레시피 공유하기</div>
				<div style="text-align: right; color: red;font-size:12px;"> * 는 필수 입력 사항입니다.</div>
				<div class="form_detail"><!-- 레시피 내용 입력 부분 -->
				
				
				<form action="addRecipe.do" method="post" id="recipeForm" enctype="multipart/form-data" name="recipeForm">
					<div class="form_input">
						<div style="padding: 10px 0;">요리명
						<span class="write_required">*</span><span class="subtt"> | 요리 이름을 입력하세요</span>
						</div>
						<input type="text" id="foodname" name="foodname" placeholder="요리명">
					</div>
					<div class="form_input">
						<div style="padding: 10px 0;">한줄소개
						<span class="subtt"> | 요리를 한 줄로 표현해보세요</span>
						</div>
						<input type="text" id="foodname_detail" name="foodname_detail" placeholder="${memName }님의 추천레시피">
					</div>
					<div class="form_input">
						<div class="form_input_half">
							<div style="padding: 10px 0;">조리시간
							<span class="write_required">*</span><span class="subtt"> | 간략한 조리 시간을 적어주세요. (분 단위)</span>
							</div>
							<input type="text" style="width:60px;text-align: right;" id="cookingtime" name="cookingtime">&nbsp;&nbsp;분
						</div>
						<div class="form_input_half">
							<div style="padding: 10px 0;">난이도
							<span class="write_required">*</span><span class="subtt"> | 조리 난이도를 선택해주세요.</span>
							</div>
							<select id="difficulty" name="difficulty">
								<option value="0" selected>--------</option>
								<option value="1">쉬움</option>
								<option value="2">중간</option>
								<option value="3">어려움</option>
							</select>
						</div>
					</div>
					<div class="form_input">
						<div style="padding: 10px 0;">재료(필수)
						<span class="write_required">*</span><span class="subtt"> | 요리에 반드시 들어가야 할 필수 재료를 적어주세요</span>
						</div>
						<input type="text" id="jaeryo_necessary" name="jaeryo_necessary" placeholder="필수 재료">
					</div>
					<div class="form_input">
						<div style="padding: 10px 0;">재료(선택)
						<span class="subtt"> | 기호에 따라 추가할 재료를 적어주세요</span>
						</div>
						<input type="text" id="jaeryo_nonecessary" name="jaeryo_nonecessary" placeholder="선택 재료">
					</div>
					<div class="form_input">
						<div style="padding: 10px 0;">조리법
						<span class="write_required">*</span><span class="subtt"> | 조리 과정을 상세히 적어주세요.</span>
						</div>
						<div class="recipe_pro">
							<div class="recipe0" style="float:left;width:100%; margin:5px 0;">
								<div style="font-size:14px;float:left;width:10%;text-align:center; line-height: 80px;">단계 1<span class="write_required">*</span></div>
								<div style="float:left;width:90%;"><textarea class="recipe0_detail" name="recipe0" rows="3" style="width:97%;font-size: 16px; padding: 10px; border-style: none; resize: none;"></textarea></div>
							</div>
							<div class="recipe1" style="float:left;width:100%; margin:5px 0;">
								<div style="font-size:14px;float:left;width:10%;text-align:center; line-height: 80px;">단계 2<span class="write_required">*</span></div>
								<div style="float:left;width:90%;"><textarea class="recipe1_detail" name="recipe1" rows="3" style="width:97%;font-size: 16px; padding: 10px; border-style: none; resize: none;"></textarea></div>
							</div>
							<div class="recipe2" style="float:left;width:100%; margin:5px 0;">
								<div style="font-size:14px;float:left;width:10%;text-align:center; line-height: 80px;">단계 3<span class="write_required">*</span></div>
								<div style="float:left;width:90%;"><textarea class="recipe2_detail" name="recipe2" rows="3" style="width:97%;font-size: 16px; padding: 10px; border-style: none; resize: none;"></textarea></div>
							</div>
							<div class="recipe3" style="float:left;width:100%; margin:5px 0;">
								<div style="font-size:14px;float:left;width:10%;text-align:center; line-height: 80px;">단계 4<span class="write_required">*</span></div>
								<div style="float:left;width:90%;"><textarea class="recipe3_detail" name="recipe3" rows="3" style="width:97%;font-size: 16px; padding: 10px; border-style: none; resize: none;"></textarea></div>
							</div>
							<div class="recipe4" style="float:left;width:100%; margin:5px 0;">
								<div style="font-size:14px;float:left;width:10%;text-align:center; line-height: 80px;">단계 5<span class="write_required">*</span></div>
								<div style="float:left;width:90%;"><textarea class="recipe4_detail" name="recipe4" rows="3" style="width:97%;font-size: 16px; padding: 10px; border-style: none; resize: none;"></textarea></div>
							</div>
						</div>
						<img src="/sola/img/plus.png" onclick="javascript:plusBtn()" width="20px" height="20px" style="cursor:pointer;float:right; margin: 5px;">
						<img src="/sola/img/minus.png" width="20px" height="20px" onclick="javascript:minusBtn()" style="cursor:pointer;float:right;margin: 5px;">
					</div>
					<div class="form_input">
						<div style="padding: 10px 0;">예상 가격
						<span class="subtt"> | 요리를 완성하는 데 드는 비용을 대략적으로 적어주세요</span>
						</div>
						<input type="text" id="price" name="price" style="width:100px;text-align: right;">&nbsp;원
					</div>
					<div class="form_input">
						<div style="padding: 10px 0;">요리 사진
						<span class="subtt"> | 조리예 사진을 첨부해주세요</span>
						</div>
						<input type="file" id="foodimage" name="foodimage" style="width:500px;">
					</div>
					<div class="form_input">
						<div style="float:right;text-align:right;width:80%;">
							<input type="button" value="취소" onclick="javascript:cancelBtn()" class="recipe_btn">&nbsp;&nbsp;&nbsp; <input type="button" value="등록" onclick="javascript:recipe_submit()" class="recipe_btn">
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
	</body>
</html>