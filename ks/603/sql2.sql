# 设计个人好友管理系统，包含以下核心功能：
# 显示所有好友基本信息，包括：
# 姓名
# 性别
# 生日
# 手机
# 住址
# 微信
# QQ
# 工作或学习的地点
# 爱好
# 认识时间
# 认识方式
# 特点
# 亲密程度 （亲密-一般：1-10）
# 记录每一次与朋友沟通时的信息，包括：
# 沟通时间
# 沟通方式
# 沟通内容
# TA 当前的工作或学习的地点
# 当前的亲密程度
DROP DATABASE IF EXISTS db_sql2;
CREATE DATABASE db_sql2;
DROP TABLE IF EXISTS db_sql2.qq;
CREATE TABLE IF NOT EXISTS db_sql2.qq (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name      VARCHAR(255) COMMENT '姓名',
  gender    CHAR COMMENT '性别',
  dob       DATE COMMENT '生日',
  tel       VARCHAR(255) COMMENT '手机号',
  address   VARCHAR(255) COMMENT '家庭住址',
  message   VARCHAR(255) COMMENT '微信',
  qq        VARCHAR(255) COMMENT 'QQ号',
  conpany   VARCHAR(255) COMMENT '工作或学习的地方',
  hobby     VARCHAR(255) COMMENT '爱好',
  knowTime  DATE COMMENT '认识时间',
  knowStyle VARCHAR(255) COMMENT '认识方式',
  trait     VARCHAR(255) COMMENT '特点',
  nearLevel INT COMMENT '亲密程度'
)
  COMMENT '朋友信息表'
# 创建表和关联
# 添加样本数据
# 查询所有朋友及每次沟通记录
# 列出一个朋友的工作或学习的变迁
# 计算每个朋友的平均亲密程度，降序排序