use my_emp ;
-- Q1. 각 직위별로 총 월급을 출력하되 월급이 낮은 순으로 출력하라.
select job, sum(sal)
from emp
group by job
order by sum(sal);
-- Q2. 직위별 월급을 출력하되, 직위가 MANAGER인 사원들은 제외하라. 
    -- 그리고 그 총 월급이 5000보다 큰 직위와 총 월급(직위별 월급)만 출력하라
select job, sum(sal)
from emp
where job != 'MANAGER'
group by job
having sum(sal) > 5000;
--  Q3. 직위별 최대월급을 출력하되, 직위가 CLERK인 사원들은 제외하라. 
     -- 그리고 그 최대월급이 2000이상인 직위와 최대직급을 최대 월급이 높은 순으로 정렬하여 출력하라.
select job, max(sal)
from emp
where job != 'CLERK'
group by job
having max(sal) >= 2000
order by max(sal) desc;
-- Q4. 부서별 총 월급을 구하되 30번 부서를 제외하고 그 총월급이 8000 이상인 부서만 나오게 하고 
-- 총월급이 높은 순으로 출력하라.
select deptno, sum(sal)
from emp
where deptno !=30
group by deptno
having sum(sal) >= 8000
order by 2 desc;
-- Q5. 부서별 평균월급을 구하되 커미션이 책정된 사원만 가져오고, 
 -- 그 평균월급이 1000달러 이상인 부서만 나오게 하고 , 평균월급이 높은 순으로 출력하라.
 select deptno, avg(sal)
 from emp
 where comm is not null
 group by deptno
 having avg(sal) >= 1000
 order by avg(sal) desc;
 
 -- 서브쿼리
 -- Q1. 'Jones'의 월급 보다 많이 월급을 받는 사원의 이름과 월급을 출력하자.
 -- step 01. 'Jones'의 월급
    select sal
    from emp
    where ename = 'Jones'; -- 2975
-- step 02. 많이 월급을 받는 사원의 이름과 월급을 출력하자.
    SELECT ENAME, SAL
    FROM EMP
    WHERE SAL >2975;
-- 서브쿼리 : Single Row Subquery 서브쿼리의 결과가 1개인 ROW인 경우
-- > , < , = , >= , <= 등의 단일값 비교 연산자 
SELECT ENAME, SAL
    FROM EMP
    WHERE SAL > (select sal
                 from emp
                 where ename = 'Jones');

-- Multi Row Subquery : 서브 쿼리 결과가 여러 ROW인 경우
-- in, not in, >any, <any, >all, <all 등의 연산자 사용

-- Q1. 직업이 'SALESMAN' 인 사원들과 같은 월급을 받는 사원의 이름과 월급을 출력하자.
SELECT ENAME, SAL
FROM EMP
WHERE SAL IN (SELECT SAL
              FROM EMP
			  WHERE JOB = 'SALESMAN');

SELECT ENAME, SAL
FROM EMP
WHERE SAL IN (1600,1250,1250,1500);

-- Q2. 부서번호가 10번인 사원들과 같은 월급을 받는 사원의 이름과 월급을 출력하라
SELECT ENAME, SAL 
FROM EMP
WHERE SAL IN (SELECT SAL
			  FROM EMP
              WHERE DEPTNO = 10);
              
-- Q3. 직업이 CLERK 인 사원과 같은 부서에서 근무하는 사원의 이름과 월급과 부서번호를 출력하라

SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
			  FROM EMP
              WHERE JOB = 'CLERK') ;
              
-- Q4. 'CHICAGO'에서 근무하는 사원들과 같은 부서에서 근무하는 사원의 이름과 월급을 출력하라.

SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
				 FROM DEPT
                 WHERE LOC = 'CHICAGO');
                 
-- Q5. 부하직원이 있는사원의 사원번호와 이름을 출력하라.<자기 자신이 관리자.>

SELECT *
FROM EMP;

SELECT EMPNO, ENAME
FROM EMP
WHERE EMPNO IN (SELECT MGR
				FROM EMP); -- (DATA OR DATA OR ......NULL) = ANY
                

-- Q6. 부하직원이 없는 사원의 사원번호와 이름을 출력하라.<자기 자신이 관리자.>
SELECT EMPNO, ENAME
FROM EMP
WHERE EMPNO NOT IN (SELECT IFNULL(MGR,0)
				    FROM EMP); -- KING이 NULL 값을 리턴하게 된다.
                               -- (DATA AND DATA AND ......NULL) != ALL

