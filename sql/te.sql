DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
    `admin_id` INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(16)      NOT NULL,
    `password` VARCHAR(64)      NOT NULL
);

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
    `evaluation_id` INT(10) UNSIGNED    NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `ip`            VARCHAR(15)         NOT NULL,
    `teacher_id`    INT(10) UNSIGNED    NOT NULL,
    `teacher_type`  TINYINT(1) UNSIGNED NOT NULL,
    `t1`            TINYINT(1) UNSIGNED NOT NULL,
    `t2`            TINYINT(1) UNSIGNED NOT NULL,
    `t3`            TINYINT(1) UNSIGNED NOT NULL,
    `t4`            TINYINT(1) UNSIGNED NOT NULL,
    `t5`            TINYINT(1) UNSIGNED NOT NULL,
    `t6`            TINYINT(1) UNSIGNED NOT NULL,
    `t7`            TINYINT(1) UNSIGNED NOT NULL,
    `t8`            TINYINT(1) UNSIGNED NOT NULL,
    `t9`            TINYINT(1) UNSIGNED NOT NULL,
    `t10`           TINYINT(1) UNSIGNED NOT NULL,
    `advice`        TEXT                                     DEFAULT NULL,
    `time`          DATETIME
);

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
    `teacher_id`   INT(10) UNSIGNED    NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `teacher_type` TINYINT(1) UNSIGNED NOT NULL             DEFAULT 1,
    `first`        VARCHAR(108)        NOT NULL,
    `second`       VARCHAR(108)        NOT NULL,
    `name`         VARCHAR(64)         NOT NULL
);
