<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>SOLA > 장소 등록</title>
	
	<link rel="stylesheet" type="text/css" href="/sola/css/tip.css">
	<script type="text/javascript" src="/sola/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f80aacb55527fc9a78de91374d1d0c3&libraries=services,clusterer,drawing"></script>
	<style type="text/css">
	.recipe_title{line-height:200px;float:left; width:100%;height:200px; background-size:100% auto; background-position: center center; background-image: url("/sola/img/place.jpg");text-align: left;}
	</style>
	</head>
	<body>
	<div class="recipe_title">
				<span style="cursor:pointer;font-size:25px;padding:10px 13px 10px 3px;margin:7px 30px;background: rgba(255,255,255, 0.7);" onclick="location.href='place.do'">TIP > 혼밥혼술 </span>
			</div>
			<hr style="float: left;width:90%;margin-left:5%;margin-right:5%;margin-top:20px;margin-bottom:20px;">
		<div id="place_add">	<!-- 장소 등록 div -->
    <div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	
    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    <input type="text" value="서울 혼술" id="keyword" size="20"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div><!-- map_wrap END -->
<div class="map_sb">
	<hr>
	<span style="color:#ff8400; margin-left:10px; font-weight: bold; font-size: 25px;">
		${memName }</span><span> 님이 추천하는 장소
	</span><div style="float:right; height:40px; vertical-align:bottom; display: table-cell; line-height: 70px;">
	</div>
	<hr>
	<div id="map_sb_form">
		<form action="addPlace.do" method="post" id="map_sb_form" name="map_sb_form">
		<input type="hidden" value="" id="auto_place_lat" name="auto_place_lat" class="auto_input">
		<input type="hidden" value="" id="auto_place_lng" name="auto_place_lng" class="auto_input">
			<table id="map_sb_tb">
				<tr>
					<th class="left">장소명</th>
					<td class="right"><input type="text" name="auto_placename" id="auto_placename" class="auto_input" required="required" readonly></td>
				</tr>
				<tr>
					<th class="left">지번주소</th>
					<td class="right"><input type="text" name="auto_addressname" id="auto_addressname" required="required" readonly></td>
				</tr>
				<tr>
					<th class="left">도로명주소</th>
					<td class="right"><input type="text" name="auto_roadaddressname" id="auto_roadaddressname" readonly></td>
				</tr>
				<tr>
					<th class="left">전화번호</th>
					<td class="right"><input type="text" name="auto_phone" id="auto_phone" class="auto_input" required="required" readonly></td>
				</tr>
				<tr>
					<th class="left">종 류</th>
					<td class="right" style="line-height: 45px;">
					<select id="map_place_selectType" class="map_place_selectType" name="map_place_selectType">
						<option value="0" selected>종류를 입력하세요.</option>
						<option value="1">혼밥</option>
						<option value="2">혼술</option>
						<option value="3">카페</option>
					</select></td>
				</tr>
				<tr>
					<th class="left">장소설명</th>
					<td class="right"><textarea cols="15" rows="5" name="place_detail" id="place_detail"
					placeholder="장소에 대해 설명해주세요.&#13;&#10;선정 이유를 덧붙여주시면 더 좋습니다.&#13;&#10;(예) 여기서 혼자 비빔국수 먹었는데 추천!"></textarea></td>
				</tr>
			</table>
			<div id="checkb" style="margin-bottom: 10px;">
				<input type="checkbox" id="self_write" value="self_write"/> 직접 입력
			</div>
			<div id="btn_area">
				<input type="button" value="취소" onclick="cancelBtn()" class="place_btn">&nbsp;&nbsp;&nbsp; <input type="button" value="등록" onclick="place_submit()" class="place_btn">
			</div>
		</form>
	</div><!-- map_sb_form END -->
</div><!-- map_sb END -->
</div><!-- place_add END -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f80aacb55527fc9a78de91374d1d0c3&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1, disableAutoPan: true});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

    	 // 페이지 번호를 표출합니다
        displayPagination(pagination);
     
    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(marker, i, places[i]); // 검색 결과 항목 Element를 생성합니다
			
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
			
            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
            
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;
	
    	
    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}


// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(marker, index, places) {
	
    daum.maps.event.addListener(marker, 'click', function() {
		map.setCenter(marker.getPosition());
		map.setLevel(3);
    	document.getElementById('auto_placename').value = places.place_name;
    	document.getElementById('auto_place_lat').value = marker.getPosition().getLat();
    	document.getElementById('auto_place_lng').value = marker.getPosition().getLng();
    	 if (places.road_address_name){
    		 document.getElementById('auto_roadaddressname').value = places.road_address_name;
    	 }else {
    		 document.getElementById('auto_roadaddressname').value = "지번주소와 동일";
    	 }
    	document.getElementById('auto_addressname').value = places.address_name;
    	document.getElementById('auto_phone').value = places.phone;
    });
    
	
    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';
	el.onmouseup = function(){
		map.setCenter(marker.getPosition());
		map.setLevel(3);
		document.getElementById('auto_placename').value = places.place_name;
		document.getElementById('auto_place_lat').value = places.y;
		document.getElementById('auto_place_lng').value = places.x;

   	 if (places.road_address_name){
		 document.getElementById('auto_roadaddressname').value = places.road_address_name;
	 }else {
		 document.getElementById('auto_roadaddressname').value = "지번주소와 동일";
	 }
    	document.getElementById('auto_addressname').value = places.address_name;
    	document.getElementById('auto_phone').value = places.phone;
	}
	
    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

//검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
var dirMarker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
dirInfowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}


var addressDisplay = function(mouseEvent){
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === daum.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
           
            var content = '<div class="bAddr">' +
            '<span class="title" style="font-weight:bold; color:#ff8400;">\<주소정보\></span>' + 
            detailAddr + 
        '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            dirMarker.setPosition(mouseEvent.latLng);
            dirMarker.setMap(map);
            document.getElementById('auto_roadaddressname').value = "";
        	document.getElementById('auto_addressname').value = "";
        	document.getElementById('auto_place_lat').value = mouseEvent.latLng.getLat();
        	document.getElementById('auto_place_lng').value = mouseEvent.latLng.getLng();
        	if (!!result[0].road_address){
       		 document.getElementById('auto_roadaddressname').value = result[0].road_address.address_name;
       	 }
           	document.getElementById('auto_addressname').value = result[0].address.address_name;

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            dirInfowindow.setContent(content);
            dirInfowindow.open(map, dirMarker);
        }   
    });
}

$("#map_sb_form").find("#self_write").on("click", function(e){
	if($(this).is(':checked')){
		/* $(".map_wrap").css({"opacity": 0.4, "pointer-events": "none"}); */
		$("#menu_wrap").fadeOut(500);
		$('.auto_input').val("");
		for(var i = 0; i<markers.length;i++){
			markers[i].setVisible(false);
		}
		daum.maps.event.addListener(map, 'click', addressDisplay);
		$(".auto_input").prop('readonly', false);
	}else{
		$('.auto_input').val("");
		$(".auto_input").prop('readonly', true);
		$("#menu_wrap").fadeIn(500);
		dirInfowindow.close();
		dirMarker.setMap(null);
		for(var i = 0; i<markers.length;i++){
			markers[i].setVisible(true);
		}
		daum.maps.event.removeListener(map, 'click', addressDisplay);
		
	}
});
$("#auto_addressname").on("mouseup", function(){
	alert("해당 칸은 지도 검색을 통해서만 입력 가능합니다.");
});

$("#auto_roadaddressname").on("mouseup", function(){
	alert("해당 칸은 지도 검색을 통해서만 입력 가능합니다.");
});

function cancelBtn(){
	if(confirm("등록을 취소하시겠습니까?")){
		history.back();
	}
}



function place_submit(){
	var flag = false;
	if($("#auto_placename").val() == ""){
		alert("장소명을 입력해주세요.");
		$("#auto_placename").focus();
		return false;
	}
	if($("#auto_addressname").val() == ""){
		alert("주소를 입력해주세요.");
		$("#auto_addressname").focus();
		return false;
	}
	if($("#map_place_selectType option:selected").val() == "0"){
		alert("장소의 종류를 선택해주세요.");
		$("#map_place_selectType").focus();
		return false;
	}
	if($("#place_detail").val() == ""){
		alert("장소 설명을 적어주세요.");
		$("#place_detail").focus();
		return false;
	}
	if($("#auto_phone").val() == ""){
		if(confirm("전화번호가 입력되지 않았습니다.\n그래도 등록하시겠습니까?")){
			document.map_sb_form.submit();
		}else{
			$("#place_detail").focus();
			return false;
		}
	}else{
		if(confirm("작성하신 내용대로 공유하시겠습니까?")){
			document.map_sb_form.submit();
		}
	}
};

</script>

	</body>
</html>