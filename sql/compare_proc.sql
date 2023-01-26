CREATE DEFINER=`root`@`localhost` PROCEDURE `compare`(x INT, 
                            y INT,
							out result varchar(20))
BEGIN
IF x=y Then
	   set result = 'x==y';
       elseif x > y then
       set result = 'x>y';
       else
       set result = 'x<y';
        End if;
END