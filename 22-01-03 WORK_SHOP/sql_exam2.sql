-- QUESTION
-- 1. 사원 테이블에서 사원이름을 첫글자는 대문자로, 나머지는 소문자로 출력하라
 select concat(upper(left(ename, 1)), lower(mid(ename, 2))) as "사원이름"
 from emp;

-- 2. 사원테이블에서 사원이름을 뽑고 또 이름의 두번째 글자부터 네번째 글자까지 출력하라.
select ename, mid(ename,2,3)
from emp;

-- 3. 사원테이블의 사원 이름의 철자 개수를 출력하라.
select ename, length(ename)
from emp;

select ename, char_length(ename)
from emp;

-- 4. 사원테이블에서 사원 이름의 앞 글자 하나와 마지막 글자 하나만 출력하되 모두 소문자로 각각 출력하라.
select lower(concat(left(ename,1), right(ename,1)))
from emp;

-- 5. 3456.78의 소수점 첫번째 자리에서 반올림하라.
select round(3456.78, 0);

-- 6. 3의 4제곱을 구하고, 64의 제곱근을 구하라.
select pow(3,4);
select sqrt(64);

-- 7. 오늘날짜와 오늘날짜에서 10일을 더한 날짜를 출력하라.
select date_add(now(), interval 10 day);

-- 8. 현재 날짜보다 세달 후는 언제인지 를 출력하라.
select date_add(now(), interval 3 month),
		case weekday(date_add(now(), interval 3 month))
			when 0 then '월'
            when 1 then '화'
			when 2 then '수'
		    when 3 then '목'
		    when 4 then '금'
		    when 5 then '토'
		    when 6 then '일'
		end as 요일;

-- 9. 사원테이블에서 사원이름과 사원들의 오늘 날짜까지의 근무일수를 구하라.
select ename, datediff(now(), hiredate) as "근무일수"
from emp;

select ename, timestampdiff(day, hiredate, now()) as "근무일수"
from emp;

-- 10. 위 문제에서 근무일수를 00년 00개월 00일 근무하였는지 확인할 수 있도록 변환하라.(단, 한 달을 30일로 계산하라)
-- 예)
--  | ENAME	| 근무일수		|
--  | KING	| 00년 00개월 00일	|
select ename, concat( 
concat(cast(truncate(datediff(now(), hiredate) / (30*12), 0) as char(3)),"년"),
concat(cast(truncate((datediff(now(), hiredate) % (30*12)) / 30, 0) as char(3)), "개월"),
concat(cast(round(((datediff(now(), hiredate) % (30*12) / 30) - truncate((datediff(now(), hiredate) % (30*12)) / 30, 0))*30, 
0) as char(3)), "일")) as "근무일수"
from emp;

-- 11. 사원테이블에서 사원의 이름 30자 확보한다음  출력하고  오른쪽에 #을 채워라
select rpad(ename, 30, '#')
from emp;

-- 12. 사원테이블에서 이름의 공백을 없앤 후 출력하라
   select trim(ename)
   from emp;
   
-- 13. 사원테이블에서 입사년도와 일만 출력하자. 
select left(hiredate, 4) as "입사년도", right(hiredate, 2) as "일"
from emp;