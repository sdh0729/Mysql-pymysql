use my_emp;
CALL compare(1,1, @result);
SELECT @result;

CALL compare(2,5, @result);
SELECT @result;

CALL compare(5,2, @result);
SELECT @result;

CALL my_hap (1,4,@HAP);
select @HAP;

CALL test(1,10);
CALL test(101,200);

CALL doiterate(5);
SELECT @x;

CALL MY_DELETE(7902);
SELECT * FROM MY_EMP;
