/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : localhost:3309
Source Database       : bookshop

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2018-12-29 10:05:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', '麦发强', '123');
INSERT INTO `admins` VALUES ('2', '郑义铭', '123');
INSERT INTO `admins` VALUES ('3', '关志祯', '123');

-- ----------------------------
-- Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `author` varchar(155) NOT NULL,
  `publisher` varchar(155) NOT NULL,
  `kind` varchar(155) DEFAULT NULL,
  `describes` mediumtext,
  `number` int(32) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('15', 'javaEE企业级应用开发', 'upload/e998c539052b46cfaf5825f4304ac11b.jpg', '黑马程序员', '清华大学出版社', '综合性图书', '<p>javaEE企业级开发教程，更好地开发web项目</p>', '96', '39.9');
INSERT INTO `books` VALUES ('16', '计算机组成原理', 'upload/fe070dc1dc39426bbc500714223bae9b.jpg', '白中英', '北京大学出版社', '综合性图书', '<p>计算机组成原理，一本有关计算机基础的书籍</p>', '98', '39.9');
INSERT INTO `books` VALUES ('17', 'Android程序开发', 'upload/7cc3bb7b0862471fac6beee705364bfc.jpg', '黑马程序员', '北京大学出版社', '综合性图书', '<p>安卓教程，制作刚好的手机App</p>', '93', '39.9');
INSERT INTO `books` VALUES ('18', 'PHP', 'upload/43fe04fa4f9042d2bffb8d9637aaf5b8.jpg', 'PHP先生', '北京大学出版社', '综合性图书', '<p>更简单、更快捷地开发网站</p>', '99', '39.9');
INSERT INTO `books` VALUES ('19', 'JSP开发教程', 'upload/e3e60097f8aa4a4198b2ce180ff24dfc.jpg', '黑马程序员', '清华大学出版社', '综合性图书', '<p>更全面、更高效地开发网站项目</p>', '99', '19.9');
INSERT INTO `books` VALUES ('20', '平凡的世界', 'upload/45c1d55e761e4187b50a055717656a75.jpg', '路遥', '清华大学出版社', '哲学', '<p>一本平凡衍生出伟大的书籍</p>', '97', '39.9');
INSERT INTO `books` VALUES ('21', '围城', 'upload/9ecdb070825e4144891e68757f90f2b0.jpg', '钱钟书', '清华大学出版社', '哲学', '<p>一代才子钱钟书的倾心之作</p>', '94', '39.9');
INSERT INTO `books` VALUES ('22', '三国演义', 'upload/91efe2ae95484ba6b15ea22c590bef5d.jpg', '罗贯中', '清华大学出版社', '哲学', '<p>中国四大名著之一</p>', '98', '59.9');
INSERT INTO `books` VALUES ('23', '忽然七日', 'upload/b146686845c145e88f17cf1def705920.jpg', '安意如', '北京大学出版社', '哲学', '<p>综合性诗词类鉴赏集<br/></p>', '99', '29.9');
INSERT INTO `books` VALUES ('24', '四六级手册', 'upload/899d061f427a44f7ba276aaca94318fd.jpg', 'James', '茂名出版社', '综合性图书', '<p>大学生必备书籍</p>', '199', '9.9');
INSERT INTO `books` VALUES ('25', '百年孤独', 'upload/948bb5eed537462499bc38de4b7de57a.jpg', 'Gabriel José de la Concordia García Márquez', '北京大学出版社', '哲学', '<p>拉丁美洲魔幻现实主义文学代表作<br/></p>', '99', '49.9');
INSERT INTO `books` VALUES ('26', '人生若只如初见', 'upload/a1e9d7f9a4f94dddb53cc570e9c75f8b.jpg', '安意如', '茂名出版社', '哲学', '<p>好诗词，更好看<br/></p>', '99', '69.9');
INSERT INTO `books` VALUES ('27', '钢铁是怎样炼成的', 'upload/6f447e612e544ad5bb5f4f5de3e9dcb2.jpg', '奥斯特雷夫斯基', '广东石油化工学院出版社', '社会科学类', '<p>更坚强，钢铁战士炼成记<br/></p>', '99', '99.9');
INSERT INTO `books` VALUES ('28', '云计算导论', 'upload/305e8ae9b1d0400dbbd58f90f427709e.jpg', '黑马程序员', '清华大学出版社', '综合性图书', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">内容介绍 本书主要内容包括</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的产生背景及发展现状、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">平台及关键技术、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">安全问题、虚拟化与</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">数据库的研究、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的实用化、云制造、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">服务与大规模定制模式应用、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的未来及面临的挑战。</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">内容介绍 本书主要内容包括</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的产生背景及发展现状、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">平台及关键技术、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">安全问题、虚拟化与</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">数据库的研究、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的实用化、云制造、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">服务与大规模定制模式应用、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的未来及面临的挑战。</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">内容介绍 本书主要内容包括</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的产生背景及发展现状、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">平台及关键技术、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">安全问题、虚拟化与</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">数据库的研究、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的实用化、云制造、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">服务与大规模定制模式应用、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的未来及面临的挑战。</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">内容介绍 本书主要内容包括</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的产生背景及发展现状、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">平台及关键技术、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">安全问题、虚拟化与</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">数据库的研究、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的实用化、云制造、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">服务与大规模定制模式应用、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的未来及面临的挑战。</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">内容介绍 本书主要内容包括</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的产生背景及发展现状、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">平台及关键技术、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">安全问题、虚拟化与</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">数据库的研究、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的实用化、云制造、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">服务与大规模定制模式应用、</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">云计算</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的未来及面临的挑战。</span></p>', '221', '29.8');

-- ----------------------------
-- Table structure for `items`
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `bookName` varchar(255) NOT NULL,
  `bookId` int(11) NOT NULL,
  `bookNum` int(11) NOT NULL,
  `bookPrice` double NOT NULL,
  `bookPhoto` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('11', '麦发强', 'javaEE企业级应用开发', '15', '2', '39.9', 'upload/e998c539052b46cfaf5825f4304ac11b.jpg');
INSERT INTO `items` VALUES ('15', '麦发强', 'javaEE企业级应用开发', '15', '1', '39.9', 'upload/e998c539052b46cfaf5825f4304ac11b.jpg');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(32) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `book_id` int(32) NOT NULL,
  `book_num` int(32) NOT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '18', 'javaEE企业级应用开发', '15', '1', '2018-12-28 21:14:35');
