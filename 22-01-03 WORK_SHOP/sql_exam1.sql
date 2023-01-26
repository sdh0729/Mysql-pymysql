-- USE my_emp;
show tables;

-- QUESTION
-- 1. 사원테이블에서 모든 데이터를 출력하라	
select *
from emp;

-- 2. 사원테이블에서 사원번호, 사원이름, 월급을 출력하라
select empno, ename, sal
from emp;

-- 3. 사원테이블에서 월급을 뽑는데 중복된 데이터가 없게 출력하라
select distinct(sal)
from emp;

-- 4. 사원테이블에서 사원이름과 월급을 출력하는데 각각의 컬럼명을
-- '이 름','월 급'으로 바꿔서 출력하라. 단, ALIAS에 공백추가
select ename as "이름", sal as "월급"
from emp;

-- 5. 사원테이블에서 사원이름, 월급을 뽑고, 월급과 커미션을  더한 값을
-- 출력하는데 컬럼명을 '실급여'이라고 해서 출력하라.
-- 단, NULL값은 나타나지 않게 하라.
select ename, sal, (sal + comm) as "실급여"
from emp
where comm is not null;

-- 6. 사원테이블에서 'SCOTT'이라는 사원의 사원번호, 이름, 월급을 출력하라
select empno, ename, sal
from emp
where ename like "%TT";

-- 7. 사원테이블에서 직위가 'SALESMAN'인 사원의 사원번호, 이름, 직위를 출력하라
select empno, ename, job
from emp
where job = "SALESMAN";

-- 8. 사원테이블에서 사원번호가 7499, 7521, 7654인 사원의 사원번호, 이름 월급을 출력하라 IN, OR로 사용
select empno, ename, sal
from emp
where empno in (7499, 7521, 7654);

select empno, ename, sal
from emp
where empno = 7499 or empno = 7521 or empno = 7654;

-- 9. 사원테이블에서 월급이 1500에서 3000사이인 사원의 사원번호, 이름, 월급을 출력하라. AND 연산과 BETWEEN AND 연산 으로 사용
select empno, ename, sal
from emp
where sal between 1500 and 3000;

-- 10. 사원테이블에서 이름의 첫글자가 A이고 마지막 글자가 N이 아닌 사원의 이름을 출력하라
select ename
from emp
where ename like "A%" and ename not like "%N";