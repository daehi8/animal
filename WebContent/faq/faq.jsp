<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
  .checkbox {
    display: none; 
  }
  .title {
    color: purple;
    font-weight: bold;
  }
  .desc {
    max-height: 0px;
    overflow: hidden;
  }
 
  .checkbox:checked + .title + .desc {
    max-height: 1000px;
  }
</style>
<head>

</head>
<body>
<ul class="list">
	<li>
	  <input type="checkbox" class="checkbox" id="list-input1" />
	  <label for="list-input1" class="title">☞ 보호소 봉사활동 신청방법과 봉사내용이 궁금해요</label>
	  <div class="desc">
		  <div>
		   1) 1:1 문의하기 게시판에 방문하고자 하는 지역, 휴대폰 번호, 봉사하려는 인원을 적어 남겨주시면 승인 및 반려 문자가 전송됩니다. 
		   2) 견사 청소+산책으로 이루어지며, 경험의 여부에 따라 목욕이 이루어 질 수도 있습니다. 상황에 따라 봉사내용이 바뀌며, 선택적으로 원하는 것만 하실 수는 없습니다.
		  </div>
	  </div>
	 </li>
	 <li>
	  <input type="checkbox" class="checkbox" id="list-input2" />
	  <label for="list-input2" class="title">☞ 후원을 하고 싶습니다. 어떻게 시작할 수 있나요?</label>
	  <div class="desc">
		  <div>
		   정기적인 후원과 일시적인 후원으로 나누어 설명드릴게요.

 
			1) 정기후원
			애니멀 홈페이지에서 후원하기를 선택하시어 작성하시면 됩니다.
			회원가입바로가기▶
			 
			결연후원은 구조된 동물들의 대부모가 되어 정기적으로 후원해주시는 방법입니다. 학대받아 구조된 동물을 직접 입양하기는 어려운 상황이시라면 대부모가 되어주세요.
			결연후원 바로가기▶
			 
			 
			2) 일시후원
			정기적으로 후원하는 것이 아닌 일회성으로 후원해주시는 방법입니다.
			일시후원 바로가기▶
			 
			직접 후원금을 계좌이체하고 싶으신 경우에는
			국민은행 111111-01-111111 (예금주:사단법인 애니멀)로 후원해주실 수 있습니다.
			 
			 
			3) 물품후원
			보내주신 물품은 반려동물복지센터에서 소중하게 사용됩니다.
			물품 수령 후 사랑곳간 게시판에 올려드리고 있어서 나중에도 확인이 가능하십니다.
			 
			반려동물복지센터에서 필요한 물품은 아래 링크에서 확인해주세요.
			물품후원 바로가기▶
			 
			사랑곳간 바로가기▶
			 
			 
			4) 후원쇼핑
			후원쇼핑은 일반적인 온라인 쇼핑의 개념이 아닌 새로운 형태의 기부입니다.
			동물자유연대의 특정 활동을 지원하거나, 후원을 선물하는 방법입니다.
			 
			이벤트후원 바로가기▶
			 
			
			
			5) 네이버 해피빈
			네이버 해피빈 콩이 있으신가요? 동물자유연대에 해피빈 콩으로도 후원가능하십니다.
			 
			해피빈 바로가기▶ 
			 
			 
			6) 후원업체안내
			후원을 원하시는 업체는 admin@animals.or.kr 로 메일주시거나 02-2292-6337 ARS 4번으로 전화주시면 안내해드리겠습니다.
			  
			 
			또한 필요하신 경우 후원증서를 발급하여 드립니다.
			후원증서를 원하시는 분은 02-1234-5678번으로 전화하셔서 ARS (4번)으로 연락주세요.
			 
			후원해주시는 모든 분들께 진심으로 감사드립니다!
		  </div>
	  </div>
	 </li>
	 <li>
	  <input type="checkbox" class="checkbox" id="list-input3" />
	  <label for="list-input3" class="title">☞ 유기동물을 입양하려면 어떻게 하면 되나요?</label>
	  <div class="desc">
		  <div>
			유기동물의 소중한 가족이 되어 주세요.
			
			 1. 분양동물 페이지에 들어가셔서 특징에 '센터 지역명'을 검색하시면 센터에 있는 아이들이 나옵니다.

			        그 아이들 중에 입양신청서를 넣어주세요. 해당페이지 바로가기▶ 
			
			 2. 센터에 방문하셔서 아이를 직접 보신 후 위 1번의 방법으로 신청해 주시면 됩니다. 
			
			※※ 방문가능 시간 [평일 AM11~PM7]  주말에는 입양 관련 업무를 하지 않습니다. 주말에만 방문 가능하신 경우 센터로 이용하시면서 강아지를 보신 후 입양 신청서를 넣어 주시거나, 평일날 연락 주시면  유선상으로 안내해 드리겠습니다.
		  </div>
	  </div>
	 </li>
	 <li>
	  <input type="checkbox" class="checkbox" id="list-input4" />
	  <label for="list-input4" class="title">☞ 강아지를 구조 했어요.</label>
	  <div class="desc">
		  <div>
			센터 지역 내에서 구조 한 아이는 해당 센터로 데려다 주시면 됩니다. 그 외 지역에서 구조하신 경우  한국동물구조관리협회 031-867-9119 또는 해당 구청 또는 시청에 연락 부탁드립니다.
		  </div>
	  </div>
	 </li>
</ul>
</body>