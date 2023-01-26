/*---------------------JOIN -----------------------*/
-- 테이블의 컬럼간에 공통 값(VALUE)추출하는 것
-- USING(공통칼럼)    ON(컬럼명 다를 때)
-- INNER JOIN = JOIN : 같은 값만 추출 / FALSE, NULL은 추출되지 않음
-- OUTER JOIN : 주종 관계 / 주테이블은 전체를 출력 하고 종테이블이 같 값만 출력
             -- LEFT OUTER JOIN / RIGHT OUTER JOIN
-- CROSS JOIN : 비교 칼럼이 속한 모든 테이블을 출력

-- Q1. INNER JOIN = JOIN을 이용해서 사원의 이름과 사원이 속해있는 부서 이름을 출력하자.
USE MY_EMP;
-- 복사본
CREATE TABLE MY_EMP
AS
SELECT *FROM EMP;
CREATE TABLE MY_DEPT
AS
SELECT *FROM DEPT;

-- ANSI
SELECT ENAME, DNAME
FROM MY_EMP JOIN MY_DEPT USING (DEPTNO);

-- MYSQL
SELECT ENAME, DNAME
FROM MY_EMP , MY_DEPT
WHERE MY_EMP.DEPTNO = MY_DEPT.DEPTNO;

-- Q2) 전체 칼럼을 리턴해서 출력 해보자. Q1 번을 .
SELECT *
FROM MY_EMP JOIN MY_DEPT USING(DEPTNO);

-- Q3) 간단한 테이블을 생성해서 JOIN을 생각해 보자. 
CREATE TABLE X(
X1 VARCHAR(5),
X2 VARCHAR(5)
);

CREATE TABLE Y(
Y1 VARCHAR(5),
Y2 VARCHAR(5)
);

INSERT INTO X VALUES('A','D');
INSERT INTO Y VALUES('A','1');
INSERT INTO Y VALUES('B','2');
INSERT INTO Y VALUES('C','3');
INSERT INTO Y VALUES (NULL, '1');

SELECT * FROM X;
SELECT * FROM Y;

/*
   X1 X2 Y1 Y2
   A. D. A. 1
         B. 2
		 c. 3
        NULL 1
*/
SELECT * 
FROM X, Y
WHERE X1=Y1; 

SELECT *
FROM X JOIN Y ON X1=Y1;

-- Q4) 주종 관계를 이용한 조인을 출력 해보자.alter
SELECT *
FROM X RIGHT OUTER JOIN Y
  ON X1 = Y1; -- Y주 테이블, X 종 테이블

SELECT *
FROM X LEFT OUTER JOIN Y
  ON X1 = Y1; -- X주 테이블, Y 종 테이블
/*
- ANSI RIGHT OUTER JOIN + LEFT OUTER JOIN
- SELECT * FROM X FULL OUTER JOIN Y ON X1 = Y1; //ORACLE, MS SQL
*/

-- Q5) 급여 등급 테이블을 작성해 보자.
CREATE TABLE SALGRADE(
    GRADE INT,
    LOSAL INT,
    HISAL INT
);
insert into salgrade values (1, 700, 1200);
insert into salgrade values (2, 1201, 1400);
insert into salgrade values (3, 1401, 2000);
insert into salgrade values (4, 2001, 3000);
insert into salgrade values (5, 3001, 9999);

SELECT * FROM MY_EMP;

-- Q6) NONEQUI JOIN
 -- 각 사원의 이름과 월급 그리고 그 사원의 급여등급을 출력해보자.
 
SELECT ENAME, SAL, GRADE
FROM MY_EMP JOIN SALGRADE ON (SAL BETWEEN LOSAL AND HISAL);

-- Q7) 각 사원의 이름과 월급 급여등급 부서이름을 출력해보자.
-- 테이블간에 제약 사항이 있는 것을 선 조인, 나머지는 후 조인 
SELECT ENAME, SAL, GRADE, DNAME
FROM MY_EMP JOIN MY_DEPT USING(DEPTNO)
			JOIN SALGRADE ON (SAL BETWEEN LOSAL AND HISAL);
            
-- Q8) SELF JOIN : 테이블 하나에 같은 값을 가진 컬럼을 조인 하는 것
-- 테이블에 별칭 지정 후 조인 
 -- 사원읠 번호와 이름, 관리자의 번호와 이름을 출력 해보자.
  -- 사원의 MGR과 관리자의 EMPNO 같은 값을 조인한다. 
  
SELECT 사원.EMPNO, 사원.ENAME, 관리자.EMPNO, 관리자.ENAME
FROM MY_EMP 사원 LEFT OUTER JOIN MY_EMP 관리자 ON 사원.MGR = 관리자.EMPNO;











