<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>혹성탈출-한강코스</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${root }resources/css/hammenu.css">
<link rel="stylesheet" href="${root }resources/css/all.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<style>
        #map{width: 1000px; height: 500px; position:absolute; left:15.5%; top:-6.5%; background-color: white;}
        table{position:absolute;bottom:-6%; left:23%; }
        .main{position: relative; width:inherit; height:inherit; }
        .route{width: 800px; }
        th{font-size: larger;}
        .dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	bottom: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.dotOverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.number {
	font-weight: bold;
	color: #ee6152;
}

.dotOverlay:after {
	content: '';
	position: absolute;
	margin-left: -6px;
	left: 50%;
	bottom: -8px;
	width: 11px;
	height: 8px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png');
}

.distanceInfo {
	position: relative;
	top: 5px;
	left: 5px;
	list-style: none;
	margin: 0;
}

.distanceInfo .label {
	display: inline-block;
	width: 50px;
}

.distanceInfo:after {
	content: none;
}

section{
	position:relative;
	height:615px;
}
    </style>
</head>
<body>
<c:set var="url" value="/tour_han"/>
       <br>
        <header style="height:130px;">
       <jsp:include page="hammenu.jsp">
       		<jsp:param value="${url }" name="url"/>
       </jsp:include></header>
<section>
        <div class="main">
            <div id="map">
            </div>
           <div>
                <table>
                    <th id="fontc">한강코스</th>
                    <tr>
                        <td><img src="${root }resources/images/hanriver.png" class="route"></td>
                    </tr>
                </table> 
            </div>    
        </div>
    </section>
    <jsp:include page="footer.jsp"/>
    <script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3bbe0fde41f8644b68f7001a6615cb20"></script>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.535565, 126.897778), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
		var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
		var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
		var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
		var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다

		// 마우스로 클릭한 위치입니다 
		var a1 = new kakao.maps.LatLng(37.54438223677994, 126.88737373130006);
		var a2 = new kakao.maps.LatLng(37.5489141670829, 126.88050949276057);
		var a3 = new kakao.maps.LatLng(37.553627891515454, 126.87803428406787);
		var a4 = new kakao.maps.LatLng(37.547154030448496, 126.88936410530039);
		var a5 = new kakao.maps.LatLng(37.54009283461008, 126.90056633871025);
		var a6 = new kakao.maps.LatLng(37.5371083171585, 126.90575917377826);
		var a7 = new kakao.maps.LatLng(37.535540133068714, 126.90683091362462);
		var a8 = new kakao.maps.LatLng(37.53369873933322, 126.90915301662497);
		var a9 = new kakao.maps.LatLng(37.53330414904696, 126.91063303849495);
		var a10 = new kakao.maps.LatLng(37.534872380168125, 126.91456275132231);
		var a11 = new kakao.maps.LatLng(37.53213048350536, 126.9266708602844);
		var a12 = new kakao.maps.LatLng(37.53017770594927, 126.9306260908669);
		var a13 = new kakao.maps.LatLng(37.51924930268834, 126.94370386928048);
		var a14 = new kakao.maps.LatLng(37.51613239062823, 126.9286357169575);
		var a15 = new kakao.maps.LatLng(37.52055943615903, 126.9168194973789);


		// 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면

		// 상태를 true로, 선이 그리고있는 상태로 변경합니다

		// 지도 위에 선이 표시되고 있다면 지도에서 제거합니다

		// 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다

		// 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
		deleteCircleDot();

		// 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
		clickLine1 = new kakao.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : [ a1, a2 ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		clickLine2 = new kakao.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : [ a2, a3 ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		clickLine3 = new kakao.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : [ a3, a4 ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		clickLine4 = new kakao.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : [ a4, a5 ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		clickLine5 = new kakao.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : [ a5, a6 ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		clickLine6 = new kakao.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : [ a6, a7 ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		clickLine7 = new kakao.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : [ a7, a8 ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		clickLine8 = new kakao.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : [ a8, a9 ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		clickLine9 = new kakao.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : [ a9, a10 ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		clickLine10 = new kakao.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : [ a10, a11 ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		clickLine11 = new kakao.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : [ a11, a12 ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		clickLine12 = new kakao.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : [ a12, a13 ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		clickLine13 = new kakao.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : [ a13, a14 ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		clickLine14 = new kakao.maps.Polyline({
			map : map, // 선을 표시할 지도입니다 
			path : [ a14, a15 ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			strokeWeight : 3, // 선의 두께입니다 
			strokeColor : '#db4040', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});
		
		
		

		// 클릭한 지점에 대한 정보를 지도에 표시합니다
		displayCircleDot(a1, 0);
		displayCircleDot(a2, 0);
		displayCircleDot(a3, 0);
		displayCircleDot(a4, 0);
		displayCircleDot(a5, 0);
		displayCircleDot(a6, 0);
		displayCircleDot(a7, 0);
		displayCircleDot(a8, 0);
		displayCircleDot(a9, 0);
		displayCircleDot(a10, 0);
		displayCircleDot(a11, 0);
		displayCircleDot(a12, 0);
		displayCircleDot(a13, 0);
		displayCircleDot(a14, 0);
		displayCircleDot(a15, 0);


		var distance = Math.round(clickLine1.getLength()) + Math.round(clickLine2.getLength()) + Math.round(clickLine3.getLength()) + Math.round(clickLine4.getLength()) + Math.round(clickLine5.getLength()) + Math.round(clickLine6.getLength()) + Math.round(clickLine7.getLength()) + Math.round(clickLine8.getLength()) + Math.round(clickLine9.getLength()) + Math.round(clickLine10.getLength()) + Math.round(clickLine11.getLength()) + Math.round(clickLine12.getLength()) + Math.round(clickLine13.getLength()) + Math.round(clickLine14.getLength()), // 선의 총 거리를 계산합니다
		content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

		// 그려진 선의 거리정보를 지도에 표시합니다
		showDistance(content, Math.round(clickLine1.getLength()));

		// 지도에 마우스무브 이벤트를 등록합니다
		// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
		kakao.maps.event
				.addListener(
						map,
						'mousemove',
						function(mouseEvent) {

							// 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
							if (drawingFlag) {

								// 마우스 커서의 현재 위치를 얻어옵니다 
								var mousePosition = mouseEvent.latLng;

								// 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
								var path = clickLine.getPath();

								// 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
								var movepath = [ path[path.length - 1],
										mousePosition ];
								moveLine.setPath(movepath);
								moveLine.setMap(map);

								var distance = Math.round(clickLine.getLength()
										+ moveLine.getLength()), // 선의 총 거리를 계산합니다
								content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">'
										+ distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다

								// 거리정보를 지도에 표시합니다
								showDistance(content, mousePosition);
							}
						});

		// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
		// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
		kakao.maps.event.addListener(map, 'rightclick', function(mouseEvent) {

			// 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
			if (drawingFlag) {

				// 마우스무브로 그려진 선은 지도에서 제거합니다
				moveLine.setMap(null);
				moveLine = null;

				// 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
				var path = clickLine.getPath();

				// 선을 구성하는 좌표의 개수가 2개 이상이면
				if (path.length > 1) {

					// 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
					if (dots[dots.length - 1].distance) {
						dots[dots.length - 1].distance.setMap(null);
						dots[dots.length - 1].distance = null;
					}

					var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
					content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

					// 그려진 선의 거리정보를 지도에 표시합니다
					showDistance(content, path[path.length - 1]);

				} else {

					// 선을 구성하는 좌표의 개수가 1개 이하이면 
					// 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
					deleteClickLine();
					deleteCircleDot();
					deleteDistnce();

				}

				// 상태를 false로, 그리지 않고 있는 상태로 변경합니다
				drawingFlag = false;
			}
		});

		// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
		function deleteClickLine() {
			if (clickLine) {
				clickLine.setMap(null);
				clickLine = null;
			}
		}

		// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
		// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
		function showDistance(content, position) {

			if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면

				// 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
				distanceOverlay.setPosition(position);
				distanceOverlay.setContent(content);

			} else { // 커스텀 오버레이가 생성되지 않은 상태이면

				// 커스텀 오버레이를 생성하고 지도에 표시합니다
				distanceOverlay = new kakao.maps.CustomOverlay({
					map : map, // 커스텀오버레이를 표시할 지도입니다
					content : content, // 커스텀오버레이에 표시할 내용입니다
					position : a15, // 커스텀오버레이를 표시할 위치입니다.
					xAnchor : 0,
					yAnchor : 0,
					zIndex : 3
				});
			}
		}

		// 그려지고 있는 선의 총거리 정보와 
		// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
		function deleteDistnce() {
			if (distanceOverlay) {
				distanceOverlay.setMap(null);
				distanceOverlay = null;
			}
		}

		// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
		// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
		function displayCircleDot(position, distance) {

			// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
			var circleOverlay = new kakao.maps.CustomOverlay({
				content : '<span class="dot"></span>',
				position : position,
				zIndex : 1
			});

			// 지도에 표시합니다
			circleOverlay.setMap(map);

			if (distance > 0) {
				// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
				var distanceOverlay = new kakao.maps.CustomOverlay(
						{
							content : '<div class="dotOverlay">거리 <span class="number">'
									+ distance + '</span>m</div>',
							position : position,
							yAnchor : 1,
							zIndex : 2
						});

				// 지도에 표시합니다
				distanceOverlay.setMap(map);
			}

			// 배열에 추가합니다
			dots.push({
				circle : circleOverlay,
				distance : distanceOverlay
			});
		}

		// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
		function deleteCircleDot() {
			var i;

			for (i = 0; i < dots.length; i++) {
				if (dots[i].circle) {
					dots[i].circle.setMap(null);
				}

				if (dots[i].distance) {
					dots[i].distance.setMap(null);
				}
			}

			dots = [];
		}

		// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
		// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
		// HTML Content를 만들어 리턴하는 함수입니다
		function getTimeHTML(distance) {

			// 킥보드의 시속은 평균 25km/h 이고 도보의 분속은 417m/min입니다
			var walkkTime = distance / 417 | 0;
			var walkHour = '', walkMin = '';

			// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
			if (walkkTime > 60) {
				walkHour = '<span class="number">' + Math.floor(walkkTime / 60)
						+ '</span>시간 '
			}
			walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

			// 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
			var bycicleTime = distance / 227 | 0;
			var bycicleHour = '', bycicleMin = '';

			// 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
			if (bycicleTime > 60) {
				bycicleHour = '<span class="number">'
						+ Math.floor(bycicleTime / 60) + '</span>시간 '
			}
			bycicleMin = '<span class="number">' + bycicleTime % 60
					+ '</span>분'

			// 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
			var content = '<ul class="dotOverlay distanceInfo">';
			content += '    <li>';
			content += '        <span class="label">총거리</span><span class="number">'
					+ distance + '</span>m';
			content += '    </li>';
			content += '    <li>';
			content += '        <span class="label">킥보드</span>' + walkHour
					+ walkMin;
			content += '    </li>';
			content += '    <li>';
			content += '        <span class="label">자전거</span>' + bycicleHour
					+ bycicleMin;
			content += '    </li>';
			content += '</ul>'

			return content;
		}
	</script>
</body>
</html>