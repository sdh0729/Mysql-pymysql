-- q1) 전체테이블 목록을 출력하자.
-- use my_emp
show tables;

-- q2) 사원의 이름, 봉금, 커미션을 출력해보자.
select ENAME, SAL, COMM
FROM EMP;

-- q3) 사원의 이름과 매니저를 출력해보자.
select ENAME, MGR
FROM EMP;

-- q4) 사원의 이름과 연봉을 출력해보자.
select ENAME, SAL*12 as 연봉
FROM EMP;

-- q5) 사원의 이름과 급여를 출력하되 급여 = 봉급 + 커미션으로 계산한다. # null 은 연산X
SELECT ENAME, SAL + COMM
FROM EMP;

-- NULL값을 0으로 변환하자. # NULL치환 함수: IFNULL(MYSQL),NVL(ORACLE)= (컬럼, 대체값)
SELECT ENAME, SAL+ifnull(COMM, 0) AS 급여
FROM EMP;

SELECT ENAME, SAL, ifnull(COMM, 0)
FROM EMP;

deSC EMP;

-- Q6) 커미션이 책정되지 않은 사원은 커미션을 3000으로 지정한 후 
-- 사원의 이름, 봉급, 커미션을 출력하자.
SELECT ENAME, SAL, ifnull(COMM, 3000)
FROM EMP;

-- Q7) 급여 = 봉급 + 커미션 - 세금 / 세금 = 봉급의 15%
-- 사원의 이름, 봉급, 커미션, 세금, 급여를 출력하자.
SELECT ENAME AS 이름, SAL AS 봉급, ifnull(COMM, 0) AS 커미션, SAL*0.15 AS 세금, (SAL*0.85)+ifnull(COMM, 0) AS 급여
FROM EMP;

/*
비교연산 > >= < <= = !=             <>
SELECT  ---> 3
FROM    ---> 1
WHERE   ---> 2   결과가 TRUE 일때
*/

-- Q1) 사원의 봉급이 1000인 사원의 이름과 봉급을 출력 해보자.
SELECT ENAME, SAL
FROM EMP
WHERE (SAL >= 1000);

-- Q2) 부서번호가 10번인 사원의 이름과 부서번호를 출력하자. 
SELECT DEPTNO, ENAME
FROM EMP
WHERE (DEPTNO=10);

-- Q3) 부서번호가 10번이고 월급이 1000 이상인 사원의 이름, 부서번호, 월급을 출력하자.
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE (DEPTNO=10 AND SAL>=1000);

-- Q4) 부서번호가 10, 20번인 사원의 이름과 부서번호를 출력해보자.
SELECT ENAME, DEPTNO
FROM EMP
WHERE (DEPTNO=10 OR DEPTNO=20);

-- Q5) 사원의 입사년도가 80년 이후에 입사한 사원의 이름과 입사년도를 출력하자.
SELECT ENAME, HIREDATE
FROM EMP
WHERE (HIREDATE >= '1980/01/01');

SELECT ENAME, HIREDATE
FROM EMP
WHERE (HIREDATE >= '1980/01/01');

SELECT ENAME, HIREDATE
FROM EMP
WHERE (HIREDATE >= '80/01/01');

SELECT ENAME, HIREDATE
FROM EMP
WHERE (HIREDATE >= '80/01/01');

/*
문자열 LIKE %[모든]_[하나]
   'ABCE' LIKE 'A%' => ABCE
*/

-- Q1) 사원테이블에서 사원의 이름이 A로 시작하는 사원의 이름을 출력하자.
SELECT ENAME
FROM EMP
WHERE ENAME LIKE 'A%';

-- Q2) 사원테이블에서 사원이름이 T자가 2개 들어간 사원의 이름을 출력하자.
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%TT%';

-- Q3) 사원테이블에서 사원이름중 L자가 2개 들어간 사원의 이름을 출력하자.
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%LL%';

-- Q4) 사원이름이 T로 끝나는 사원의 이름을 출력하자.
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%T';

-- Q5) 사원이름이 A로 시작하고 N으로 끝나는 사원의 이름을 출력하자.
SELECT ENAME
FROM EMP
WHERE ENAME LIKE 'A%N';

