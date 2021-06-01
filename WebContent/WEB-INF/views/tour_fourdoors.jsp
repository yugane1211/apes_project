<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ȥ��Ż��-��빮�ڽ�</title>
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
table{position:absolute;bottom:-6%; left:23%;  }
.main{position: relative; width:inherit; height:inherit;}
section{
position:relative;
height:615px;
}
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

    </style>
</head>
<body>
<c:set var="url" value="/tour_fourdoors"/>
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
                    <th id="fontc">��빮�ڽ�</th>
                    <tr>
                        <td><img src="${root }resources/images/fourdoors.png" class="route"></td>
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
			center : new kakao.maps.LatLng(37.566142104136034, 126.97754813120201), // ������ �߽���ǥ
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
		var a1 = new kakao.maps.LatLng(37.5781951446677, 126.98921356051429);
		var a2 = new kakao.maps.LatLng(37.57734137711175, 126.9892514926765);
		var a3 = new kakao.maps.LatLng(37.57730530221072, 126.98755971824139);
		var a4 = new kakao.maps.LatLng(37.575543623261304, 126.98289406206233);
		var a5 = new kakao.maps.LatLng(37.575910392650584, 126.97960155019742);
		var a6 = new kakao.maps.LatLng(37.5790008037044, 126.97970017383616);
		var a7 = new kakao.maps.LatLng(37.579950748636506, 126.9799960447015);
		var a8 = new kakao.maps.LatLng(37.579938724092855, 126.97980638389039);
		var a9 = new kakao.maps.LatLng(37.57904890247328, 126.97949534016018);
		var a10 = new kakao.maps.LatLng(37.57661964071851, 126.97943478370794);
		var a11 = new kakao.maps.LatLng(37.576583889931264, 126.9768635594674);
		var a12 = new kakao.maps.LatLng(37.57796743287625, 126.97689062498571);
		var a13 = new kakao.maps.LatLng(37.57576690522119, 126.97693737055405);
		var a14 = new kakao.maps.LatLng(37.57572042866218, 126.9755931164774);
		var a15 = new kakao.maps.LatLng(37.57503042710498, 126.97647274582286    );
		var a16 = new kakao.maps.LatLng( 37.57429877962403, 126.97656098254909   );
		var a17 = new kakao.maps.LatLng(37.57426901813427, 126.97593871008121    );
		var a18 = new kakao.maps.LatLng(37.574192488534585, 126.97562757384729    );
		var a19 = new kakao.maps.LatLng(37.574056442134236, 126.9744581563912    );
		var a20 = new kakao.maps.LatLng(37.57018578155172, 126.97497986320496    );
		var a21 = new kakao.maps.LatLng(37.57017729119911, 126.97268929306547    );
		var a22 = new kakao.maps.LatLng(37.570109261154634, 126.97268392864767    );
		var a23 = new kakao.maps.LatLng(37.57012626867157, 126.97569336704832    );
		var a24 = new kakao.maps.LatLng(37.56995194143875, 126.9765624027362    );
		var a25 = new kakao.maps.LatLng(37.569790369492786, 126.9767394285245    );
		var a26 = new kakao.maps.LatLng(37.564883543051515, 126.97695934060089    );
		var a27 = new kakao.maps.LatLng(37.56486652534937, 126.97614394920438    );
		var a28 = new kakao.maps.LatLng(37.56474743384341, 126.97405714094289    );
		var a29 = new kakao.maps.LatLng(37.563356956111704, 126.97390157282594    );
		var a30 = new kakao.maps.LatLng(37.56302531752969, 126.97416445595084    );
		var a31 = new kakao.maps.LatLng(37.56388852620426, 126.97648724889285    );
		var a32 = new kakao.maps.LatLng(37.563777968016886, 126.97657844399592    );
		var a33 = new kakao.maps.LatLng(37.56062699065755, 126.97540363645493    );
		var a34 = new kakao.maps.LatLng(37.559810525643755, 126.97399812198826    );
		var a35 = new kakao.maps.LatLng(37.55955112466811, 126.97175043087321    );
		var a36 = new kakao.maps.LatLng(37.559342752739916, 126.97156804066712    );
		var a37 = new kakao.maps.LatLng(37.558462481216885, 126.97178798179233    );
		var a38 = new kakao.maps.LatLng(37.55702510112647, 126.97260343331575    );
		var a39 = new kakao.maps.LatLng(37.559176899090545, 126.97448634397283    );
		var a40 = new kakao.maps.LatLng(37.560052905576796, 126.97504419893262    );


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
		
		clickLine15 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a15, a16 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine16 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a16, a17 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine17 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a17, a18 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine18 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a18, a19 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine19 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a19, a20 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine20 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a20, a21 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine21 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a21, a22 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine22 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a22, a23 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine23 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a23, a24 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine24 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a24, a25 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine25 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a25, a26 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine26 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a26, a27 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine27 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a27, a28 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine28 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a28, a29 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine29 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a29, a30 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine30 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a30, a31 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine31 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a31, a32 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine32 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a32, a33 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine33 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a33, a34 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine34 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a34, a35 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine35 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a35, a36 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine36 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a36, a37 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine37 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a37, a38 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine38 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a38, a39 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
			strokeWeight : 3, // ���� �β��Դϴ� 
			strokeColor : '#db4040', // ���� �����Դϴ�
			strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
			strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
		});
		clickLine39 = new kakao.maps.Polyline({
			map : map, // ���� ǥ���� �����Դϴ� 
			path : [ a39, a40 ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
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
		displayCircleDot(a16, 0);
		displayCircleDot(a17, 0);
		displayCircleDot(a18, 0);
		displayCircleDot(a19, 0);
		displayCircleDot(a20, 0);
		displayCircleDot(a21, 0);
		displayCircleDot(a22, 0);
		displayCircleDot(a23, 0);
		displayCircleDot(a24, 0);
		displayCircleDot(a25, 0);
		displayCircleDot(a26, 0);
		displayCircleDot(a27, 0);
		displayCircleDot(a28, 0);
		displayCircleDot(a29, 0);
		displayCircleDot(a30, 0);
		displayCircleDot(a31, 0);
		displayCircleDot(a32, 0);
		displayCircleDot(a33, 0);
		displayCircleDot(a34, 0);
		displayCircleDot(a35, 0);
		displayCircleDot(a36, 0);
		displayCircleDot(a37, 0);
		displayCircleDot(a38, 0);
		displayCircleDot(a39, 0);
		displayCircleDot(a40, 0);



		var distance = Math.round(clickLine1.getLength()) + Math.round(clickLine2.getLength()) + Math.round(clickLine3.getLength()) + Math.round(clickLine4.getLength()) + Math.round(clickLine5.getLength()) + Math.round(clickLine6.getLength()) + Math.round(clickLine7.getLength()) + Math.round(clickLine8.getLength()) + Math.round(clickLine9.getLength()) + Math.round(clickLine10.getLength()) + Math.round(clickLine11.getLength()) + Math.round(clickLine12.getLength()) + Math.round(clickLine13.getLength()) + Math.round(clickLine14.getLength()) + Math.round(clickLine15.getLength()) + Math.round(clickLine16.getLength()) + Math.round(clickLine17.getLength()) + Math.round(clickLine18.getLength()) + Math.round(clickLine19.getLength()) + Math.round(clickLine20.getLength()) + Math.round(clickLine21.getLength()) + Math.round(clickLine22.getLength()) + Math.round(clickLine23.getLength()) + Math.round(clickLine24.getLength()) + Math.round(clickLine25.getLength()) + Math.round(clickLine26.getLength()) + Math.round(clickLine27.getLength()) + Math.round(clickLine28.getLength()) + Math.round(clickLine29.getLength()) + Math.round(clickLine30.getLength()) + Math.round(clickLine31.getLength()) + Math.round(clickLine32.getLength()) + Math.round(clickLine33.getLength()) + Math.round(clickLine34.getLength()) + Math.round(clickLine35.getLength()) + Math.round(clickLine36.getLength()) + Math.round(clickLine37.getLength()) + Math.round(clickLine38.getLength()) + Math.round(clickLine39.getLength()), // ���� �� �Ÿ��� ����մϴ�
		content = getTimeHTML(distance); // Ŀ���ҿ������̿� �߰��� �����Դϴ�


		// �׷��� ���� �Ÿ������� ������ ǥ���մϴ�
		showDistance(content, a38);

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
					position : a38, // Ŀ���ҿ������̸� ǥ���� ��ġ�Դϴ�.
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