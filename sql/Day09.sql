select 100;
select 100+200;
-- q1) 오늘의 날짜를 출력해보자.
SELECT now() ;

#use my_emp
-- q2) SELECT 컬럼리스트,,, FROM 테이블 명;
	-- 사원테이블(emp) 에 있는 전체 내용을 확인 해보자.
select *
from emp;

-- q3) 부서테이블에 있는 전체 내용을 확인 해보자.
select *
FROM DEPT;

-- q4) my_emp의 내용중에 전체 테이블 목록을 확인 해 보자.
SHOW TABLES;

-- Q5) 사원 테이블의 스키마 구조를 확인 해보자. [필드명, 데이터 타입, 널값 유무, 키값, 기본값, 시퀀스값]
DESC emp;
DESCRIBE emp;

-- q6) 사원테이블에서 사원의 이름, 사원의 번호, 매니저, 봉급을 출력해보자.
SELECT ENAME, EMPNO, MGR, SAL
FROM EMP;

-- q7) 부서테이블에서 부서번호, 부서명 출력 해보자.
SELECT DEPTNO, DNAME
FROM dept;

-- Q8) 두개의 테이블의 모든 내용을 출력 해보자.
SELECT *
FROM EMP,DEPT;

-- Q9) 별칭 : 컬럼의 별칭, 테이블의 별칭 / 컬럼 AS 별칭, 테이블 AS 별칭
-- 사원테이블에서 사원의 이름, 사원의 번호로 두개의 컬럼을 출력해보자.
SELECT ENAME '사원의 이름', EMPNO '사원의 번호'
FROM EMP;

-- Q10) 별칭 : 컬럼의 별칭, 테이블의 별칭 / 컬럼 AS 별칭, 테이블 AS 별칭
-- 사원테이블에서 사원의 이름, 사원의 번호로 두개의 컬럼을 출력해보자.
SELECT ENAME AS '사원의 이름', EMPNO AS '사원의 번호'   -- MY SQL : '' "",  ORACLE : ""
FROM EMP;

-- Q11) 별칭 : 컬럼의 별칭, 테이블의 별칭 / 컬럼 AS 별칭, 테이블 AS 별칭
-- 사원테이블에서 사원이름, 사원번호로 두개의 컬럼을 출력해보자.
select ENAME AS 사원이름, EMPNO AS 사원번호
FROM EMP;

-- Q12) 별칭 : 컬럼의 별칭, 테이블의 별칭 / 컬럼 AS 별칭, 테이블 AS 별칭
-- 사원테이블에서 사원의 이름, 사원의 번호로 두개의 컬럼을 출력해보자.
select ENAME  사원이름, EMPNO  사원번호
FROM EMP;

-- Q13) 테이블의 별칭을 주자 _사원의 이름, 부서번호, 부서명을 출력해보자.
SELECT ENAME, DEPT.DEPTNO, DNAME
FROM EMP, DEPT;

SELECT ENAME, D.DEPTNO, DNAME
FROM EMP, DEPT D;

-- SELECT ENAME, 부서.DEPTNO, DNAME  FROM EMP, DEPT AS "부 서";  X

/* 
SELECT
FROM 
WHERE   	조건문, 숫자비교, 문자비교, 대소문자 비교, NULL, 날짜값 비교
HAVING		GROUP BY의 비교연산
GROUP BY	집계연산 _ SUM, AVG, VAR, MEAN, MAX, MIN... / 함수
ORDER BY	정렬, 서브쿼리
*/