-- Q6) 사원이름이 두번째가 M인 사원의 이름을 출력하자.
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_M%';

/*
SELECT 칼럼1, 칼럼2, 칼럼3
FROM 테이블
ORDER BY 칼럼1;

SELECT 칼럼1, 칼럼2, 칼럼3
FROM 테이블
ORDER BY 1;
ASC / DESC 를 컬럼명 뒤에 오름차순, 내림차순
*/

-- Q1) 사원테이블에서 사원의 이름을 오름차순으로 출력해보자.
SELECT ENAME 
FROM EMP
ORDER BY ENAME ASC;

-- Q2) 사원테이블에서 사원의 이름을 내림차순으로 출력해보자.
SELECT ENAME 
FROM EMP
ORDER BY ENAME DESC;

-- Q3) 사원테이블에서 사원의 이름을 오름차순으로 구현하고 봉금을 내림차순으로 출력해보자.
SELECT ENAME, SAL 
FROM EMP
ORDER BY ENAME ASC, SAL DESC;

/*
집계함수 (컬럼명) : NULL 처리 안됨
SUM, AVG, COUNT, MAX, MIN, STD ...
*/

-- Q1) 봉급을 집계함수를 통해 출력해보자.
SELECT SUM(SAL), AVG(SAL), MAX(SAL), MIN(SAL), STD(SAL)
FROM EMP;

-- Q2) COUNT 함수 사용
select COUNT(ENAME), COUNT(*), COUNT(COMM), count(ifnull(COMM, 0))
FROM EMP;

select sum(COMM), SUM(ifnull(COMM, 0))
FROM EMP;

select AVG(COMM), AVG(ifnull(COMM, 0))
FROM EMP;

select MAX(COMM), MAX(ifnull(COMM, 0))
FROM EMP;

select MIN(COMM), MIN(ifnull(COMM, 0))
FROM EMP;

select STD(COMM), STD(ifnull(COMM, 0))
FROM EMP;

-- Q3) 사원테이블에서 부서번호가 10번인 사원들의 평균 월급을 구해보자.
SELECT AVG(SAL)
FROM EMP
WHERE(DEPTNO=10);

-- Q4) 사원테이블에서 부서번호가 10번과 20번인 사원들의 평균 월급을 구해보자.
SELECT AVG(SAL)
FROM EMP
WHERE(DEPTNO=10 OR DEPTNO=20);

SELECT AVG(SAL)
FROM EMP
WHERE(DEPTNO IN (10, 20));

-- Q5) 사원테이블에서 직업이 SALESMAN인 사원들의 평균 월급을 구해보자.
SELECT AVG(SAL)
FROM EMP
WHERE(JOB = 'SALESMAN');    -- 데이터가 대문자로 이루어져있다.

/*
- GROUP BY 
1. GROUP BY 문 다음에는 데이터를 구분짓기위한 표현식으로
	해당 테이블의 컬럼명이나 변수 값 등이 올 수 있으며 
    그룹함수를 사용한 형태는 올 수 없다< GROUP BY AVG(SAL) 안됨>
    
2. SELECT-LIST에는 GROUP BY문에 명시된 표현식과
	그외 그룹함수를 사용한 표현식만이 올 수 있다.(* 안됨)
    
3. 출력된 결과를 정렬하기 위해 ORDER BY 문을 사용하면 된다.
	단, ORDER BY 문 다음에는 SELECT-LIST에서 명시된 컬럼 또는
    표현식과 컬럼의 별칭(ABCD), 컬럼 번호 등만 사용 
*/

-- Q1) 부서별 평균 월급을 구해라.
SELECT AVG(SAL)
FROM EMP
group by DEPTNO;

SELECT DEPTNO, AVG(SAL)
FROM EMP
group by DEPTNO
ORDER BY 2;

SELECT DEPTNO AS NO, AVG(SAL) AS 평균월급
FROM EMP
group by DEPTNO
ORDER BY 평균월급 DESC;

-- Q2) 직업별 평균 월급을 구하자.
SELECT AVG(SAL)
FROM EMP
group by JOB;

