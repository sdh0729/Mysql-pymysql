CREATE DEFINER=`root`@`localhost` PROCEDURE `my_hap`(x int,
                           y int,
						   out hap varchar(10))
BEGIN
set hap = x+y;
END