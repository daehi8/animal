<body>
<div id="wrap">
	<div class="sub_top">
		<div class="location"><p>회원관리 <span>&gt;</span> <strong>ID/비밀번호 찾기</strong></p></div>
				
		<div class="menu">
			<ul>
				
				<li class="mn01"><a href="/web/login/InsideLogin.asp"><img src="/member/common/img/menu01_off.gif" alt="로그인" onmouseover="this.src='/member/common/img/menu01_on.gif'" onmouseout="this.src='/member/common/img/menu01_off.gif'"></a></li>
				<li class="mn02"><a href="/member/html/member_join.asp"><img src="/member/common/img/menu02_off.gif" alt="회원가입" onmouseover="this.src='/member/common/img/menu02_on.gif'" onmouseout="this.src='/member/common/img/menu02_off.gif'"></a></li>				
				<li class="mn04"><a href="/member/html/member_idpw.asp"><img src="/member/common/img/menu04_on.gif" alt="ID/비밀번호 찾기" onmouseover="this.src='/member/common/img/menu04_on.gif'" onmouseout="this.src='/member/common/img/menu04_on.gif'"></a></li>
				
			</ul>
		</div>
	</div>
	<div class="content">
		<h1>ID/비밀번호 찾기</h1>
		<div class="agree">
			<ul class="id_pw_srh">
				<li>
					<div class="srh_box or">
						<div class="srh_top">
							<h2>ID찾기</h2>
							내정보에 등록한 정보로<br> 아이디를 찾을 수 있습니다.
						</div>
						<div class="info">
							<form name="id_form" method="post" action="search_idpw.asp" onsubmit="return chk_idform(this)">
							<input type="hidden" name="s_type" value="id">
								<fieldset>
									<legend>id찾기 폼</legend>
									<p><label for="id_name">이름</label> <input type="text" name="me_name" id="id_name" title="이름 입력"></p>
									<p><label for="id_mobile">휴대폰번호</label>
									<select name="me_hp1">
										<option value="">선택</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select> - <input type="text" name="me_hp2" id="id_mobile1" title="휴대폰번호 입력" style="width:44px;"> - <input type="text" name="me_hp3" id="id_mobile2" title="휴대폰번호 입력" style="width:43px;"></p>
									<p><label for="id_mail">가입시 이메일</label> <input type="text" name="me_email" id="id_mail1" title="가입시 이메일 입력"></p>
									<button type="submit">찾기</button>
								</fieldset>
							</form>
						</div>
					</div>
				</li>
				<li>
					<div class="srh_box br">
						<div class="srh_top">
							<h2>비밀번호 찾기</h2>
							내정보에 등록한 정보로<br> 비밀번호를 재설정할 수 있습니다.
						</div>
						<div class="info">
							<form name="pw_form" method="post" action="search_idpw.asp" onsubmit="return chk_pwform(this)">
							<input type="hidden" name="s_type" value="pw">
								<fieldset>
									<legend>비밀번호 찾기 폼</legend>
									<p><label for="pw_name">ID</label> <input type="text" name="me_id" id="pw_name" title="아이디 입력"></p>
									<p><label for="pw_phone">이름</label> <input type="text" name="me_name" id="pw_phone" title="이름 입력"></p>
									<p><label for="pw_mail">가입시 이메일</label> <input type="text" name="me_email" id="pw_mail2" title="가입시 이메일 입력"></p>
									<button type="submit">찾기</button>
								</fieldset>
							</form>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
		<div class="fxd"><p><a href="/reservation/html/main.asp"><img src="/member/common/img/img_nrental.png" alt="대관강습"></a></p></div>
</div>
<!--nProtect 키보드보안 적용 시작-->
<!--<script type="Text/Javascript" src="http://update.nprotect.net/keycrypt/ansi/npkcx.js"></script>
<!--nProtect 키보드보안 적용 끝-->

</body>