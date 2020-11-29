--상품
create table animals(
       no varchar2(100) primary key, -- 번호 
       name varchar2(100) not null,  -- 상품 이름 
       img varchar2(100),            -- 상품 이미지 
       menual varchar2(100),         -- 상품 설명 
       city varchar2(100),           -- 지점 위치 
       kind varchar2(100),           -- 상품 종류 
       readcount varchar2(100),      -- 조회수 
       reg date default sysdate      -- 생성시간  
);
--구입하면
create table mypet(
    my_no varchar2(100) primary key, -- 고유 번호 
    id varchar2(100),                -- 회원 아이디 
    name varchar2(100),              -- 상품 이름 
    city varchar2(100),              -- 지점 위치 
    reg date default sysdate,        -- 구입 시간 
    state varchar2(100) default '0'  -- 구입 상태 
);
--장바구니
create table pocket(    
    no varchar2(100) primary key,   --번호 
    id varchar2(100),               --회원아이디  
    pb_no varchar2(100)             --상품_번호 
);
--상태정보 
create table state{
    STATE VARCHAR2(100) PRIMARY KEY,    -- 상태정보
    VAL VARCHAR2(100)			        -- 상태정보 설명
};
--문의 게시판  
create table request_b{
    NUM	NUMBER NOT NULL,	        -- 게시글 번호
    TYPE VARCHAR2(100),	            -- 문의 카테고리
    WRITER VARCHAR2(100),	        -- 작성자
    TITLE VARCHAR2(100),	        -- 제목
    CONTENTS VARCHAR2(4000),	    -- 내용
    EMAIL VARCHAR2(100),	        -- 이메일
    PHONE VARCHAR2(100),	        -- 휴대폰 번호
    PASSWD VARCHAR2(100),	        -- 문의 글 비번
    REG_DATA DATE default sysdate,  -- 작성 시간,날짜
    READCOUNT NUMBER default '0',	-- 조회수
    IP VARCHAR2(100),	            -- IP
    REF	 NUMBER,	                -- 게시글에 대한 참조값
    RE_STEP	NUMBER,	                -- 제목글에 대한 댓글에 대한 참조값
    RE_LEVEL NUMBER         	    -- 제목글, 댓글, 댓글의 댓글에 대한 글의 깊이 표시
};
--분양게시판
create table review{
    NUM	NUMBER	NOT NULL,             --게시글번호
    WRITER	VARCHAR2(100),	          --작성자
    SUBJECT	VARCHAR2(100),	          --게시글 제목
    CONTENT	VARCHAR2(100),	          --게시글 내용
    REG_DATE DATE default sysdate,	  --작성당시 시간
    READCOUNT NUMBER default '0',	  --조회
    IMG	VARCHAR2(100)	              --사진파일 업로드
};
--회원 
create table member{
    MEM_NUM		NUMBER,                                    -- 고유번호 
    MEM_ID	NOT NULL	VARCHAR2(30),                      -- 회원 아이디 
    MEM_PASSWORD	NOT NULL	VARCHAR2(30),	           -- 비밀번호 
    MEM_NAME	NOT NULL	VARCHAR2(30),	               -- 이름 
    MEM_GENDER	NOT NULL	VARCHAR2(10),	               -- 성별 
    MEM_EMAIL	NOT NULL	VARCHAR2(30),	               -- 이메일 
    MEM_TEL	NOT NULL	VARCHAR2(30),	                   -- 전화번호 
    MEM_LAND_TEL		VARCHAR2(30),	                   -- 집 전화번호 
    MEM_ZIP_CODE		VARCHAR2(10),	                   -- 우편번호 
    MEM_ADDRESS		VARCHAR2(100),	                       -- 주소 
    MEM_BIRTHDATE		VARCHAR2(20),	                   -- 생년월일 
    MEM_INTERESTED		VARCHAR2(20),	                   -- 관심분야 
    MEM_PURPOSE		VARCHAR2(20),	                       -- 가입목적 
    MEM_FLAG		VARCHAR2(10) default '일반',           -- 회원 형태 
    MEM_LEVEL VARCHAR2(100),                               -- 회원 레벨 
    MEM_REGDATE		TIMESTAMP(6)(11) default sysdate,      -- 가입일 
    TERMS_USE	NOT NULL	VARCHAR2(1),	               -- 이용약관 
    TERMS_PRIVACY	NOT NULL	VARCHAR2(1),	           -- 개인정보 약관 
    TERMS_SNS		VARCHAR2(1)	default 'N',               -- SNS 수신 
    TERMS_EMAIL		VARCHAR2(1)	default 'N',               -- EMAIL 수신 
    TERMS_WITHDRAW		VARCHAR2(1)	default 'N',           -- 회원탈퇴 동의
    TERMS_RESON VARCHAR2(100),                             -- 회원탈퇴 이유 
    MEM_NICNAME		VARCHAR2(30),	                       -- 닉네 임 
    MEM_IMG		VARCHAR2(50)	default 'animal.jpg',      -- 프로필이미지 
    MEM_INTRO		VARCHAR2(100)	default '사지말고 입양하세요', -- 자기소개 
    EP_TYPE		VARCHAR2(20)	default 'N',               -- 기업 형태 
    EP_NAME		VARCHAR2(20)	default 'N',               -- 기업이름 
    EP_REG_NO		VARCHAR2(20)	default 'N',           -- 법인등록번호 
    EP_BIZ_NO		VARCHAR2(20)	default 'N'            -- 사업자 등록번호 기업회원이 아니면 N
};
-- 공지사항게시판  
create table notice{
    NUM	NOT NULL NUMBER,	       --글 번호
    TITLE VARCHAR2(100),	       --제목
    WRITER VARCHAR2(100),	       --작성자
    CONTENTS VARCHAR2(4000),	   --내용
    IMG	VARCHAR2(100),	           --이미지
    REG_DATA DATE default sysdate, --작성 시간
    READCOUNT NUMBER default '0',  --조회수
    REF	NUMBER,	                   --게시글에 대한 참조값
    RE_STEP	NUMBER,	               --제목글에 대한 댓글에 대한 참조값
    RE_LEVEL NUMBER	               -- 제목글, 댓글, 댓글의 댓글에 대한 글의 깊이 표시
};
--방문자  
create table visit{
    REG	DATE default sysdate,	-- 방문시간
    IP VARCHAR2(100)	        -- 방문자 IP
};
--시퀀스  
create sequence animals_seq nocache;
create sequence mypet_seq nocache;
create sequence pocket_seq nocache;
create sequence request_b_seq nocache;
create sequence notice_seq nocache;
create sequence review_seq nocache;
commit;