-- Q7. 'KING'에게 보고하는 즉, 직속상관이(MGR) 이 'KING'인 사원의 이름과 월급을 출력하라

SELECT ENAME, SAL
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'KING');

SELECT * FROM EMP;

-- Q8.  20번 부서의 사원중 가장 많은 월급을 받는
  -- 사원들보다 더 많은 월급을 받는 사원들의 이름과 월급을 출력하라. (ALL로 바꿔보자)
SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
             FROM EMP
		     WHERE DEPTNO =20);
             
SELECT ENAME, SAL
FROM EMP
WHERE SAL > ALL(SELECT SAL
             FROM EMP
		     WHERE DEPTNO =20);
SELECT SAL
             FROM EMP
             WHERE DEPTNO = 20;
             
-- Q9. 20번 부서의 사원중 가장 적은 월급을 
-- 받는 사원들보다 더 많은 월급을 받는 사원들의 이름과 월급을 출력하라

SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT MIN(SAL)
             FROM EMP
             WHERE DEPTNO = 20);
 
SELECT ENAME, SAL
FROM EMP
WHERE SAL > ANY(SELECT SAL
             FROM EMP
             WHERE DEPTNO = 20);
 
 
 -- Q10. 직업이 'SALESMAN' 인 사원 중 가장 큰월급을 받는 사원보다
   --    더 많은 월급 받는 사원들의 이름과 월급을 출혁하라.
   -- 단, MIN(), MAX() 등 함수를 사용하지 않고, 연산자를 사용할 것
   
SELECT ENAME, SAL
FROM EMP 
WHERE SAL > ALL(SELECT SAL
                FROM EMP
				WHERE JOB = 'SALESMAN');
                
 -- Q11. 직업이 'SALESMAN' 인 사원 중 적은 월급을 받는 사원보다
   --    더 적은 월급 받는 사원들의 이름과 월급을 출혁하라.
   -- 단, MIN(), MAX() 등 함수를 사용하지 않고, 연산자를 사용할 것
SELECT ENAME, SAL
FROM EMP 
WHERE SAL < ALL(SELECT SAL
                FROM EMP
				WHERE JOB = 'SALESMAN');
                
/*--------------------------------------------------*/
-- MULTI COLUMN SUBQUERY
-- Q1. 직업이 'SALESMAN'인 사원과 같은 부서에서 근무하고 
  -- AND
-- 같은 월급을 받는 사원들의 이름, 월급, 부서 번호를 출력하라.

SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                FROM EMP
				WHERE JOB = 'SALESMAN')
AND SAL IN (SELECT SAL
            FROM EMP
            WHERE JOB = 'SALESMAN');
 
 -- Q2. 30번 브서 사원들과 같은 월급과 
  -- 같은 커미션을 받는 사원들의 이름 월급 커미션을 출력하라.
  
SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL IN(SELECT SAL
                FROM EMP
				WHERE DEPTNO = 30)
AND COMML IN (SELECT COMM
            FROM EMP
            WHERE DEPTNO = 30);
            
/*-----------------------------------------------*/
-- Q1. TEST 라는 테이블을 EMP 테이블로 만들어 보자. -> 테이블 제약규칙은 오지 않는다.
CREATE TABLE TEST
AS
SELECT * FROM EMP;

DESC EMP;
SELECT * FROM TEST;

-- Q2. TEST02 라는 테이블을 원하는 컬럼만 추려서 만들어 보자. 
CREATE TABLE TEST02
AS
SELECT ENAME, EMPNO, SAL
FROM EMP;
DESC TEST02;
SELECT *FROM TEST02;
-- Q3. TEST03라는 테이블을 EMP 테이블로 <원하는 컬럼과 원하는 타입>으로 만들어보자.
CREATE TABLE TEST03(ENAME VARCHAR(50))
AS
SELECT ENAME
FROM EMP;
DESC TEST03;
SELECT *FROM TEST03;
DROP TABLE TEST03;

-- Q4. TEST04 라는 테이블을 EMP 테이블로 만들어 보자.
-- CHICAGO에서 근무하는 사원들과 같은 부서에서 근무하는 사원의 이름과 월급으로 TEST04를 만들어보자.

CREATE TABLE TEST04
AS
SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC = 'CHICAGO');

DESC TEST04;
SELECT *FROM TEST04;

DROP TABLE TEST, TEST02, TEST03, TEST04; -- 지우기


 
 
 
 
