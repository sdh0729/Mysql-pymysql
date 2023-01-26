-- Q1) 다음 쿼리를 통해 테이블을 생성해보자.
-- DROP TABLE My_REPORT;
CREATE TABLE My_REPORT(
name VARCHAR(10),
color VARCHAR(10),
sales int
);

-- Q2) 데이터를 다음과 같이 입력해본다.
insert into My_REPORT values
('shoes', 'Red', 5200),
('Wallet', 'White', 3800),
('shoes', 'Red', 5100),
('shoes', 'Black', 4600),
('Wallet', 'Black', 3900),
('Wallet', 'White', 4000),
('shoes', 'Red', 5200);

show tables;

select *
from my_report;

-- Q3) 다음과 같이 그룹핑 하자.
select name, sum(sales)
from my_report
group by name
having name in ('shoes', 'Wallet');

-- Q4) 다음과 같이 그룹핑 하자.
select name, color, sum(sales)
from my_report
group by name, color;

-- Q5) 다음과 같이 그룹핑 하자. WITH ROLLUP 사용
select name, sum(sales)
from my_report
group by name with rollup;

-- Q6) 다음과 같이 출력해보자.
select name, color, sum(sales)
from my_report
group by name, color;

-- Q7) 다음과 같이 출력해보자. WITH ROLLUP 사용
select name, color, sum(sales)
from my_report
group by name, color WITH ROLLUP;

-- Q8) sales 값이 150 이상의 데이터만을 대상으로 그룹화하고, 그룹별로 sales 평균을 리턴하되 200이상만 출력하자.
select name, avg(sales) as "average"
from my_report
where sales >= 150
group by name
having avg(sales) >= 200;