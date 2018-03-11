-- database distribute 2 m/s node
set auto_increment_increment=2;
--database gen_id instance in the first m/s node
CREATE TABLE `partition_1` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'genId app service ip',
 PRIMARY KEY (`id`),
 UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `partition_1` auto_increment=1;

-- replace into partition_1 (`ip`) values("127.0.0.1");
-- replace into partition_1 (`ip`) values("192.168.0.1");


--database gen_id instance in the second m/s node
CREATE TABLE `partition_2` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'genId app service ip',
 PRIMARY KEY (`id`),
 UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `partition_2` auto_increment=2;

-- replace into partition_1 (`ip`) values("127.0.0.1");
-- replace into partition_1 (`ip`) values("192.168.0.1");

CREATE TABLE `segment` (
  `tag` varchar(255) NOT NULL DEFAULT '',
  `max_id` bigint(20) NOT NULL DEFAULT 1000,
  `step` int(10) unsigned NOT NULL DEFAULT 1000,
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态：0.通过，1.审核中，2.拒绝',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0.有效，1.删除',
  `ext1` varchar(255) NOT NULL DEFAULT '""',
  `ext2` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='segment 管理，便于分库分表';
