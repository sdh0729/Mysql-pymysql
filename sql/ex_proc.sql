CREATE DEFINER=`root`@`localhost` PROCEDURE `test`(x int,
                         y int)
BEGIN
   DECLARE result VARCHAR(500) DEFAULT''; -- 변수 선언 
   
   WHILE x <= y DO
      SET result = CONCAT(result,x,',');
      SET x = x + 1;
   End WHILE;
   
   IF CHAR_LENGTH(result) > 1 then
      set result = LEFT(result, CHAR_LENGTH(result)-1);
   END IF;
   
   select result;

END