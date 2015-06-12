用存储过程生成流水号是很常用的，这里以生成订单编号的流水号作为示例。（新的一天的流水号从1开始，如：今天的订单编号是CD2013010900014，下一个订单编号将是CD2013010900015；明天的订单编号将从CD2013011000001开始）

生成规则：2位前缀+年月日+5位流水号 或者 2位前缀+年月日时分+5位流水号 或者 2位前缀+年月日时分秒+5位流水号。

测试订单表(test_orders):

 

    CREATE TABLE `test_orders` (    
      `id` int(11) NOT NULL AUTO_INCREMENT,    
      `orderNo` varchar(25) NOT NULL DEFAULT '',    
      `orderName` char(10) NOT NULL DEFAULT '',    
      PRIMARY KEY (`id`)    
    ) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8  

 

 

 

生成订单编号的存储过程(generate_orderNo):

 

    CREATE DEFINER=PROCEDURE `generate_orderNo`(in orderNamePre char(2), in num int, out newOrderNo varchar(25))    
    BEGIN    
      DECLARE currentDate varCHAR (15) ;-- 当前日期,有可能包含时分秒     
      DECLARE maxNo INT DEFAULT 0 ; -- 离现在最近的满足条件的订单编号的流水号最后5位，如：SH2013011000002的maxNo=2     
    --  DECLARE l_orderNo varCHAR (25) ;-- 新生成的订单编号     
    --  DECLARE oldDate DATE ;-- 离现在最近的满足条件的订单编号的日期     
      DECLARE oldOrderNo VARCHAR (25) DEFAULT '' ;-- 离现在最近的满足条件的订单编号     
          
      if num = 8 then -- 根据年月日生成订单编号     
        SELECT DATE_FORMAT(NOW(), '%Y%m%d') INTO currentDate ;-- 订单编号形式:前缀+年月日+流水号，如：SH2013011000002     
      elseif num = 14 then -- 根据年月日时分秒生成订单编号     
        SELECT DATE_FORMAT(NOW(), '%Y%m%d%H%i%s') INTO currentDate ; -- 订单编号形式：前缀+年月日时分秒+流水号，如：SH2013011010050700001,个人不推荐使用这种方法生成流水号     
      else -- 根据年月日时分生成订单编号     
        SELECT DATE_FORMAT(NOW(), '%Y%m%d%H%i') INTO currentDate ;-- 订单形式：前缀+年月日时分+流水号,如：SH20130110100900005     
      end if ;    
          
      SELECT IFNULL(orderNo, '') INTO oldOrderNo     
      FROM test_orders     
      WHERE SUBSTRING(orderNo, 3, num) = currentDate     
        AND SUBSTRING(orderNo, 1, 2) = orderNamePre     
        and length(orderNo) = 7 + num    
      ORDER BY id DESC LIMIT 1 ; -- 有多条时只显示离现在最近的一条     
          
      IF oldOrderNo != '' THEN     
        SET maxNo = CONVERT(SUBSTRING(oldOrderNo, -5), DECIMAL) ;-- SUBSTRING(oldOrderNo, -5)：订单编号如果不为‘‘截取订单的最后5位     
      END IF ;    
      SELECT     
        CONCAT(orderNamePre, currentDate,  LPAD((maxNo + 1), 5, '0')) INTO newOrderNo ; -- LPAD((maxNo + 1), 5, '0')：如果不足5位，将用0填充左边     
          
      INSERT INTO test_orders (orderNo, orderName) VALUES (newOrderNo, 'testNo') ; -- 向订单表中插入数据     
    --    set newOrderNo = l_orderNo;     
      SELECT     
        newOrderNo ;    
    END  

 

 

 

参数说明：orderNamePre：(输入)订单编号的前缀,这里设定为两个字符
                  num：(输入)将按什么规则生成流水号(生成规则有：年月日、年月日时分秒、年月日时分三种),可选的num有：8、12、14
                  newOrderNo：(输出)新生成的订单编号

生成中的一些说明在存储过程中已经写得很明确了，这里不再重复。

调用存储过程向表中插入数据:

 

    SET @orderNo = '';    
    CALL `generate_orderNo`('SH', 12, @orderNo);    
    SELECT @orderNo;  
