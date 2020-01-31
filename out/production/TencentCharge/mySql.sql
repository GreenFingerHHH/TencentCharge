-- 管理员表
create  table   t_managers(
--     管理员id
    id varchar2(10) ,
--     管理员用户名
    user_account varchar2(20),
--     管理员密码
    user_pwd varchar2(20),
--     管理员手机号
    user_phone varchar2(20),
--     管理员创建时间
    create_time date
);
-- insert into t_managers(id, user_account, user_pwd, user_phone, create_time)

drop table t_managers;
insert into t_managers values ('GL0001','admin','admin','15162796190',current_date);

-- 前端用户
create table t_users(
--    用户Id
  user_id  varchar2(10),
--       用户名称
  user_name varchar2(20),
--   用户密码
  user_pwd varchar2(20),
--   用户生日
  user_birthday varchar2(50),
--   用户手机号
  user_phone varchar2(20),
--   用户话费余额
  user_tariffe number,
--   用户游币余额
  user_currency number,
--   用户状态(1：可用 2：禁用)
  user_status number,
--   用户创建时间
  user_createTime date,
--   用户性别
  user_sex varchar2(5),

  user_location number
);


insert into t_users values ('YH0001','user1','user1','199-11-11','15162796190',1000,1000,1,current_date,'男',1);
insert into t_users values ('YH0002','testUser1','testUser1','199-11-11','15162796190',1000,1000,1,current_date,'男',1);
-- alter table t_users modify user_birthday varchar2(50);

-- 游戏类型表
create table t_game_type(
--     游戏类型ID
  type_id varchar2(20),
--   游戏类型名
  type_name varchar2(100),
--   游戏类型状态（1：商用 2：下线）
  type_status number,
--   游戏类型图片
  type_picture varchar2(50),
--   游戏类型创建时间
  type_createTime date,
--   游戏类型修改时间
  type_updateTime date
);
drop table T_GAME_TYPE;
insert into T_GAME_TYPE values ('GT0001','棋牌类',1,'GT0001.jpg',sysdate,sysdate);
insert into T_GAME_TYPE values ('GT0002','MOBA类',1,'GT0002.jpg',sysdate,sysdate);
insert into T_GAME_TYPE values ('GT0003','动作类',1,'GT0003.jpg',sysdate,sysdate);
insert into T_GAME_TYPE values ('GT0004','策略类',1,'GT0004.jpg',sysdate,sysdate);
-- 游戏表
create table t_game(
--     游戏ID
  game_id varchar2(20),--主键
--   游戏名称
  game_name varchar2(20),--unique
--   游戏类型 此处需要指向“游戏类型表”
  game_type varchar2(20),--外键
--   游戏状态（1：商用 2：下线）
  game_status number,
--   游戏封面
  game_cover varchar2(20),
--   游戏内容解图
  game_screen varchar2(50),
--   游戏币价格
  game_currency number,
--   游戏话费价格
  game_tariffe number,
--   游戏开发商
  game_developers varchar2(20),
--   备案号
  game_filing varchar2(50),
--   游戏详情
  game_detail varchar2(140),
--   游戏介绍
  game_introduction varchar2(50),
--   游戏创建时间
  game_createTime date,
--   游戏修改时间
  game_updateTime date,

  game_file varchar2(20)
);
drop table T_GAME;
insert into T_GAME values ('YX0001','DOTA2','GT0002',1,'YX0001','YX0002',100,50,'捷豹传媒','20200103GH097587','一款穿心上市的游戏','goodgame',sysdate,sysdate);
insert into T_GAME values ('YX0002','LOL','GT0001',1,'YX0001','YX0002',100,50,'捷豹传媒','20200103GH097587','一款穿心上市的游戏','goodgame',sysdate,sysdate);
insert into T_GAME values ('YX0003','刺客','GT0003',1,'YX0001','YX0002',100,50,'捷豹传媒','20200103GH097587','一款穿心上市的游戏','goodgame',sysdate,sysdate);
insert into T_GAME values ('YX0004','你好你好123','GT0004',1,'YX0001','YX0002',100,50,'捷豹传媒','20200103GH097587','一款穿心上市的游戏','goodgame',sysdate,sysdate);
insert into T_GAME values ('YX0005','你好你好123','GT0008',1,'YX0001','YX0002',100,50,'捷豹传媒','20200103GH097587','一款穿心上市的游戏','goodgame',sysdate,sysdate);




drop table  t_province;
-- 省份表
create table t_province(
  prov_id number,--主键
  prov_name varchar2(30)
);

Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (1,'北京');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (2,'天津');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (3,'上海');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (4,'重庆');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (5,'河北');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (6,'山西');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (7,'台湾');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (8,'辽宁');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (9,'吉林');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (10,'黑龙江');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (11,'江苏');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (12,'浙江');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (13,'安徽');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (14,'福建');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (15,'江西');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (16,'山东');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (17,'河南');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (18,'湖北');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (19,'湖南');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (20,'广东');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (21,'甘肃');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (22,'四川');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (23,'贵州');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (24,'海南');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (25,'云南');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (26,'青海');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (27,'陕西');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (28,'广西壮族自治区');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (29,'西藏自治区');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (30,'宁夏回族自治区');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (31,'新疆维吾尔自治区');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (32,'内蒙古自治区');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (33,'澳门特别行政区');
Insert into HUANGLUTAO.T_PROVINCE (PROV_ID,PROV_NAME) values (34,'香港特别行政区');

-- 省份规则兑换表
create table t_exchange(
--     兑换规则ID
  exchange_id number,
--   兑换规则对应的城市
  exchange_provId number,
--   兑换规则的比例
  exchangeCharge number,
--   兑换规则的创建时间
  exchangeCreateTime date,
--   兑换规则的修改时间
  exchangeUpdateTime date,
--   兑换规则的状态（1：可用 2：禁用）
  exchangeStatus number
);

create sequence card_id_seq;
-- 密报卡表
create table t_card(
--     密报卡ID
  card_id number,--主键
--   密报卡卡号
  card_number varchar2(50),--unique
--   密报卡密码
  card_pwd varchar2(20),
--   密报卡金额
  card_amount number,
--   密报卡省份
  card_provId number,
--   密报卡生效时间
  card_startTime date,
--   密报卡过期时间
  card_endTime date,
--   密报卡状态(1：未生效 2：可用 3：已使用 4：已过期）)
  card_status number,
--   密报卡创建时间
  card_createTime date
);
insert into t_card values (card_id_seq.nextval,'TESTTESTTESTTEST','TESTETST', 100,1,sysdate,sysdate,2,sysdate);

create sequence prep_id_seq;
-- 用户充值密保卡记录表
create table t_prepaid(
--     充值记录ID
  prep_id number,
--   充值用户的ID
  prep_userId varchar2(20),
--   充值卡的密报卡ID
  prep_cardNumber varchar2(20),
--   密保卡密码
  prep_cardPwd varchar2(20),
--   密保卡额度
  prep_cardAmount varchar2(20),
--   密报卡充值时间
  prep_createTime date
);

-- 用户购买游戏记录表
create sequence t_expense_seq;
create table t_expense(
--     消费ID
  exp_id number,
--   消费用户ID
  exp_userId varchar2(20),
--   购买的游戏的ID
  exp_gameId varchar2(20),
--   购买游戏的消费金额
  exp_monetary number,
--   购买方式（1：话费购买 2：游币购买）
  exp_operations number,
--   第一次购买扣费并下载时间
  exp_createTime date,
--   再次下载游戏的时间
  exp_updateTime date,
--   该游戏的下载次数
  exp_downloads number
);