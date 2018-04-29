<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>SOLA > 장소 보기</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f80aacb55527fc9a78de91374d1d0c3&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript">
	function subBtn(){
		if($('#keyword').val()==''){
			alert("키워드를 입력하세요");
		}else{
			$('#viewExpressForm').submit();
		}
	};
		$(function(){
			$('#keyword').val('${keyword}');
		});
	</script>
	</head>
	<body>
		<div id="place_view">	<!-- 장소 보여주기 div -->
		    <div class="map_place_view">
		    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			
		    <div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <form action="express_view.do" method="post" name="viewExpressForm" id="viewExpressForm">
			            <input type="text" value="" name="keyword" id="keyword" size="19" placeholder="ex) 종로">
                    	<button type="button" onclick="javascript:subBtn()" style="width:50px;">검색</button>
			            <input type="hidden" value="1" id="pg" name="pg">
		            </form>
		        </div>
		        <div style="font-size:11px; color: red;margin-left:4px;margin-top: 3px;">시/군/구 단위의 검색어만 입력하세요.</div>
		        <hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		    </div>
		</div><!-- map_wrap END -->
		
		</div><!-- place_view END -->
		
		<script type="text/javascript">

		
		var totalN = '${totalN}';
		if(totalN == '0'){
			alert("검색 결과가 없습니다.\n검색어에 문제는 없는지 확인해보세요.\nex) 종로3가 > '종로'");
			document.getElementById("keyword").value = '';
            document.viewExpressForm.submit();
		}else{

			var currPage = parseInt('${pg}');
			
			var endPage = parseInt( (parseInt(totalN) + 9) / 10 );
			
			// 마커를 담을 배열입니다
			var markers = [];
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 5	// 지도의 확대 레벨
		    };  

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		var infowindow = new daum.maps.InfoWindow({zindex:2, disableAutoPan: true}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
		var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
	    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	    currCategory = '';
		

			
		    
		     
		     // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
			contentNode.className = 'placeinfo_wrap';
			
			// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
			function addEventHandle(target, type, callback) {
			    if (target.addEventListener) {
			        target.addEventListener(type, callback);
			    } else {
			        target.attachEvent('on' + type, callback);
			    }
			}

			// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
			// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
			addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
			addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);
			
			// 커스텀 오버레이 컨텐츠를 설정합니다
			placeOverlay.setContent(contentNode);
			
		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		 
		displayPlaces();
		displayPagination(currPage, endPage);

		//////////////////////////////////////////////////////
		
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces() {

	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new daum.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    if(markers.length != 0){
	    	removeMarker();
	    }
	    
	    <c:forEach items="${list}" var="item" varStatus="i">
			var index = parseInt('${i.index}');
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new daum.maps.LatLng('${item.express_lat}', '${item.express_lng}'),
	            marker = addMarker(placePosition, index);

	        
	         // 검색결과 항목을 Element로 반환하는 함수입니다
	                var el = document.createElement('li'),
	                itemStr =   '<div class="info">' +'<span class="markerbg marker_' + (index+1) + '"></span>' +
	                          
	                            '   <div class="exp_writer">' +  '${item.express_name}' + '</div>' + 
	                            ' <div class="exp_p_name">' + '<span class="exp_writer_m">&nbsp;님의 추천</span>' + 
	                            '<span class="exp_writer_n">' + '${item.name}' +'</span>'+
	                           '</div>';

	                    itemStr += '    <span>' + '${item.express_roadaddressname}' + '</span>' +
	                                '   <span class="jibun gray" style="text-align:left;">' +  '${item.epxress_addressname}'  + '</span>';
	                
	                             
	                  itemStr +=  '</div>';           

	            	el.onclick = function(){
	            		var content = '<div class="placeinfo">' +
	    	            '   <div class="title">' + '${item.express_name}' + '</div>';   

	    	            content += '    <span>도로명> ' + '${item.express_roadaddressname}' + '</span>' +
	    	            '   <span class="jibun gray">지번> ' +  '${item.epxress_addressname}'  + '</span>' +
	    	            '    <span style="font-weight:bold;color:#ff8400; border-bottom:1px solid gray;">상세위치> ' + '${item.express_addressdetail}' + '</span>';
	    	    
	    				
	    				content += '<span class="placedetail">'+'${item.express_detail}'+'</span>' + '</div>' +
	    				        '<div class="after"></div>';
	    				        
	    				contentNode.innerHTML = content;
	    				placeOverlay.setPosition(new daum.maps.LatLng('${item.express_lat}', '${item.express_lng}'));
	    				map.setCenter(new daum.maps.LatLng(parseFloat('${item.express_lat}')+0.0005, '${item.express_lng}'));
	    				placeOverlay.setMap(map);
	            	};

	                el.innerHTML = itemStr;
	                el.className = 'item';
	            
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
	            el.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };

	            el.onmouseout =  function () {
	                infowindow.close();
	            };
	            
	        })(marker, '${item.name}');

	        daum.maps.event.addListener(marker, 'click', function() {
	        	
				
	        	var content = '<div class="placeinfo">' +
	            '   <div class="title">' + '${item.express_name}' + '</div>';   

	            content += '    <span>도로명> ' + '${item.express_roadaddressname}' + '</span>' +
	            '   <span class="jibun gray">지번> ' +  '${item.epxress_addressname}'  + '</span>' +
	            '    <span style="font-weight:bold;color:#ff8400; border-bottom:1px solid gray;">상세위치> ' + '${item.express_addressdetail}' + '</span>';
	    
				
				content += '<span class="placedetail">'+'${item.express_detail}'+'</span>' + '</div>' +
				        '<div class="after"></div>';
				        
				contentNode.innerHTML = content;
				placeOverlay.setPosition(new daum.maps.LatLng('${item.express_lat}', '${item.express_lng}'));
				map.setCenter(new daum.maps.LatLng(parseFloat('${item.express_lat}')+0.001, '${item.express_lng}'));
				placeOverlay.setMap(map);
	        });

	        fragment.appendChild(el);

	        </c:forEach>
	    
	    

	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
		
	    	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	    map.setDraggable(false);
	}




	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx) {
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

	    daum.maps.event.addListener(marker, 'click', function() {
			map.setCenter(position);
			map.setLevel(3);
	    });
	    
	    
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
	function displayPagination(currPage, endPage) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 

	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    };
	    
	    var el;
		if(10 < currPage){
			el = document.createElement('a');
			el.href = "#";
			el.innerHTML = '<';
			var n = ((currPage-11)/10)*10 + 1;
			el.onclick = (function(n) {
	            return function() {
	                document.getElementById('pg').value = n;
	                document.viewExpressForm.submit();
	            }
	        })(n);
			fragment.appendChild(el);
		}
	    for (i=parseInt((currPage-1)/10)*10+1; i<=parseInt((currPage-1)/10)*10+10; i++) {
	        el = document.createElement('a');
	        el.innerHTML = '&nbsp;'+i+'&nbsp;';

	        if (i==currPage) {
	            el.className = 'on';
	        } else {
		        el.href = "#";
	            el.onclick = (function(i) {
	                return function() {
	                    document.getElementById('pg').value = i;
	                    document.viewExpressForm.submit();
	                }
	            })(i);
	        }

	        fragment.appendChild(el);
	        if(i>=endPage) break;
	    };
	    
		if( parseInt((currPage-1)/10) < parseInt((endPage-1)/10) ){
			el = document.createElement('a');
			el.href = "#";
			el.innerHTML = '>';
			var n = ((currPage+9)/10)*10 + 1;
			el.onclick = (function(n) {
	            return function() {
	                document.getElementById('pg').value = n;
	                document.viewExpressForm.submit();
	            }
	        })(n);
			fragment.appendChild(el);
		}
	    
	    paginationEl.appendChild(fragment);
	}
	//검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	//인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	 var content = '<div style="float:left;width:100%;padding:5px;text-align:center;font-weight:bold;color:#ff8400;z-index:1;">' + title + '</div>';

	 infowindow.setContent(content);
	 infowindow.open(map, marker);
	}

		}

///////////////////////////////////////////////////
		</script>
	</body>
</html>