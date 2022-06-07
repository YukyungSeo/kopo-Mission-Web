-- type : s(슈퍼유저), u(일반유저)
CREATE TABLE T_MEMBER(
	ID 				VARCHAR2(20) PRIMARY KEY,
    NAME 			VARCHAR2(20) NOT NULL,
    PASSWORD 		VARCHAR2(20) NOT NULL,
    EMAIL_ID 		VARCHAR2(30),
    EMAIL_DOMAIN 	VARCHAR2(20),
    TEL1 			CHAR(3),
    TEL2 			CHAR(4),
    TEL3 			CHAR(4),
    POST 			CHAR(6),
    BASIC_ADDR 		VARCHAR2(200),
    DETAIL_ADDR 	VARCHAR2(200),
    TYPE            CHAR(1) default 'U',
    REG_DATE 		DATE default sysdate
);

SELECT * FROM T_MEMBER;


insert into t_member(id, name, password, email_id, email_domain, tel1, tel2, tel3, post, basic_addr, detail_addr)  
values('hong123', '홍길동', 'kd123', 'hong123', 'naver.com', '010', '1111', '2222', '04524', '서울 중구 세종대로', '110 서울특별시청');
insert into t_member(id, name, password, email_id, email_domain, tel1, tel2, tel3, post, basic_addr, detail_addr)  
values('cat12', '고양이', 'cute12', 'cat12', 'gmail.com', '010', '1234', '4567', '03045', '서울 종로구 사직로', '161 경복궁');

commit;