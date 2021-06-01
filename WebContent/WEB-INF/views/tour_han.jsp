<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ȥ��Ż��-�Ѱ��ڽ�</title>
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
                    <th id="fontc">�Ѱ��ڽ�</th>
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
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
		mapOption = {
			center : new kakao.maps.LatLng(37.535565, 126.897778), // ������ �߽���ǥ
			level : 6
		// ������ Ȯ�� ����
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

		var drawingFlag = false; // ���� �׷����� �ִ� ���¸� ������ ���� �����Դϴ�
		var moveLine; // ���� �׷����� ������ ���콺 �����ӿ� ���� �׷��� �� ��ü �Դϴ�
		var clickLine // ���콺�� Ŭ���� ��ǥ�� �׷��� �� ��ü�Դϴ�
		var distanceOverlay; // ���� �Ÿ������� ǥ���� Ŀ���ҿ������� �Դϴ�
		var dots = {}; // ���� �׷����� ������ Ŭ���� ������ Ŭ�� ������ �Ÿ��� ǥ���ϴ� Ŀ���� �������� �迭�Դϴ�.

		// ������ Ŭ�� �̺�Ʈ�� ����մϴ�
		// ������ Ŭ���ϸ� �� �׸��Ⱑ ���۵˴ϴ� �׷��� ���� ������ ����� �ٽ� �׸��ϴ�

		// ���콺�� Ŭ���� ��ġ�Դϴ� 
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


		// ���� Ŭ���̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� ���°� �ƴϸ�

		// ���¸� true��, ���� �׸����ִ� ���·� �����մϴ�

		// ���� ���� ���� ǥ�õǰ� �ִٸ� �������� �����մϴ�

		// ���� ���� Ŀ���ҿ������̰� ǥ�õǰ� �ִٸ� �������� �����մϴ�

		// ���� ���� ���� �׸��� ���� Ŭ���� ������ �ش� ������ �Ÿ������� ǥ�õǰ� �ִٸ� �������� �����մϴ�
		deleteCircleDot();

		// Ŭ���� ��ġ�� �������� ���� �����ϰ� �������� ǥ���մϴ�
		clickLine1 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a1, a2 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine2 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a2, a3 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine3 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a3, a4 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine4 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a4, a5 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine5 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a5, a6 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine6 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a6, a7 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine7 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a7, a8 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine8 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a8, a9 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine9 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a9, a10 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine10 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a10, a11 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine11 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a11, a12 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine12 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a12, a13 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine13 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a13, a14 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine14 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a14, a15 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		
		
		

		// Ŭ���� ������ ���� ������ ������ ǥ���մϴ�
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


		var distance = Math.round(clickLine1.getLength()) + Math.round(clickLine2.getLength()) + Math.round(clickLine3.getLength()) + Math.round(clickLine4.getLength()) + Math.round(clickLine5.getLength()) + Math.round(clickLine6.getLength()) + Math.round(clickLine7.getLength()) + Math.round(clickLine8.getLength()) + Math.round(clickLine9.getLength()) + Math.round(clickLine10.getLength()) + Math.round(clickLine11.getLength()) + Math.round(clickLine12.getLength()) + Math.round(clickLine13.getLength()) + Math.round(clickLine14.getLength()), // ���� �� �Ÿ��� ����մϴ�
		content = getTimeHTML(distance); // Ŀ���ҿ������̿� �߰��� �����Դϴ�

		// �׷��� ���� �Ÿ������� ������ ǥ���մϴ�
		showDistance(content, Math.round(clickLine1.getLength()));

		// ������ ���콺���� �̺�Ʈ�� ����մϴ�
		// ���� �׸����ִ� ���¿��� ���콺���� �̺�Ʈ�� �߻��ϸ� �׷��� ���� ��ġ�� �������� �����ֵ��� �մϴ�
		kakao.maps.event
				.addListener(
						map,
						'mousemove',
						function(mouseEvent) {

							// ���� ���콺���� �̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� �����̸�
							if (drawingFlag) {

								// ���콺 Ŀ���� ���� ��ġ�� ���ɴϴ� 
								var mousePosition = mouseEvent.latLng;

								// ���콺 Ŭ������ �׷��� ���� ��ǥ �迭�� ���ɴϴ�
								var path = clickLine.getPath();

								// ���콺 Ŭ������ �׷��� ������ ��ǥ�� ���콺 Ŀ�� ��ġ�� ��ǥ�� ���� ǥ���մϴ�
								var movepath = [ path[path.length - 1],
										mousePosition ];
								moveLine.setPath(movepath);
								moveLine.setMap(map);

								var distance = Math.round(clickLine.getLength()
										+ moveLine.getLength()), // ���� �� �Ÿ��� ����մϴ�
								content = '<div class="dotOverlay distanceInfo">�ѰŸ� <span class="number">'
										+ distance + '</span>m</div>'; // Ŀ���ҿ������̿� �߰��� �����Դϴ�

								// �Ÿ������� ������ ǥ���մϴ�
								showDistance(content, mousePosition);
							}
						});

		// ������ ���콺 ������ Ŭ�� �̺�Ʈ�� ����մϴ�
		// ���� �׸����ִ� ���¿��� ���콺 ������ Ŭ�� �̺�Ʈ�� �߻��ϸ� �� �׸��⸦ �����մϴ�
		kakao.maps.event.addListener(map, 'rightclick', function(mouseEvent) {

			// ���� ������ Ŭ�� �̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� �����̸�
			if (drawingFlag) {

				// ���콺����� �׷��� ���� �������� �����մϴ�
				moveLine.setMap(null);
				moveLine = null;

				// ���콺 Ŭ������ �׸� ���� ��ǥ �迭�� ���ɴϴ�
				var path = clickLine.getPath();

				// ���� �����ϴ� ��ǥ�� ������ 2�� �̻��̸�
				if (path.length > 1) {

					// ������ Ŭ�� ������ ���� �Ÿ� ���� Ŀ���� �������̸� ����ϴ�
					if (dots[dots.length - 1].distance) {
						dots[dots.length - 1].distance.setMap(null);
						dots[dots.length - 1].distance = null;
					}

					var distance = Math.round(clickLine.getLength()), // ���� �� �Ÿ��� ����մϴ�
					content = getTimeHTML(distance); // Ŀ���ҿ������̿� �߰��� �����Դϴ�

					// �׷��� ���� �Ÿ������� ������ ǥ���մϴ�
					showDistance(content, path[path.length - 1]);

				} else {

					// ���� �����ϴ� ��ǥ�� ������ 1�� �����̸� 
					// ������ ǥ�õǰ� �ִ� ���� �������� �������� �����մϴ�.
					deleteClickLine();
					deleteCircleDot();
					deleteDistnce();

				}

				// ���¸� false��, �׸��� �ʰ� �ִ� ���·� �����մϴ�
				drawingFlag = false;
			}
		});

		// Ŭ������ �׷��� ���� �������� �����ϴ� �Լ��Դϴ�
		function deleteClickLine() {
			if (clickLine) {
				clickLine.setMap(null);
				clickLine = null;
			}
		}

		// ���콺 �巡�׷� �׷����� �ִ� ���� �ѰŸ� ������ ǥ���ϰ�
		// ���콺 ������ Ŭ������ �� �׸��� ������� �� ���� ������ ǥ���ϴ� Ŀ���� �������̸� �����ϰ� ������ ǥ���ϴ� �Լ��Դϴ�
		function showDistance(content, position) {

			if (distanceOverlay) { // Ŀ���ҿ������̰� ������ �����̸�

				// Ŀ���� ���������� ��ġ�� ǥ���� ������ �����մϴ�
				distanceOverlay.setPosition(position);
				distanceOverlay.setContent(content);

			} else { // Ŀ���� �������̰� �������� ���� �����̸�

				// Ŀ���� �������̸� �����ϰ� ������ ǥ���մϴ�
				distanceOverlay = new kakao.maps.CustomOverlay({
					map : map, // Ŀ���ҿ������̸� ǥ���� �����Դϴ�
					content : content, // Ŀ���ҿ������̿� ǥ���� �����Դϴ�
					position : a15, // Ŀ���ҿ������̸� ǥ���� ��ġ�Դϴ�.
					xAnchor : 0,
					yAnchor : 0,
					zIndex : 3
				});
			}
		}

		// �׷����� �ִ� ���� �ѰŸ� ������ 
		// �� �׸��� ������� �� ���� ������ ǥ���ϴ� Ŀ���� �������̸� �����ϴ� �Լ��Դϴ�
		function deleteDistnce() {
			if (distanceOverlay) {
				distanceOverlay.setMap(null);
				distanceOverlay = null;
			}
		}

		// ���� �׷����� �ִ� ������ �� ������ Ŭ���ϸ� ȣ���Ͽ� 
		// Ŭ�� ������ ���� ���� (���׶�̿� Ŭ�� ���������� �ѰŸ�)�� ǥ���ϴ� �Լ��Դϴ�
		function displayCircleDot(position, distance) {

			// Ŭ�� ������ ǥ���� ���� ���׶�� Ŀ���ҿ������̸� �����մϴ�
			var circleOverlay = new kakao.maps.CustomOverlay({
				content : '<span class="dot"></span>',
				position : position,
				zIndex : 1
			});

			// ������ ǥ���մϴ�
			circleOverlay.setMap(map);

			if (distance > 0) {
				// Ŭ���� ���������� �׷��� ���� �� �Ÿ��� ǥ���� Ŀ���� �������̸� �����մϴ�
				var distanceOverlay = new kakao.maps.CustomOverlay(
						{
							content : '<div class="dotOverlay">�Ÿ� <span class="number">'
									+ distance + '</span>m</div>',
							position : position,
							yAnchor : 1,
							zIndex : 2
						});

				// ������ ǥ���մϴ�
				distanceOverlay.setMap(map);
			}

			// �迭�� �߰��մϴ�
			dots.push({
				circle : circleOverlay,
				distance : distanceOverlay
			});
		}

		// Ŭ�� ������ ���� ���� (���׶�̿� Ŭ�� ���������� �ѰŸ�)�� �������� ��� �����ϴ� �Լ��Դϴ�
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

		// ���콺 ��Ŭ�� �Ͽ� �� �׸��Ⱑ ������� �� ȣ���Ͽ� 
		// �׷��� ���� �ѰŸ� ������ �Ÿ��� ���� ����, ������ �ð��� ����Ͽ�
		// HTML Content�� ����� �����ϴ� �Լ��Դϴ�
		function getTimeHTML(distance) {

			// ű������ �ü��� ��� 25km/h �̰� ������ �м��� 417m/min�Դϴ�
			var walkkTime = distance / 417 | 0;
			var walkHour = '', walkMin = '';

			// ����� ���� �ð��� 60�� ���� ũ�� �ð����� ǥ���մϴ�
			if (walkkTime > 60) {
				walkHour = '<span class="number">' + Math.floor(walkkTime / 60)
						+ '</span>�ð� '
			}
			walkMin = '<span class="number">' + walkkTime % 60 + '</span>��'

			// �������� ��� �ü��� 16km/h �̰� �̰��� �������� �������� �м��� 267m/min�Դϴ�
			var bycicleTime = distance / 227 | 0;
			var bycicleHour = '', bycicleMin = '';

			// ����� ������ �ð��� 60�� ���� ũ�� �ð����� ǥ���մϴ�
			if (bycicleTime > 60) {
				bycicleHour = '<span class="number">'
						+ Math.floor(bycicleTime / 60) + '</span>�ð� '
			}
			bycicleMin = '<span class="number">' + bycicleTime % 60
					+ '</span>��'

			// �Ÿ��� ���� �ð�, ������ �ð��� ������ HTML Content�� ����� �����մϴ�
			var content = '<ul class="dotOverlay distanceInfo">';
			content += '    <li>';
			content += '        <span class="label">�ѰŸ�</span><span class="number">'
					+ distance + '</span>m';
			content += '    </li>';
			content += '    <li>';
			content += '        <span class="label">ű����</span>' + walkHour
					+ walkMin;
			content += '    </li>';
			content += '    <li>';
			content += '        <span class="label">������</span>' + bycicleHour
					+ bycicleMin;
			content += '    </li>';
			content += '</ul>'

			return content;
		}
	</script>
</body>
</html>