-- Q3) 부서별 평균월급을 구하고, 부서번호 10번의 평균월급을 출력하자.
SELECT DEPTNO, AVG(SAL)
FROM EMP
WHERE (DEPTNO = 10)
GROUP BY DEPTNO;

-- Q4) 직업별 월급의 합을 구하라
SELECT JOB, SUM(SAL)
FROM EMP
group by JOB;

-- Q5) 직업이 SALESMAN인 사원의 월급의 합을 구하라.
SELECT JOB, SUM(SAL)
FROM EMP
WHERE (JOB = 'SALESMAN')
group by JOB;

-- Q6) 사원테이블에서 사원의 최대월급을 출력하라.
SELECT max(SAL)
FROM EMP;

-- Q7) 각 부서별로 최대월급을 출력하라.
SELECT DEPTNO ,max(SAL)
FROM EMP
group by DEPTNO;

/*
IS [NOT] NULL
*/

-- Q1) 사원테이블에서 커미션이 책정되어 있는 사원의 이름과 커미션을 출력하라.
SELECT ENAME, COMM
FROM EMP
WHERE COMM IS NOT NULL;

-- Q2) 사원테이블에서 커미션이 책정되지 않는 사원의 이름과 커미션을 출력하라.
SELECT ENAME, COMM
FROM EMP
WHERE COMM IS NULL;

/*
- HAVING 사용하기
	GROUP함수로 집계된 데이터에 조건을 줄 때 사용한다.
    
    연산자는 GROUP BY 연산에 의하여 나누어진 데이터들을 다시 걸러주기 위해서 사용하고,
	제2의 WHERE조건문이라고 할 수 있으며 조건문에서 그룹함수를 사용가능하다.
    
    HAVING 문 다음에는 SELECT-LIST에서 사용한 컬럼과 그룹함수를 
    사용한 컬럼에 대해서만 조건을 줄 수 있다.
    
[내부 수행(호출) 순서]
SELECT 		-5
FROM		-1
WHERE		-2
GROUP BY	-3
HAVING		-4
ORDER BY	-6

[실행 순서]	중요!!(연 2회 기출문제)
SELECT		-6
FROM		-1
WHERE		-2
GROUP BY	-3
HAVING		-4
ORDER BY	-5
    
*/

-- Q1) 직업별 총월급을 구하고, 총월급이 5000이상만 출력하라.
SELECT JOB, SUM(SAL)
FROM EMP
GROUP BY JOB
HAVING (SUM(SAL) >= 5000);

-- Q2) 부서별 월급의 합을 구하고 그 총합이 10000 이상만 출력하라.
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING (SUM(SAL) >= 10000);

/*
WITH ROLLUP = 그룹총합, 부분소계 : ROLLUP 연산자는 GROUP BY 문과 함께 사용되며
	GROUP BY 문에서 명시한 컬럼 순서대로 추가적인 요약정보를 단계적으로 만들어준다
*/

-- Q1) 부서별 총합 뿐만 아니라 전체 총합 및 세부 내역을 보고싶을 때.
SELECT DEPTNO, ENAME, SUM(SAL)
FROM EMP
GROUP BY DEPTNO, ENAME WITH ROLLUP;

-- Q2) ROLLUP을 이용하여 직워별 사원의 이름과 월급을 출력하라.
SELECT JOB, ENAME, SUM(SAL)
FROM EMP
GROUP BY JOB, ENAME WITH ROLLUP;

SELECT JOB, ENAME, SUM(SAL)
FROM EMP
GROUP BY JOB, ENAME WITH ROLLUP
ORDER BY JOB DESC;

/*
CUBE = 소계, 총계 : GROUP BY 문과 함께 사용되며 GROUP BY 문에서 명시한 전체 컬럼에
	대하여 추가적인 요약 정보를 단계적으로 만들어 준다.(MY SQL에는 없음)
*/
/*
GROUPING : GROUPING 함수는 그룹 기준에서 고려하지 않은 부분 총계인 경우에 1을 리턴하고,
	그렇지 않은 경우 0을 리턴한다.
*/

SELECT ENAME, COMM, SUM(COMM) AS SUM, GROUPING(ENAME), GROUPING(COMM)
FROM EMP
group by ENAME, COMM WITH ROLLUP;

