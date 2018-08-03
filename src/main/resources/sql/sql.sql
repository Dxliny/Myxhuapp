###创建dynamic表
CREATE table
  tb_dynamic(
    dynamic_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL ,
    introduce VARCHAR(300) NOT NULL ,
    picture VARCHAR(200),
    user_id_f int NOT NULL,
    dynamic_type bool NOT NULL,
    address VARCHAR (100) ,
    prize int DEFAULT 0,
    look_persons int DEFAULT 0,
    interest_id_f int DEFAULT 0 not NULL
  )
###创建视频表
CREATE TABLE
  tb_video(
    video_id int not null PRIMARY KEY auto_increment,
    title VARCHAR (255) not null  ,
    videopath VARCHAR (255) NOT NULL ,
    user_id_f int not null,
    video_type int,
    introduce VARCHAR (255),
    address VARCHAR (100),
    prize int DEFAULT 0,
    look_persons int DEFAULT 0,
    video_picture VARCHAR (255) not NULL,
--     修改2018.5.19
    interest_id_f int DEFAULT 0 not NULL
  )
###创建评论表
  create table
  tb_commont(
      commont_id int not null primary key auto_increment,
      user_id_f int not null,
      commont_body varchar(255),
      father_commont_id int default -1,
      son_commont_id varchar(255)
  )
###兴趣表
  --视频个性化分类：农村风景* 农场风景 农家乐风景* 其他风景 农产品 农副产品 制作美食 美食鉴赏 美食娱乐* 农场介绍
CREATE TABLE
  tb_interest (
      interest_id int not null PRIMARY KEY auto_increment,

      countryside_view bool DEFAULT 0,
      agriculture_view bool DEFAULT 0,
      agritainment_view bool DEFAULT 0,
      other_view bool DEFAULT 0,

      agriculture_products bool DEFAULT 0,
      agriculture_bp bool DEFAULT 0,

      create_delifood bool DEFAULT 0,
      delifood_commont bool DEFAULT 0,
      delifood_entertainment bool DEFAULT 0,

      farm_introduce bool DEFAULT 0
  )

###兴趣点击表

  CREATE TABLE
    tb_interest_Click_times(
      interest_click_id int not null PRIMARY KEY auto_increment,
      user_id_f int not NULL,

      countryside_view_times int DEFAULT 0,
      agriculture_view_times int DEFAULT 0,
      agritainment_view_times int DEFAULT 0,
      other_view_times int DEFAULT 0,

      agriculture_products_times int DEFAULT 0,
      agriculture_bp_times int DEFAULT 0,

      create_delifood_times int DEFAULT 0,
      delifood_commont_times int DEFAULT 0,
      delifood_entertainment_times int DEFAULT 0,

      farm_introduce_times int DEFAULT 0
    )

-- 1、通过用户ID获得100条数据（只提供ID、数据类型、投票率）

-- 3、通过用户ID获得用户对每种数据类型的投票率
1.  SELECT
    interest_id_f
  FROM
    tb_dynamic
  WHERE
    dynamic_id = #{dynamic_id}

2. select * FROM tb_interest where interest_id = #{interest_id};

3.  ReturnTypeOfInterest 判断类型
  UPDATE
    tb_interest_Click_times
  set 类型 = ++i



