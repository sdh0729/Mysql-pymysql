-- 1) CREATE TABLE로 새 테이블 만들기
-- 2) CREATE TABLE에서 기본 키 (PRIMARY KEY) 제약 조건 지정
-- 3) CREATE TABLE에서 고유 키(UNIQUE KEY) 제약 조건 지정
-- 4) CREATE TABLE에서 검사 (CHECK) 제약 조건 지정
-- 5) CREATE TABLE에서 열에 기본값 지정
-- 6) CREATE TABLE에서 외래 키 (FOREIGN KEY) 제약 조건 지정

CREATE DATABASE  STUDENTS;
USE STUDENTS;

--  << 학생 정보를 유지하기 위한 students 테이블 생성 >>- 
/*
student_id: 레코드 ID(정수 유형) -> INT
student_number: 학생 번호(최대 10자리 문자열 유형) -> VARCHAR
first_name: 아래 이름(최대 50자리 문자열 유형)-> VARCHAR
last_name: 이름(최대 50자리 문자열 유형)-> VARCHAR
middle_name: 중간 이름(최대 50자리 문자열 유형)-> VARCHAR
birthday: 생일(날짜형)-> DATE
gender: 성별(문자열 형식으로 M: 남성, F: 여성)-> ENUM
paid_flag : 수업료를 지불했는지 여부 플래그 (BOOL 형식으로 FALSE (0) : 미결제, TRUE (1) : 지불됨) ->BOOL

*/
CREATE TABLE students ( 
	student_id           INT           NOT NULL,
	student_number       varchar(10)   NOT NULL,
	first_name           varchar(50)   NOT NULL,
    last_name            varchar(50)   NOT NULL,
    middle_name          varchar(50)   NOT NULL,
    birthday             DATE          NOT NULL,
    gender               ENUM('M','F') NOT NULL,
    paid_flag            BOOL          NOT NULL
 );
 
 DESC STUDENTS;
 
INSERT INTO students VALUES (1,1,1,1,1,NOW(),'M',true);
INSERT INTO students VALUES (1,1,1,1,1,NOW(),'F',0);

 SELECT *FROM STUDENTS;
 
 -- 2) CREATE TABLE 에서 기본 키 (PRIMARY KEY) 제약 조건 지정.
 -- 테이블당 하나의 컬럼만 지정 할 수 있다. NULL도 안됌 
 CREATE TABLE students02 ( 
    student_id           INT           NOT NULL,
	student_number       varchar(10)   NOT NULL,
	first_name           varchar(50)   NOT NULL,
    last_name            varchar(50)   NOT NULL,
    middle_name          varchar(50)   NOT NULL,
    birthday             DATE          NOT NULL,
    gender               ENUM('M','F') NOT NULL,
    paid_flag            BOOL          NOT NULL,
    PRIMARY KEY (student_id)
 );
DESC STUDENTS02;
INSERT INTO students02 VALUES (1,1,1,1,1,NOW(),'M',true);
INSERT INTO students02 VALUES (2,1,1,1,1,NOW(),'F',0);
INSERT INTO students02 VALUES (null,1,1,1,1,NOW(),'F',0);
SELECT *FROM STUDENTS02;

CREATE TABLE students03 ( 
    student_id           INT,
	student_number       varchar(10),
    PRIMARY KEY (student_id)
 );
 DESC students03;
 
 CREATE TABLE students04 ( 
    student_id           INT AUTO_INCREMENT,
	student_number       varchar(10),
    PRIMARY KEY (student_id)
 );
DESC students04;
INSERT INTO STUDENTS04 VALUES(1,1);
INSERT INTO STUDENTS04 VALUES(2,NULL);
INSERT INTO STUDENTS04 VALUES(NULL,NULL);
INSERT INTO STUDENTS04(student_number) VALUES(NULL);

SELECT *FROM STUDENTS04;
DROP TABLE STUDENTS05;

 CREATE TABLE students05 ( 
    student_id           INT AUTO_INCREMENT,
	student_number       varchar(10) DEFAULT 'ABC',
    PRIMARY KEY (student_id, student_number)
 );
DESC students05;

INSERT INTO STUDENTS05 VALUES(1,1);
INSERT INTO STUDENTS05 VALUES(1,2);
INSERT INTO STUDENTS05 VALUES(2,1);
INSERT INTO STUDENTS05 VALUES(2,2);

SELECT * FROM STUDENTS05;
INSERT INTO STUDENTS05 VALUES(NULL,NULL);

-- 3) CREATE TABLE에서 고유 키(UNIQUE KEY) 제약 조건 지정
-- 4) CREATE TABLE에서 검사 (CHECK) 제약 조건 지정
DROP TABLE STUDENTS06;
  CREATE TABLE students06 ( 
    student_id           INT,
	student_number       varchar(10),
    birthday             DATE,
    UNIQUE KEY (student_id),
    CHECK (birthday >= '2000-01-01')
 );
DESC students06;
INSERT INTO STUDENTS06(student_id)VALUES(NULL);
SELECT *FROM STUDENTS06;
INSERT INTO STUDENTS06(student_id, birthday)VALUES(1,NOW());
INSERT INTO STUDENTS06(student_id, birthday)VALUES(2,NOW());
INSERT INTO STUDENTS06(student_id, birthday)VALUES(3,'1999-09-09');


-- 6) CREATE TABLE에서 외래 키 (FOREIGN KEY) 제약 조건 지정
-- FOREIGN KEY(자신의 테이블 칼럼명 ) REFERENCES 다른테이블명 (다른 테이블의 컬럼명)

DROP TABLE STUDENTS05;

 CREATE TABLE students05 ( 
    student_id           INT AUTO_INCREMENT,
	student_number       varchar(10) DEFAULT 'ABC',
    PRIMARY KEY (student_id, student_number)
 );
DESC students05;
INSERT INTO STUDENTS05 VALUES(1,1);
INSERT INTO STUDENTS05 VALUES(2,2);
SELECT *FROM STUDENTS05;

-- 현재 student_my테이블의 student_id를 student05의 student_id로 참조 
CREATE TABLE student_my(
      student_id INT NOT NULL,
      FOREIGN KEY(student_id)REFERENCES students05(student_id)
      );
INSERT INTO student_my VALUES(7);
INSERT INTO student_my VALUES(1);

-- 제약조건 확인
SELECT *FROM information_schema.table_constraints
where table_name = 'students06';

SELECT *FROM information_schema.table_constraints
where table_name = 'students05';

SELECT *FROM information_schema.table_constraints
where table_name = 'student_my';

-- 07) 제약 조건을 삭제 해보자
SELECT *FROM information_schema.table_constraints
where table_name = 'students03';
alter table students03 drop PRIMARY KEY ;

-- 08) 제약 조건을 추가해 보자. 
SELECT *FROM information_schema.table_constraints
where table_name = 'students03';
alter table students03 ADD constraint PRIMARY KEY(student_id) ;

-- ALTER PRACTICE--
CREATE TABLE t1 (a integer, b char(10));
ALTER TABLE t1 RENAME t2;
ALTER TABLE t2 MODIFY a TINYINT NOT NULL, CHANGE b c CHAR(20);
ALTER TABLE t2 ADD d TIMESTAMP;
ALTER TABLE t2 ADD INDEX(d), ADD UNIQUE(a);
ALTER TABLE t2 DROP COLUMN c;
ALTER TABLE t2 ADD c INT UNSIGNED NOT NULL AUTO_INCREMENT,
               ADD PRIMARY KEY(c);







 
 
 
 
 
 