-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 04, 2023 lúc 09:23 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `social_media`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUsers` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 50 DO
        SET @username = CONCAT('user', i);
        SET @password = CONCAT('password', i);
        SET @surname = CONCAT('Surname', i);
        SET @firstname = CONCAT('Firstname', i);
        SET @imgAvatar = CONCAT('avatar', i, '.jpg');
        SET @dateBirth = DATE_SUB(CURDATE(), INTERVAL i YEAR);
        SET @gender = IF(i % 2 = 0, 'Male', 'Female');
        SET @phoneNumber = CONCAT('1234567', i);
        SET @email = CONCAT('user', i, '@example.com');
        
        SET @sql = CONCAT("INSERT INTO profile (username, password, surname, firstname, imgAvatar, dateBirth, gender, phoneNumber, email) VALUES ('", @username, "','", @password, "','", @surname, "','", @firstname, "','", @imgAvatar, "','", @dateBirth, "','", @gender, "','", @phoneNumber, "','", @email, "')");
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        SET i = i + 1;
    END WHILE;
    DEALLOCATE PREPARE stmt;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `friendship`
--

CREATE TABLE `friendship` (
  `userrequest` varchar(50) NOT NULL,
  `useraccept` varchar(50) NOT NULL,
  `state` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `friendship`
--

INSERT INTO `friendship` (`userrequest`, `useraccept`, `state`) VALUES
('user1', 'honggam', 0),
('user11', 'honggam', 1),
('user12', 'honggam', 0),
('user13', 'honggam', 0),
('user14', 'honggam', 0),
('user15', 'honggam', 0),
('user16', 'honggam', 1),
('user17', 'honggam', 0),
('user18', 'honggam', 0),
('user19', 'honggam', 1),
('user2', 'honggam', 1),
('user20', 'honggam', 0),
('user21', 'honggam', 0),
('user22', 'honggam', 0),
('user23', 'honggam', 0),
('user24', 'honggam', 0),
('user25', 'honggam', 0),
('user26', 'honggam', 0),
('user27', 'honggam', 0),
('user28', 'honggam', 0),
('user29', 'honggam', 0),
('user3', 'honggam', 0),
('user30', 'honggam', 0),
('user31', 'honggam', 0),
('user32', 'honggam', 1),
('user33', 'honggam', 0),
('user34', 'honggam', 1),
('user35', 'honggam', 0),
('user36', 'honggam', 0),
('user37', 'honggam', 0),
('user38', 'honggam', 0),
('user39', 'honggam', 0),
('user4', 'honggam', 0),
('user5', 'honggam', 0),
('user50', 'honggam', 0),
('user51', 'honggam', 0),
('user52', 'honggam', 0),
('user53', 'honggam', 0),
('user54', 'honggam', 0),
('user55', 'honggam', 0),
('user56', 'honggam', 0),
('user57', 'honggam', 0),
('user58', 'honggam', 0),
('user59', 'honggam', 0),
('user6', 'honggam', 1),
('user60', 'honggam', 0),
('user61', 'honggam', 0),
('user62', 'honggam', 0),
('user63', 'honggam', 0),
('user64', 'honggam', 0),
('user65', 'honggam', 1),
('user66', 'honggam', 0),
('user67', 'honggam', 0),
('user68', 'honggam', 0),
('user69', 'honggam', 0),
('user7', 'honggam', 0),
('user70', 'honggam', 0),
('user71', 'honggam', 0),
('user72', 'honggam', 0),
('user73', 'honggam', 0),
('user74', 'honggam', 0),
('user75', 'honggam', 0),
('user76', 'honggam', 1),
('user77', 'honggam', 0),
('user78', 'honggam', 1),
('user79', 'honggam', 0),
('user8', 'honggam', 1),
('user80', 'honggam', 0),
('user81', 'honggam', 0),
('user82', 'honggam', 0),
('user83', 'honggam', 0),
('user84', 'honggam', 0),
('user85', 'honggam', 0),
('user86', 'honggam', 0),
('user87', 'honggam', 0),
('user88', 'honggam', 1),
('user89', 'honggam', 1),
('user90', 'honggam', 0),
('user91', 'honggam', 1),
('user93', 'honggam', 1),
('user94', 'honggam', 1),
('user95', 'honggam', 1),
('user96', 'honggam', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post`
--

