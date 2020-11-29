--��ǰ
create table animals(
       no varchar2(100) primary key, -- ��ȣ 
       name varchar2(100) not null,  -- ��ǰ �̸� 
       img varchar2(100),            -- ��ǰ �̹��� 
       menual varchar2(100),         -- ��ǰ ���� 
       city varchar2(100),           -- ���� ��ġ 
       kind varchar2(100),           -- ��ǰ ���� 
       readcount varchar2(100),      -- ��ȸ�� 
       reg date default sysdate      -- �����ð�  
);
--�����ϸ�
create table mypet(
    my_no varchar2(100) primary key, -- ���� ��ȣ 
    id varchar2(100),                -- ȸ�� ���̵� 
    name varchar2(100),              -- ��ǰ �̸� 
    city varchar2(100),              -- ���� ��ġ 
    reg date default sysdate,        -- ���� �ð� 
    state varchar2(100) default '0'  -- ���� ���� 
);
--��ٱ���
create table pocket(    
    no varchar2(100) primary key,   --��ȣ 
    id varchar2(100),               --ȸ�����̵�  
    pb_no varchar2(100)             --��ǰ_��ȣ 
);
--�������� 
create table state{
    STATE VARCHAR2(100) PRIMARY KEY,    -- ��������
    VAL VARCHAR2(100)			        -- �������� ����
};
--���� �Խ���  
create table request_b{
    NUM	NUMBER NOT NULL,	        -- �Խñ� ��ȣ
    TYPE VARCHAR2(100),	            -- ���� ī�װ�
    WRITER VARCHAR2(100),	        -- �ۼ���
    TITLE VARCHAR2(100),	        -- ����
    CONTENTS VARCHAR2(4000),	    -- ����
    EMAIL VARCHAR2(100),	        -- �̸���
    PHONE VARCHAR2(100),	        -- �޴��� ��ȣ
    PASSWD VARCHAR2(100),	        -- ���� �� ���
    REG_DATA DATE default sysdate,  -- �ۼ� �ð�,��¥
    READCOUNT NUMBER default '0',	-- ��ȸ��
    IP VARCHAR2(100),	            -- IP
    REF	 NUMBER,	                -- �Խñۿ� ���� ������
    RE_STEP	NUMBER,	                -- ����ۿ� ���� ��ۿ� ���� ������
    RE_LEVEL NUMBER         	    -- �����, ���, ����� ��ۿ� ���� ���� ���� ǥ��
};
--�о�Խ���
create table review{
    NUM	NUMBER	NOT NULL,             --�Խñ۹�ȣ
    WRITER	VARCHAR2(100),	          --�ۼ���
    SUBJECT	VARCHAR2(100),	          --�Խñ� ����
    CONTENT	VARCHAR2(100),	          --�Խñ� ����
    REG_DATE DATE default sysdate,	  --�ۼ���� �ð�
    READCOUNT NUMBER default '0',	  --��ȸ
    IMG	VARCHAR2(100)	              --�������� ���ε�
};
--ȸ�� 
create table member{
    MEM_NUM		NUMBER,                                    -- ������ȣ 
    MEM_ID	NOT NULL	VARCHAR2(30),                      -- ȸ�� ���̵� 
    MEM_PASSWORD	NOT NULL	VARCHAR2(30),	           -- ��й�ȣ 
    MEM_NAME	NOT NULL	VARCHAR2(30),	               -- �̸� 
    MEM_GENDER	NOT NULL	VARCHAR2(10),	               -- ���� 
    MEM_EMAIL	NOT NULL	VARCHAR2(30),	               -- �̸��� 
    MEM_TEL	NOT NULL	VARCHAR2(30),	                   -- ��ȭ��ȣ 
    MEM_LAND_TEL		VARCHAR2(30),	                   -- �� ��ȭ��ȣ 
    MEM_ZIP_CODE		VARCHAR2(10),	                   -- �����ȣ 
    MEM_ADDRESS		VARCHAR2(100),	                       -- �ּ� 
    MEM_BIRTHDATE		VARCHAR2(20),	                   -- ������� 
    MEM_INTERESTED		VARCHAR2(20),	                   -- ���ɺо� 
    MEM_PURPOSE		VARCHAR2(20),	                       -- ���Ը��� 
    MEM_FLAG		VARCHAR2(10) default '�Ϲ�',           -- ȸ�� ���� 
    MEM_LEVEL VARCHAR2(100),                               -- ȸ�� ���� 
    MEM_REGDATE		TIMESTAMP(6)(11) default sysdate,      -- ������ 
    TERMS_USE	NOT NULL	VARCHAR2(1),	               -- �̿��� 
    TERMS_PRIVACY	NOT NULL	VARCHAR2(1),	           -- �������� ��� 
    TERMS_SNS		VARCHAR2(1)	default 'N',               -- SNS ���� 
    TERMS_EMAIL		VARCHAR2(1)	default 'N',               -- EMAIL ���� 
    TERMS_WITHDRAW		VARCHAR2(1)	default 'N',           -- ȸ��Ż�� ����
    TERMS_RESON VARCHAR2(100),                             -- ȸ��Ż�� ���� 
    MEM_NICNAME		VARCHAR2(30),	                       -- �г� �� 
    MEM_IMG		VARCHAR2(50)	default 'animal.jpg',      -- �������̹��� 
    MEM_INTRO		VARCHAR2(100)	default '�������� �Ծ��ϼ���', -- �ڱ�Ұ� 
    EP_TYPE		VARCHAR2(20)	default 'N',               -- ��� ���� 
    EP_NAME		VARCHAR2(20)	default 'N',               -- ����̸� 
    EP_REG_NO		VARCHAR2(20)	default 'N',           -- ���ε�Ϲ�ȣ 
    EP_BIZ_NO		VARCHAR2(20)	default 'N'            -- ����� ��Ϲ�ȣ ���ȸ���� �ƴϸ� N
};
-- �������װԽ���  
create table notice{
    NUM	NOT NULL NUMBER,	       --�� ��ȣ
    TITLE VARCHAR2(100),	       --����
    WRITER VARCHAR2(100),	       --�ۼ���
    CONTENTS VARCHAR2(4000),	   --����
    IMG	VARCHAR2(100),	           --�̹���
    REG_DATA DATE default sysdate, --�ۼ� �ð�
    READCOUNT NUMBER default '0',  --��ȸ��
    REF	NUMBER,	                   --�Խñۿ� ���� ������
    RE_STEP	NUMBER,	               --����ۿ� ���� ��ۿ� ���� ������
    RE_LEVEL NUMBER	               -- �����, ���, ����� ��ۿ� ���� ���� ���� ǥ��
};
--�湮��  
create table visit{
    REG	DATE default sysdate,	-- �湮�ð�
    IP VARCHAR2(100)	        -- �湮�� IP
};
--������  
create sequence animals_seq nocache;
create sequence mypet_seq nocache;
create sequence pocket_seq nocache;
create sequence request_b_seq nocache;
create sequence notice_seq nocache;
create sequence review_seq nocache;
commit;