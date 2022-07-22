-- 1. 파일 저장하는 테이블 생성
create table t_board_file(
    no number(10) primary key
    , board_no number(10) not null
    , file_ori_name varchar2(100)
    , file_save_name varchar2(100)
    , file_size number(10)
);

-- 2. 시퀀스 생성
create sequence seq_t_board_file_no nocache;
-- 3. 커밋(적용)
commit;

-- 4. 테이블 정보 확인
desc t_board_file;

-- ���⿡ ÷������ ������ �ȵ�. upload �������� �����.
-- �ܼ� ��� : kr.ac.kopo.board.vo.BoardFileVO@16f27526
select * from t_board_file;