/*
- ROW_NUMBER()
	SELECT ROW_NUMBER() [OVER 	PARTITION BY,
								ORDER BY]
    
열 A 값의 내림차순으로 일련 번호 리턴 : SELECT ROW_NUMBER() OVER (ORDER BY A DESC);

컬럼 X 의 값으로 그룹핑 분할하고, 그 중에서 컬럼 A의 값의 내림차순으로 일련번호를 리턴
SELECT ROW_NUMBER() OVER (PARTITION BY, ORDER BY );

SELECT RANK() OVER (PARTITION BY, ORDER BY ); 		1,2,2,2,5,5,7,7,9

SELECT DENSE_RANK() OVER (PARTITION BY, ORDER BY );	1,2,2,3,3,3,4,4,5
*/

SELECT ROW_NUMBER() OVER (ORDER BY ENAME), ENAME
FROM EMP;

SELECT ROW_NUMBER() OVER (PARTITION BY JOB ORDER BY ENAME), ENAME
FROM EMP;

SELECT RANK() OVER (ORDER BY MONTH(HIREDATE)) AS RANK_NO,
	DENSE_RANK() OVER (ORDER BY MONTH(HIREDATE)) AS DENSE_NO,
	EMPNO, ENAME, HIREDATE
FROM EMP;

SELECT RANK() OVER (ORDER BY DATE(HIREDATE)) AS RANK_NO,
	DENSE_RANK() OVER (ORDER BY DATE(HIREDATE)) AS DENSE_NO,
	EMPNO, ENAME, HIREDATE
FROM EMP;

SELECT RANK() OVER (ORDER BY WEEKDAY(HIREDATE)) AS RANK_NO,
	DENSE_RANK() OVER (ORDER BY WEEKDAY(HIREDATE)) AS DENSE_NO,
	EMPNO, ENAME, HIREDATE, weekday(HIREDATE)
FROM EMP;
    
SELECT weekday('23-01-04'); # 0~6

/*
YEAR() : 1000~ 9999 4자리 표시
MONTH() : 0~11
DAY() : 1~31
DAYOFMONTH() = DAY()
HOUR()/ MINUTE()/ SECOND()
DATE_ADD( INTERVAL ), DATE_SUM
*/

DESC EMP;
-- Q1) 변수를 통해서 날짜함수를 활용해보자.
SET @date = now() ;

select @date, year(@date), month(@date), day(@date) ;
select HOUR(@date), MINUTE(@date), SECOND(@date) ;

-- Q2) 변수를 통해서 날짜함수 WEEKDAY를 활용해보자. 
-- 제어문 IF, while, loop, repeat문, case~when~then 문 (case ~end 문alter)

SET @date = now() ;
select @date,
	CASE weekday(@date)
        when 0 THEN'월'
        when 1 THEN'화'
        when 2 THEN'수'
        when 3 THEN'목'
        when 4 THEN'금'
        when 5 THEN'토'
        when 6 THEN'일'
	END AS 요일 ;
-- 함수 만들기, 프로시저만들기, 트리거 = 활용. 


/* 중복데이터에서 단일값 출력 distinct, between ~and 연사자 ***/
-- 사원의 봉급이 1000에서 2000사이의 사원의 이름과 봉급을 출력해보자
SELECT ENAME, SAL
FROM EMP
WHERE SAL BETWEEN 1000 AND 2000;

/* 
  데이터 형변환:
  [BINARY, CHAR, DATE, DATETIME, DECIMAL, JSON, NCHAR, SIGNED, TIME, UNSIGNED]
  CAST(expr as type)
*/
--
SELECT cast(now() as signed) ; -- 형식변환

/*
  select
  from 
  where
  group by
  having
  order by
  limit. ;
*/

SELECT *
FROM EMP
ORDER BY EMPNO DESC
LIMIT 5;

SELECT *
FROM EMP
ORDER BY EMPNO DESC
LIMIT 5 OFFSET 10;

SELECT *
FROM EMP
ORDER BY EMPNO DESC
LIMIT 1 OFFSET 14;



    
    
    
    
    
    
    
    
    
    
    
    
    