CREATE TABLE `post` (
  `idPost` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `datecreated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `postcomment`
--

CREATE TABLE `postcomment` (
  `idComment` int(11) NOT NULL,
  `idPost` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `datecreated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `postimage`
--

CREATE TABLE `postimage` (
  `id` int(11) NOT NULL,
  `idPost` varchar(50) NOT NULL,
  `img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profile`
--

CREATE TABLE `profile` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `imgAvatar` varchar(100) NOT NULL,
  `dateBirth` date NOT NULL,
  `gender` int(1) NOT NULL DEFAULT 1,
  `phoneNumber` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `profile`
--

INSERT INTO `profile` (`username`, `password`, `surname`, `firstname`, `imgAvatar`, `dateBirth`, `gender`, `phoneNumber`, `email`) VALUES
('honggam', 'gamcute', 'hong gam', 'nguyen thi', 'gam', '2023-10-11', 1, '0369204207', 'honggam@gmail.com'),
('user1', 'password1', 'Surname1', 'Firstname1', 'avatar1.jpg', '2000-01-01', 0, '123456789', 'user1@example.com'),
('user10', 'password10', 'Surname10', 'Firstname10', 'avatar10.jpg', '2000-01-10', 0, '777777777', 'user10@example.com'),
('user11', 'password11', 'Surname11', 'Firstname11', 'avatar11.jpg', '2000-01-11', 0, '888888888', 'user11@example.com'),
('user12', 'password12', 'Surname12', 'Firstname12', 'avatar12.jpg', '2000-01-12', 0, '999999999', 'user12@example.com'),
('user13', 'password13', 'Surname13', 'Firstname13', 'avatar13.jpg', '2000-01-13', 0, '123456789', 'user13@example.com'),
('user14', 'password14', 'Surname14', 'Firstname14', 'avatar14.jpg', '2000-01-14', 0, '987654321', 'user14@example.com'),
('user15', 'password15', 'Surname15', 'Firstname15', 'avatar15.jpg', '2000-01-15', 0, '555555555', 'user15@example.com'),
('user16', 'password16', 'Surname16', 'Firstname16', 'avatar16.jpg', '2000-01-16', 0, '111111111', 'user16@example.com'),
('user17', 'password17', 'Surname17', 'Firstname17', 'avatar17.jpg', '2000-01-17', 0, '222222222', 'user17@example.com'),
('user18', 'password18', 'Surname18', 'Firstname18', 'avatar18.jpg', '2000-01-18', 0, '333333333', 'user18@example.com'),
('user19', 'password19', 'Surname19', 'Firstname19', 'avatar19.jpg', '2000-01-19', 0, '444444444', 'user19@example.com'),
('user2', 'password2', 'Surname2', 'Firstname2', 'avatar2.jpg', '2000-01-02', 0, '987654321', 'user2@example.com'),
('user20', 'password20', 'Surname20', 'Firstname20', 'avatar20.jpg', '2000-01-20', 0, '555555555', 'user20@example.com'),
('user21', 'password21', 'Surname21', 'Firstname21', 'avatar21.jpg', '2000-01-21', 0, '666666666', 'user21@example.com'),
('user22', 'password22', 'Surname22', 'Firstname22', 'avatar22.jpg', '2000-01-22', 0, '777777777', 'user22@example.com'),
('user23', 'password23', 'Surname23', 'Firstname23', 'avatar23.jpg', '2000-01-23', 0, '888888888', 'user23@example.com'),
('user24', 'password24', 'Surname24', 'Firstname24', 'avatar24.jpg', '2000-01-24', 0, '999999999', 'user24@example.com'),
('user25', 'password25', 'Surname25', 'Firstname25', 'avatar25.jpg', '2000-01-25', 0, '123456789', 'user25@example.com'),
('user26', 'password26', 'Surname26', 'Firstname26', 'avatar26.jpg', '2000-01-26', 0, '987654321', 'user26@example.com'),
('user27', 'password27', 'Surname27', 'Firstname27', 'avatar27.jpg', '2000-01-27', 0, '555555555', 'user27@example.com'),
('user28', 'password28', 'Surname28', 'Firstname28', 'avatar28.jpg', '2000-01-28', 0, '111111111', 'user28@example.com'),
('user29', 'password29', 'Surname29', 'Firstname29', 'avatar29.jpg', '2000-01-29', 0, '222222222', 'user29@example.com'),
('user3', 'password3', 'Surname3', 'Firstname3', 'avatar3.jpg', '2000-01-03', 0, '555555555', 'user3@example.com'),
('user30', 'password30', 'Surname30', 'Firstname30', 'avatar30.jpg', '2000-01-30', 0, '333333333', 'user30@example.com'),
('user31', 'password31', 'Surname31', 'Firstname31', 'avatar31.jpg', '2000-01-31', 0, '444444444', 'user31@example.com'),
('user32', 'password32', 'Surname32', 'Firstname32', 'avatar32.jpg', '2000-02-01', 0, '555555555', 'user32@example.com'),
('user33', 'password33', 'Surname33', 'Firstname33', 'avatar33.jpg', '2000-02-02', 0, '666666666', 'user33@example.com'),
('user34', 'password34', 'Surname34', 'Firstname34', 'avatar34.jpg', '2000-02-03', 0, '777777777', 'user34@example.com'),
('user35', 'password35', 'Surname35', 'Firstname35', 'avatar35.jpg', '2000-02-04', 0, '888888888', 'user35@example.com'),
('user36', 'password36', 'Surname36', 'Firstname36', 'avatar36.jpg', '2000-02-05', 0, '999999999', 'user36@example.com'),
('user37', 'password37', 'Surname37', 'Firstname37', 'avatar37.jpg', '2000-02-06', 0, '123456789', 'user37@example.com'),
('user38', 'password38', 'Surname38', 'Firstname38', 'avatar38.jpg', '2000-02-07', 0, '987654321', 'user38@example.com'),
('user39', 'password39', 'Surname39', 'Firstname39', 'avatar39.jpg', '2000-02-08', 0, '555555555', 'user39@example.com'),
('user4', 'password4', 'Surname4', 'Firstname4', 'avatar4.jpg', '2000-01-04', 0, '111111111', 'user4@example.com'),
('user40', 'password40', 'Surname40', 'Firstname40', 'avatar40.jpg', '2000-02-09', 0, '111111111', 'user40@example.com'),
('user41', 'password41', 'Surname41', 'Firstname41', 'avatar41.jpg', '2000-02-10', 0, '222222222', 'user41@example.com'),
('user42', 'password42', 'Surname42', 'Firstname42', 'avatar42.jpg', '2000-02-11', 0, '333333333', 'user42@example.com'),
('user43', 'password43', 'Surname43', 'Firstname43', 'avatar43.jpg', '2000-02-12', 0, '444444444', 'user43@example.com'),
('user44', 'password44', 'Surname44', 'Firstname44', 'avatar44.jpg', '2000-02-13', 0, '555555555', 'user44@example.com'),
('user45', 'password45', 'Surname45', 'Firstname45', 'avatar45.jpg', '2000-02-14', 0, '666666666', 'user45@example.com'),
('user46', 'password46', 'Surname46', 'Firstname46', 'avatar46.jpg', '2000-02-15', 0, '777777777', 'user46@example.com'),
('user47', 'password47', 'Surname47', 'Firstname47', 'avatar47.jpg', '2000-02-16', 0, '888888888', 'user47@example.com'),
('user48', 'password48', 'Surname48', 'Firstname48', 'avatar48.jpg', '2000-02-17', 0, '999999999', 'user48@example.com'),
('user49', 'password49', 'Surname49', 'Firstname49', 'avatar49.jpg', '2000-02-18', 0, '123456789', 'user49@example.com'),
('user5', 'password5', 'Surname5', 'Firstname5', 'avatar5.jpg', '2000-01-05', 0, '222222222', 'user5@example.com'),
('user50', 'password50', 'Surname50', 'Firstname50', 'avatar50.jpg', '2000-02-19', 0, '987654321', 'user50@example.com'),
('user51', 'password51', 'Surname51', 'Firstname51', 'avatar51.jpg', '2000-02-20', 0, '111111111', 'user51@example.com'),
('user52', 'password52', 'Surname52', 'Firstname52', 'avatar52.jpg', '2000-02-21', 0, '222222222', 'user52@example.com'),
('user53', 'password53', 'Surname53', 'Firstname53', 'avatar53.jpg', '2000-02-22', 0, '333333333', 'user53@example.com'),
('user54', 'password54', 'Surname54', 'Firstname54', 'avatar54.jpg', '2000-02-23', 0, '444444444', 'user54@example.com'),
('user55', 'password55', 'Surname55', 'Firstname55', 'avatar55.jpg', '2000-02-24', 0, '555555555', 'user55@example.com'),
('user56', 'password56', 'Surname56', 'Firstname56', 'avatar56.jpg', '2000-02-25', 0, '666666666', 'user56@example.com'),
('user57', 'password57', 'Surname57', 'Firstname57', 'avatar57.jpg', '2000-02-26', 0, '777777777', 'user57@example.com'),
('user58', 'password58', 'Surname58', 'Firstname58', 'avatar58.jpg', '2000-02-27', 0, '888888888', 'user58@example.com'),
('user59', 'password59', 'Surname59', 'Firstname59', 'avatar59.jpg', '2000-02-28', 0, '999999999', 'user59@example.com'),
('user6', 'password6', 'Surname6', 'Firstname6', 'avatar6.jpg', '2000-01-06', 0, '333333333', 'user6@example.com'),
('user60', 'password60', 'Surname60', 'Firstname60', 'avatar60.jpg', '2000-02-29', 0, '123456789', 'user60@example.com'),
('user61', 'password61', 'Surname61', 'Firstname61', 'avatar61.jpg', '2000-03-01', 0, '987654321', 'user61@example.com'),
('user62', 'password62', 'Surname62', 'Firstname62', 'avatar62.jpg', '2000-03-02', 0, '555555555', 'user62@example.com'),
('user63', 'password63', 'Surname63', 'Firstname63', 'avatar63.jpg', '2000-03-03', 0, '111111111', 'user63@example.com'),
('user64', 'password64', 'Surname64', 'Firstname64', 'avatar64.jpg', '2000-03-04', 0, '222222222', 'user64@example.com'),
('user65', 'password65', 'Surname65', 'Firstname65', 'avatar65.jpg', '2000-03-05', 0, '333333333', 'user65@example.com'),
('user66', 'password66', 'Surname66', 'Firstname66', 'avatar66.jpg', '2000-03-06', 0, '444444444', 'user66@example.com'),
('user67', 'password67', 'Surname67', 'Firstname67', 'avatar67.jpg', '2000-03-07', 0, '555555555', 'user67@example.com'),
('user68', 'password68', 'Surname68', 'Firstname68', 'avatar68.jpg', '2000-03-08', 0, '666666666', 'user68@example.com'),
('user69', 'password69', 'Surname69', 'Firstname69', 'avatar69.jpg', '2000-03-09', 0, '777777777', 'user69@example.com'),
('user7', 'password7', 'Surname7', 'Firstname7', 'avatar7.jpg', '2000-01-07', 0, '444444444', 'user7@example.com'),
('user70', 'password70', 'Surname70', 'Firstname70', 'avatar70.jpg', '2000-03-10', 0, '888888888', 'user70@example.com'),
('user71', 'password71', 'Surname71', 'Firstname71', 'avatar71.jpg', '2000-03-11', 0, '999999999', 'user71@example.com'),
('user72', 'password72', 'Surname72', 'Firstname72', 'avatar72.jpg', '2000-03-12', 0, '123456789', 'user72@example.com'),
('user73', 'password73', 'Surname73', 'Firstname73', 'avatar73.jpg', '2000-03-13', 0, '987654321', 'user73@example.com'),
('user74', 'password74', 'Surname74', 'Firstname74', 'avatar74.jpg', '2000-03-14', 0, '555555555', 'user74@example.com'),
('user75', 'password75', 'Surname75', 'Firstname75', 'avatar75.jpg', '2000-03-15', 0, '111111111', 'user75@example.com'),
('user76', 'password76', 'Surname76', 'Firstname76', 'avatar76.jpg', '2000-03-16', 0, '222222222', 'user76@example.com'),
('user77', 'password77', 'Surname77', 'Firstname77', 'avatar77.jpg', '2000-03-17', 0, '333333333', 'user77@example.com'),
('user78', 'password78', 'Surname78', 'Firstname78', 'avatar78.jpg', '2000-03-18', 0, '444444444', 'user78@example.com'),
('user79', 'password79', 'Surname79', 'Firstname79', 'avatar79.jpg', '2000-03-19', 0, '555555555', 'user79@example.com'),
('user8', 'password8', 'Surname8', 'Firstname8', 'avatar8.jpg', '2000-01-08', 0, '555555555', 'user8@example.com'),
('user80', 'password80', 'Surname80', 'Firstname80', 'avatar80.jpg', '2000-03-20', 0, '666666666', 'user80@example.com'),
('user81', 'password81', 'Surname81', 'Firstname81', 'avatar81.jpg', '2000-03-21', 0, '777777777', 'user81@example.com'),
('user82', 'password82', 'Surname82', 'Firstname82', 'avatar82.jpg', '2000-03-22', 0, '888888888', 'user82@example.com'),
('user83', 'password83', 'Surname83', 'Firstname83', 'avatar83.jpg', '2000-03-23', 0, '999999999', 'user83@example.com'),
('user84', 'password84', 'Surname84', 'Firstname84', 'avatar84.jpg', '2000-03-24', 0, '123456789', 'user84@example.com'),
('user85', 'password85', 'Surname85', 'Firstname85', 'avatar85.jpg', '2000-03-25', 0, '987654321', 'user85@example.com'),
('user86', 'password86', 'Surname86', 'Firstname86', 'avatar86.jpg', '2000-03-26', 0, '555555555', 'user86@example.com'),
('user87', 'password87', 'Surname87', 'Firstname87', 'avatar87.jpg', '2000-03-27', 0, '111111111', 'user87@example.com'),
('user88', 'password88', 'Surname88', 'Firstname88', 'avatar88.jpg', '2000-03-28', 0, '222222222', 'user88@example.com'),
('user89', 'password89', 'Surname89', 'Firstname89', 'avatar89.jpg', '2000-03-29', 0, '333333333', 'user89@example.com'),
('user9', 'password9', 'Surname9', 'Firstname9', 'avatar9.jpg', '2000-01-09', 0, '666666666', 'user9@example.com'),
('user90', 'password90', 'Surname90', 'Firstname90', 'avatar90.jpg', '2000-03-30', 0, '444444444', 'user90@example.com'),
('user91', 'password91', 'Surname91', 'Firstname91', 'avatar91.jpg', '2000-03-31', 0, '555555555', 'user91@example.com'),
('user92', 'password92', 'Surname92', 'Firstname92', 'avatar92.jpg', '2000-04-01', 0, '666666666', 'user92@example.com'),
('user93', 'password93', 'Surname93', 'Firstname93', 'avatar93.jpg', '2000-04-02', 0, '777777777', 'user93@example.com'),
('user94', 'password94', 'Surname94', 'Firstname94', 'avatar94.jpg', '2000-04-03', 0, '888888888', 'user94@example.com'),
('user95', 'password95', 'Surname95', 'Firstname95', 'avatar95.jpg', '2000-04-04', 0, '999999999', 'user95@example.com'),
('user96', 'password96', 'Surname96', 'Firstname96', 'avatar96.jpg', '2000-04-05', 0, '123456789', 'user96@example.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reaction`
--

CREATE TABLE `reaction` (
  `idReact` int(11) NOT NULL,
  `idPost` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `datecreated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `friendship`
--
ALTER TABLE `friendship`
  ADD PRIMARY KEY (`userrequest`,`useraccept`);

--
-- Chỉ mục cho bảng `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`idPost`);

--
-- Chỉ mục cho bảng `postcomment`
--
ALTER TABLE `postcomment`
  ADD PRIMARY KEY (`idComment`);

--
-- Chỉ mục cho bảng `postimage`
--
ALTER TABLE `postimage`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `reaction`
--
ALTER TABLE `reaction`
  ADD PRIMARY KEY (`idReact`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `postcomment`
--
ALTER TABLE `postcomment`
  MODIFY `idComment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `postimage`
--
ALTER TABLE `postimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `reaction`
--
ALTER TABLE `reaction`
  MODIFY `idReact` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
