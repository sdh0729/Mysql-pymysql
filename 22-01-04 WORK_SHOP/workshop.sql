use my_emp;
-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
SELECT ENAME, DEPTNO, DNAME
FROM MY_EMP JOIN MY_DEPT USING (DEPTNO);

-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을 출력하라.
SELECT ENAME, JOB, DEPTNO, DNAME
FROM MY_EMP JOIN MY_DEPT USING(DEPTNO)
WHERE LOC = 'DALLAS';

-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.
SELECT ENAME, DNAME 
FROM MY_EMP JOIN MY_DEPT USING(DEPTNO)
WHERE ENAME LIKE '%A%';

-- 4. 사원 이름과 그 사원이 속한 부서의 부서명, 그리고 월급을 출력하는데 월급이 3000이상인 사원을 출력하라.
SELECT ENAME, DNAME, SAL 
FROM MY_EMP JOIN MY_DEPT USING(DEPTNO)
WHERE SAL >=3000;

-- 5. 직위가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고 그 사원이 속한 부서 이름을 출력하라.
SELECT JOB, ENAME, DNAME 
FROM MY_EMP JOIN MY_DEPT USING(DEPTNO)
WHERE JOB = 'SALESMAN';

-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉 +커미션, 급여등급을 출력하되, 각각의 칼럼명을 
--    '사원번호','사원이름','연봉','실급여','급여등급'으로 하여 출력하라.
SELECT EMPNO AS '사원번호', ENAME AS '사원이름', 
12*SAL AS '연봉', 12*(SAL+COMM) AS '실급여', GRADE AS '급여등급'
FROM MY_EMP JOIN MY_DEPT USING (DEPTNO)
JOIN SALGRADE ON (SAL BETWEEN LOSAL AND HISAL)
WHERE COMM IS NOT NULL;

-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름, 월급, 급여 등급을 출력하라.
SELECT DEPTNO, DNAME, ENAME, SAL, GRADE
FROM MY_EMP 
JOIN MY_DEPT USING(DEPTNO)
JOIN SALGRADE ON (SAL BETWEEN LOSAL AND HISAL)
WHERE DEPTNO = 10;

-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름, 사원이름, 월급, 급여등급을 출력하라.
--    그리고 그 출력된 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로 정렬 하라.
SELECT DEPTNO, DNAME, ENAME, SAL, GRADE
FROM MY_EMP 
JOIN MY_DEPT USING(DEPTNO)
JOIN SALGRADE ON (SAL BETWEEN LOSAL AND HISAL)
WHERE DEPTNO = 10 OR DEPTNO = 20
ORDER BY DEPTNO, SAL DESC;

-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의 사원 번호와 사원이름을 출력하되
--    각각의 컬럼명을 '사원번호', '사원이름', '관리자 번호','관리자 이름'으로 출력하라.
SELECT EMPLOYEE.EMPNO AS '사원번호', EMPLOYEE.ENAME AS '사원이름',
MANAGER.EMPNO AS '관리자번호', MANAGER.ENAME AS '관리자이름'
FROM MY_EMP EMPLOYEE
LEFT OUTER JOIN MY_EMP MANAGER ON EMPLOYEE.MGR = MANAGER.EMPNO; 

-- 10. 자신의 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 해당 관리자의 이름 및 입사일과 함께 표시하고
--     열 이름을 각각 출력하라.
SELECT EMPLOYEE.ENAME AS 'EMPLOYEE', EMPLOYEE.HIREDATE AS 'EMPHIREDATE',
MANAGER.ENAME AS 'MANAGER', MANAGER.HIREDATE AS 'MGRHIREDATE'
FROM MY_EMP EMPLOYEE
LEFT OUTER JOIN MY_EMP MANAGER ON EMPLOYEE.MGR = MANAGER.EMPNO
WHERE EMPLOYEE.HIREDATE < MANAGER.HIREDATE;

-- 11. 해당 부서의 모든 사원에 대한 부서 이름, 위치, 사원 수 및 평균 급여를 표시하 정의를 작성한다.
--     열 이름을 각각 DNAME, LOC, NUMBER OF PEOPLE< SALARY로 한다.
SELECT DNAME, LOC, COUNT(ENAME) AS 'NUMBER OF PEOPLE', AVG(SAL) AS 'SALARY'
FROM MY_DEPT LEFT OUTER JOIN MY_EMP USING(DEPTNO)
GROUP BY DEPTNO
ORDER BY AVG(SAL) DESC;