INSERT INTO `orders` VALUES ('2', '18', '计算机组成原理', '16', '1', '2018-12-28 21:15:39');
INSERT INTO `orders` VALUES ('3', '18', 'Android程序开发', '17', '1', '2018-12-28 21:17:02');
INSERT INTO `orders` VALUES ('4', '18', 'Android程序开发', '17', '1', '2018-12-28 21:17:14');
INSERT INTO `orders` VALUES ('5', '18', 'Android程序开发', '17', '2', '2018-12-28 21:17:33');
INSERT INTO `orders` VALUES ('6', '18', 'Android程序开发', '17', '1', '2018-12-28 21:20:30');
INSERT INTO `orders` VALUES ('7', '18', 'javaEE企业级应用开发', '15', '1', '2018-12-28 21:42:00');
INSERT INTO `orders` VALUES ('8', '18', 'Android程序开发', '17', '1', '2018-12-28 21:42:00');
INSERT INTO `orders` VALUES ('9', '18', '围城', '21', '5', '2018-12-28 21:44:44');
INSERT INTO `orders` VALUES ('10', '18', '围城', '21', '5', '2018-12-28 21:46:58');
INSERT INTO `orders` VALUES ('11', '18', '围城', '21', '5', '2018-12-28 21:47:38');
INSERT INTO `orders` VALUES ('12', '18', '围城', '21', '5', '2018-12-28 21:47:58');
INSERT INTO `orders` VALUES ('13', '18', '围城', '21', '5', '2018-12-28 21:48:31');
INSERT INTO `orders` VALUES ('14', '18', '围城', '21', '5', '2018-12-28 21:49:23');
INSERT INTO `orders` VALUES ('15', '18', '围城', '21', '5', '2018-12-28 21:49:27');
INSERT INTO `orders` VALUES ('16', '18', '围城', '21', '5', '2018-12-28 21:50:03');
INSERT INTO `orders` VALUES ('17', '18', '围城', '21', '5', '2018-12-28 21:50:30');
INSERT INTO `orders` VALUES ('18', '18', '围城', '21', '5', '2018-12-28 21:51:29');
INSERT INTO `orders` VALUES ('19', '18', '围城', '21', '5', '2018-12-28 21:51:34');
INSERT INTO `orders` VALUES ('20', '18', '围城', '21', '5', '2018-12-28 21:51:36');
INSERT INTO `orders` VALUES ('21', '18', '围城', '21', '5', '2018-12-28 21:51:39');
INSERT INTO `orders` VALUES ('22', '18', '围城', '21', '5', '2018-12-28 21:52:11');
INSERT INTO `orders` VALUES ('23', '18', '围城', '21', '5', '2018-12-28 21:52:41');
INSERT INTO `orders` VALUES ('24', '18', '围城', '21', '5', '2018-12-28 21:52:45');
INSERT INTO `orders` VALUES ('25', '18', '围城', '21', '5', '2018-12-28 21:53:08');
INSERT INTO `orders` VALUES ('26', '18', '围城', '21', '5', '2018-12-28 21:53:30');
INSERT INTO `orders` VALUES ('27', '18', '围城', '21', '5', '2018-12-28 21:54:36');
INSERT INTO `orders` VALUES ('28', '18', '围城', '21', '5', '2018-12-28 21:55:11');
INSERT INTO `orders` VALUES ('29', '18', '围城', '21', '5', '2018-12-28 21:55:41');
INSERT INTO `orders` VALUES ('30', '18', '围城', '21', '5', '2018-12-28 21:56:02');
INSERT INTO `orders` VALUES ('31', '18', '围城', '21', '5', '2018-12-28 21:56:20');
INSERT INTO `orders` VALUES ('32', '18', '围城', '21', '5', '2018-12-28 21:57:13');
INSERT INTO `orders` VALUES ('33', '18', '围城', '21', '5', '2018-12-28 22:06:38');
INSERT INTO `orders` VALUES ('34', '18', '围城', '21', '5', '2018-12-28 22:09:20');
INSERT INTO `orders` VALUES ('35', '18', '围城', '21', '5', '2018-12-28 22:09:38');
INSERT INTO `orders` VALUES ('36', '18', '围城', '21', '5', '2018-12-28 22:09:52');
INSERT INTO `orders` VALUES ('37', '18', '围城', '21', '5', '2018-12-28 22:09:59');
INSERT INTO `orders` VALUES ('38', '18', '围城', '21', '5', '2018-12-28 22:10:24');
INSERT INTO `orders` VALUES ('39', '18', '围城', '21', '5', '2018-12-28 22:10:49');
INSERT INTO `orders` VALUES ('40', '18', '围城', '21', '5', '2018-12-28 22:11:50');
INSERT INTO `orders` VALUES ('41', '18', '围城', '21', '5', '2018-12-28 22:12:17');
INSERT INTO `orders` VALUES ('42', '18', '围城', '21', '5', '2018-12-28 22:12:24');
INSERT INTO `orders` VALUES ('43', '18', '围城', '21', '5', '2018-12-28 22:12:29');
INSERT INTO `orders` VALUES ('44', '18', '围城', '21', '5', '2018-12-28 22:12:57');
INSERT INTO `orders` VALUES ('45', '18', '围城', '21', '5', '2018-12-28 22:13:16');
INSERT INTO `orders` VALUES ('46', '18', '围城', '21', '5', '2018-12-28 22:13:27');
INSERT INTO `orders` VALUES ('47', '18', '围城', '21', '5', '2018-12-28 22:14:04');
INSERT INTO `orders` VALUES ('48', '18', '围城', '21', '5', '2018-12-28 22:14:29');
INSERT INTO `orders` VALUES ('49', '18', '围城', '21', '5', '2018-12-28 22:14:45');
INSERT INTO `orders` VALUES ('50', '18', '围城', '21', '5', '2018-12-28 22:14:58');
INSERT INTO `orders` VALUES ('51', '18', '围城', '21', '5', '2018-12-28 22:15:17');
INSERT INTO `orders` VALUES ('52', '18', '围城', '21', '5', '2018-12-28 22:16:04');
INSERT INTO `orders` VALUES ('53', '18', '围城', '21', '5', '2018-12-28 22:16:23');
INSERT INTO `orders` VALUES ('54', '18', '围城', '21', '5', '2018-12-28 22:16:48');
INSERT INTO `orders` VALUES ('55', '18', '围城', '21', '5', '2018-12-28 22:16:59');
INSERT INTO `orders` VALUES ('56', '18', '围城', '21', '5', '2018-12-28 22:18:14');
INSERT INTO `orders` VALUES ('57', '18', '围城', '21', '5', '2018-12-28 22:18:58');
INSERT INTO `orders` VALUES ('58', '18', '围城', '21', '5', '2018-12-28 22:19:26');
INSERT INTO `orders` VALUES ('59', '18', '围城', '21', '5', '2018-12-28 22:19:32');
INSERT INTO `orders` VALUES ('60', '18', '围城', '21', '5', '2018-12-28 22:20:03');
INSERT INTO `orders` VALUES ('61', '18', '围城', '21', '5', '2018-12-28 22:20:52');
INSERT INTO `orders` VALUES ('62', '18', '围城', '21', '5', '2018-12-28 22:21:07');
INSERT INTO `orders` VALUES ('63', '18', '围城', '21', '5', '2018-12-28 22:21:22');
INSERT INTO `orders` VALUES ('64', '18', '围城', '21', '5', '2018-12-28 22:21:29');
INSERT INTO `orders` VALUES ('65', '18', '三国演义', '22', '1', '2018-12-28 23:15:16');
INSERT INTO `orders` VALUES ('68', '18', 'javaEE企业级应用开发', '15', '1', '2018-12-29 09:58:00');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(60) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('18', '麦发强', '123', '18320310918', '广东');
