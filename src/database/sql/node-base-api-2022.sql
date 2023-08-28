-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 08, 2022 at 04:16 PM
-- Server version: 5.7.37
-- PHP Version: 7.0.33-57+ubuntu20.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `node-base-api-2022`
--

-- --------------------------------------------------------

--
-- Table structure for table `Carts`
--

CREATE TABLE `Carts` (
  `iCartId` int(128) NOT NULL,
  `iProductId` int(128) NOT NULL,
  `iUserId` int(128) NOT NULL,
  `iQuantity` int(128) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Carts`
--

INSERT INTO `Carts` (`iCartId`, `iProductId`, `iUserId`, `iQuantity`, `createdAt`, `updatedAt`) VALUES
(10, 1, 21, 1, '2022-09-09 09:39:58', '2022-09-09 09:39:58'),
(11, 4, 21, 1, '2022-09-09 09:40:11', '2022-09-09 09:40:11'),
(12, 11, 21, 5, '2022-09-12 11:53:29', '2022-09-12 11:53:29'),
(13, 3, 21, 4, '2022-09-27 14:16:52', '2022-09-27 14:16:52'),
(14, 3, 21, 1, '2022-09-30 05:36:35', '2022-09-30 05:36:35'),
(15, 3, 21, 1, '2022-09-30 05:51:11', '2022-09-30 05:51:11'),
(16, 1, 18, 3, '2022-11-03 05:50:44', '2022-11-03 05:50:44'),
(17, 120, 18, 4, '2022-11-03 05:52:37', '2022-11-03 05:52:37'),
(18, 11, 18, 1, '2022-11-03 05:53:03', '2022-11-03 05:53:03'),
(19, 2, 18, 4, '2022-11-03 08:14:09', '2022-11-03 08:14:09'),
(20, 1, 20, 2, '2022-11-22 07:26:08', '2022-11-22 07:26:08'),
(21, 113, 20, 3, '2022-11-22 09:25:48', '2022-11-22 09:25:48'),
(22, 130, 20, 3, '2022-11-22 10:30:34', '2022-11-22 10:30:34'),
(23, 2, 20, 5, '2022-11-22 11:30:14', '2022-11-22 11:30:14'),
(24, 8, 20, 3, '2022-11-30 07:40:48', '2022-11-30 07:40:48');

-- --------------------------------------------------------

--
-- Table structure for table `ChannelMembers`
--

CREATE TABLE `ChannelMembers` (
  `iChannelMemberId` int(11) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `iChannelId` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  `eStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ChannelMembers`
--

INSERT INTO `ChannelMembers` (`iChannelMemberId`, `iUserId`, `iChannelId`, `createdAt`, `updatedAt`, `deletedAt`, `eStatus`) VALUES
(1, 1, 1, '2022-12-05 10:44:01', '2022-12-05 10:44:01', NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `Channels`
--

CREATE TABLE `Channels` (
  `iChannelId` int(11) NOT NULL,
  `vName` varchar(255) NOT NULL,
  `vDisplayPic` varchar(255) NOT NULL,
  `vDescription` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  `eStatus` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Channels`
--

INSERT INTO `Channels` (`iChannelId`, `vName`, `vDisplayPic`, `vDescription`, `createdAt`, `updatedAt`, `deletedAt`, `eStatus`) VALUES
(1, 'ankit', '', '', '2022-12-02 11:29:14', '2022-12-02 11:29:14', NULL, 'Active'),
(2, 'Pravin', '', '', '2022-12-05 10:22:54', '2022-12-05 10:22:54', NULL, 'Active'),
(3, 'mayur', '', '', '2022-12-05 11:07:13', '2022-12-05 11:07:13', NULL, 'Active'),
(4, 'mayur', '', '', '2022-12-07 09:30:06', '2022-12-07 09:30:06', NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `Comments`
--

CREATE TABLE `Comments` (
  `iCommentId` int(64) NOT NULL,
  `iPostId` int(64) NOT NULL,
  `vCommentedBy` varchar(128) NOT NULL,
  `tComment` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Comments`
--

INSERT INTO `Comments` (`iCommentId`, `iPostId`, `vCommentedBy`, `tComment`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(3, 42, 'aditya', 'very nice platform to learn things', '2022-08-04 13:11:49', '2022-08-04 13:11:49', NULL),
(4, 41, 'aditya', 'very nice place ', '2022-08-04 13:37:05', '2022-08-04 13:37:05', NULL),
(6, 41, 'aditya', 'very nice place ', '2022-08-05 06:41:53', '2022-08-05 06:41:53', NULL),
(7, 41, 'aditya', 'very nice place ', '2022-08-05 06:47:30', '2022-08-05 06:47:30', NULL),
(8, 411, 'aditya', 'very nice place ', '2022-08-05 06:48:09', '2022-08-05 06:48:09', NULL),
(9, 41, 'aditya', 'very nice place ', '2022-08-05 06:51:24', '2022-08-05 06:51:24', NULL),
(10, 41, 'aditya', 'very nice place ', '2022-08-05 06:58:21', '2022-08-05 06:58:21', NULL),
(11, 41, 'aditya', 'very nice place ', '2022-08-05 07:00:06', '2022-08-05 07:00:06', NULL),
(12, 41, 'aditya', 'very nice place ', '2022-08-05 07:00:46', '2022-08-05 07:00:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Contactus`
--

CREATE TABLE `Contactus` (
  `iContactUsId` int(11) NOT NULL,
  `vName` varchar(255) NOT NULL,
  `vEmail` varchar(255) NOT NULL,
  `vNumber` varchar(15) DEFAULT NULL,
  `vDescripion` varchar(255) NOT NULL,
  `tReply` text,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  `eStatus` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Conversations`
--

CREATE TABLE `Conversations` (
  `iConversationId` int(11) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `iChannelId` int(11) NOT NULL,
  `eType` enum('Text','File') NOT NULL DEFAULT 'Text',
  `vMessage` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  `eStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Conversations`
--

INSERT INTO `Conversations` (`iConversationId`, `iUserId`, `iChannelId`, `eType`, `vMessage`, `createdAt`, `updatedAt`, `deletedAt`, `eStatus`) VALUES
(1, 1, 1, 'Text', 'testing', '2022-12-06 09:03:08', '2022-12-06 07:43:09', NULL, 'Active'),
(2, 2, 1, 'Text', 'hii bro', '2022-12-06 09:30:36', '2022-12-06 09:30:36', NULL, 'Active'),
(3, 2, 1, 'Text', 'hii bro', '2022-12-06 09:50:28', '2022-12-06 09:50:28', NULL, 'Active'),
(4, 2, 1, 'Text', 'hii brother', '2022-12-06 10:04:40', '2022-12-06 10:04:40', NULL, 'Active'),
(5, 2, 1, 'Text', 'hii brother', '2022-12-06 10:15:06', '2022-12-06 10:15:06', NULL, 'Active'),
(6, 2, 1, 'Text', 'hii brother', '2022-12-06 12:22:18', '2022-12-06 12:22:18', NULL, 'Active'),
(7, 2, 1, 'Text', 'hii brother', '2022-12-07 06:36:41', '2022-12-07 06:36:41', NULL, 'Active'),
(8, 2, 1, 'Text', 'hii brother', '2022-12-07 06:38:11', '2022-12-07 06:38:11', NULL, 'Active'),
(9, 2, 1, 'Text', 'hii brother', '2022-12-07 06:38:51', '2022-12-07 06:38:51', NULL, 'Active'),
(10, 2, 1, 'Text', 'hii brother', '2022-12-07 06:38:55', '2022-12-07 06:38:55', NULL, 'Active'),
(11, 2, 1, 'Text', 'hii brother , how are you', '2022-12-07 13:37:39', '2022-12-07 13:37:39', NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `Faqs`
--

CREATE TABLE `Faqs` (
  `iFaqId` int(64) NOT NULL,
  `vFaqTitle` varchar(128) NOT NULL,
  `tDescription` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  `eStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Faqs`
--

INSERT INTO `Faqs` (`iFaqId`, `vFaqTitle`, `tDescription`, `createdAt`, `updatedAt`, `deletedAt`, `eStatus`) VALUES
(2, 'How it is working?', 'sql', '2022-08-04 08:49:46', '2022-08-04 08:49:46', NULL, 'Active'),
(3, 'How it is working?', 'sql', '2022-09-06 09:45:29', '2022-09-06 09:45:29', NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `ForgetPasswords`
--

CREATE TABLE `ForgetPasswords` (
  `iForgetPasswordId` int(11) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `vToken` varchar(255) NOT NULL,
  `vOTP` varchar(10) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ForgetPasswords`
--

INSERT INTO `ForgetPasswords` (`iForgetPasswordId`, `iUserId`, `vToken`, `vOTP`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(11, 7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpVXNlcklkIjpudWxsLCJpYXQiOjE2NTcwMzEwNzcsImV4cCI6MTY1NzAzMTEwN30.ulbjv-k1kOCzEtPSXe4dlxZIxb08lqD7x67CtCDVfFw', '364419', '2022-07-05 08:54:37', '2022-07-05 08:54:37', NULL),
(12, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpVXNlcklkIjpudWxsLCJpYXQiOjE2NTk0NDE1MzksImV4cCI6MTY1OTQ0MTU1N30.itWy4Dbfi9wK2panJQeC4INXT79dxP-zltKGDELys0o', '984382', '2022-08-02 11:58:59', '2022-08-02 11:58:59', NULL),
(15, 21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpVXNlcklkIjoyMSwiaWF0IjoxNjYxNzU1NTU2LCJleHAiOjE2NjE3NTkxNTZ9.tPYOTcB1B_E2FRmLfAosTJrSHkiW0YkSTXhAY3yKKiI', '822308', '2022-08-29 06:27:07', '2022-08-29 06:45:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Posts`
--

CREATE TABLE `Posts` (
  `iPostId` int(11) NOT NULL,
  `vTitle` varchar(255) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `vType` varchar(255) NOT NULL,
  `vUrl` varchar(255) NOT NULL,
  `bAllowComment` tinyint(1) NOT NULL DEFAULT '1',
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  `eStatus` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Posts`
--

INSERT INTO `Posts` (`iPostId`, `vTitle`, `iUserId`, `vType`, `vUrl`, `bAllowComment`, `createdAt`, `updatedAt`, `deletedAt`, `eStatus`) VALUES
(1, 'Goa fun', 7, 'image', 'https://source.unsplash.com/random/200x200', 1, '2022-07-01 05:25:36', '2022-07-01 05:25:36', NULL, 'Active'),
(2, 'Ahmedabad', 7, 'Image', 'image3.jpg', 0, '2022-07-05 07:02:50', '2022-07-05 07:01:51', NULL, 'Active'),
(41, 'create new', 7, 'image', 'image4', 1, '2022-07-07 05:29:48', '2022-07-07 05:29:48', NULL, 'Active'),
(42, 'my learning', 12, 'image', 'https://images.unsplash.com/photo-1534270804882-6b5048b1c1fc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV3fGVufDB8fDB8fA%3D%3D&w=1000&q=80', 1, '2022-08-04 10:30:04', '2022-08-04 10:30:04', NULL, 'Active'),
(44, 'india', 13, 'image', 'https://media.istockphoto.com/photos/indias-flag-close-up-picture-id512185437?b=1&k=20&m=512185437&s=170667a&w=0&h=zKh8CwaLoHZOek0sqI1iMWy66S1KTDNiW_loMqPo1eQ=', 1, '2022-08-05 05:58:16', '2022-08-05 05:58:16', NULL, 'Active'),
(46, 'Good morning', 15, 'image', 'https://images.pexels.com/photos/734428/pexels-photo-734428.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 1, '2022-08-08 08:18:45', '2022-08-08 08:18:45', NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `ProductCatagories`
--

CREATE TABLE `ProductCatagories` (
  `iProductCatagoryId` int(64) NOT NULL,
  `vProductCatagoryName` varchar(128) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ProductCatagories`
--

INSERT INTO `ProductCatagories` (`iProductCatagoryId`, `vProductCatagoryName`, `createdAt`, `updatedAt`) VALUES
(1, 'men\'s clothing ', '2022-09-01 05:40:33', NULL),
(2, 'jewelery', '2022-08-16 06:42:12', NULL),
(3, 'electronics', '2022-08-16 06:42:12', NULL),
(4, 'women\'s clothing', '2022-08-16 06:42:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ProductImages`
--

CREATE TABLE `ProductImages` (
  `iProductImageId` int(64) NOT NULL,
  `iProductId` int(11) NOT NULL,
  `vProductImage` varchar(556) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ProductImages`
--

INSERT INTO `ProductImages` (`iProductImageId`, `iProductId`, `vProductImage`, `createdAt`, `updatedAt`) VALUES
(3, 1, 'https://5.imimg.com/data5/LL/RJ/EP/ANDROID-3457246/product-jpeg-500x500.jpg', '2022-09-05 05:31:55', NULL),
(16, 113, 'https://www.bhaktiphotos.com/wp-content/uploads/2018/04/Hindu-Shiva-God-Wallpaper-Free-Download.jpg', '2022-08-30 09:46:02', NULL),
(18, 120, 'https://img.freepik.com/free-photo/cool-geometric-triangular-figure-neon-laser-light-great-backgrounds-wallpapers_181624-9331.jpg?w=2000', '2022-08-22 05:35:53', NULL),
(31, 130, 'https://images.rawpixel.com/image_200/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdjUzNWJhdGNoMi1teW50LTQzLmpwZw.jpg', '2022-08-22 05:36:41', NULL),
(33, 2, 'https://images.unsplash.com/photo-1612012460576-5d51b5b04b00?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d2FsbHBhcGVyJTIwZm9yJTIwbW9iaWxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80', '2022-08-22 05:36:57', NULL),
(34, 132, 'shoes1.jpeg', '2022-08-17 06:20:46', NULL),
(39, 3, 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', '2022-08-17 12:52:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `iProductId` int(64) NOT NULL,
  `vProductTitle` varchar(556) NOT NULL,
  `iProductPrice` int(128) NOT NULL,
  `iProductCategory` int(64) NOT NULL,
  `vProductDescription` varchar(556) NOT NULL,
  `vProductInformation` varchar(556) NOT NULL,
  `vAdditionalInfo` varchar(556) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  `vShipping` varchar(556) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`iProductId`, `vProductTitle`, `iProductPrice`, `iProductCategory`, `vProductDescription`, `vProductInformation`, `vAdditionalInfo`, `createdAt`, `updatedAt`, `deletedAt`, `vShipping`) VALUES
(1, 'OK wear 24k gold jwellery set', 63872, 2, 'good build quality', 'nice material used in this product', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-09-13 06:51:38', '2022-08-12 05:43:29', NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(2, 'Mens Casual Premium Slim Fit T-Shirts', 228, 1, 'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(3, 'Mens Cotton Jacket', 56, 1, 'great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(4, 'Mens Casual Slim Fit', 16, 1, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(5, 'John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet', 345, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(6, 'Solid Gold Petite Micropave ', 168, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(7, 'White Gold Plated Princess', 90, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(8, 'Pierced Owl Rose Gold Plated Stainless Steel Double', 11, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(9, 'WD 2TB Elements Portable External Hard Drive - USB 3.0 ', 64, 3, 'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(10, 'SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s', 109, 3, 'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(11, 'Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5', 332, 3, 'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(12, 'WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive', 522, 3, 'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(13, 'Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin', 4354, 3, 'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(14, 'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED ', 542, 3, 'Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(16, 'Lock and Love Women\'s Removable Hooded Faux Leather Moto Biker Jacket', 452, 4, 'Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(17, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 34431, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(18, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 32231, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(19, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(20, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(21, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(22, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(23, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(24, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(25, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(26, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(27, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(28, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(29, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(30, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(31, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(32, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(33, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(34, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(35, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(36, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(37, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(38, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(39, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(40, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(41, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(42, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(43, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(44, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(45, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(46, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(47, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(48, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(49, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(50, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(51, 'John Hardy Womens Legends Naga Gold & Silver Dragon Station Chain Bracelet', 3331, 2, 'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(53, 'womens casual tshirt', 23211, 4, 'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(66, 'mens casual shoes', 23455, 1, 'very nice shoes ', 'material:PU , size:9 , color:black', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.');
INSERT INTO `Products` (`iProductId`, `vProductTitle`, `iProductPrice`, `iProductCategory`, `vProductDescription`, `vProductInformation`, `vAdditionalInfo`, `createdAt`, `updatedAt`, `deletedAt`, `vShipping`) VALUES
(71, 'Mens Cotton Jacket', 4676, 1, 'great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(72, 'Mens Cotton Jacket', 423141, 1, 'great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(81, 'Mens Cotton Jacket', 453, 1, 'great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.', 'material:PU , size:9 , color:black', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(82, 'Mens Cotton Jacket', 453, 1, 'great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.', 'material:PU , size:9 , color:black', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(83, 'Mens Cotton Jacket', 453, 1, 'great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.', 'material:PU , size:9 , color:black', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(84, 'Mens Cotton Jacket', 123, 1, 'great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(85, 'Mens Cotton Jacket', 123, 1, 'great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(86, 'Mens Cotton Jacket', 123, 1, 'great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(113, 'rrrrrrrr', 1111111, 2, 'sdfsdsgdgsd', 'sssssssssssssssssssss', 'gggggggggggggggg', '2022-09-01 05:51:45', NULL, NULL, '234'),
(120, 'safasfafasfs', 123123, 4, 'sdfsfsfs', 'qweqwewq', 'sadfasdfasf', '2022-08-10 09:13:36', NULL, NULL, 'asdfsaf'),
(130, 'TTTT Mens Cotton Jacket', 574, 1, 'great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.', 'our perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 'Lore Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2022-08-10 09:13:36', NULL, NULL, 'ship Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.');

-- --------------------------------------------------------

--
-- Table structure for table `Reviews`
--

CREATE TABLE `Reviews` (
  `iReviewId` int(11) NOT NULL,
  `iProductId` int(11) NOT NULL,
  `vUserName` varchar(556) NOT NULL,
  `vDate` varchar(556) NOT NULL,
  `vReviews` varchar(556) NOT NULL,
  `iStar` int(11) NOT NULL,
  `vLikes` varchar(64) NOT NULL,
  `vDislikes` varchar(64) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Reviews`
--

INSERT INTO `Reviews` (`iReviewId`, `iProductId`, `vUserName`, `vDate`, `vReviews`, `iStar`, `vLikes`, `vDislikes`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'rahul', 'jan 17,2022', 'very good , nyc product', 3, '23', '12', '2022-08-24 13:22:42', NULL),
(2, 1, 'bunty', 'jan 17,2022', 'very good , nyc product', 2, '43', '2', '2022-08-24 13:22:42', NULL),
(3, 1, 'somu', 'jan 19,2022', 'very good , nyc product', 5, '4', '2', '2022-08-24 13:22:42', NULL),
(4, 2, 'somu', 'jan 22,2022', 'very bad , bad product', 1, '44', '6', '2022-08-24 13:22:42', NULL),
(5, 2, 'abhi', 'jan 24,2022', 'good one , good product', 4, '41', '2', '2022-08-24 13:22:42', NULL),
(6, 3, 'ankit', 'jan 24,2022', 'good one , good product', 1, '44', '6', '2022-08-24 13:22:42', NULL),
(7, 3, 'nitish', 'jan 24,2022', 'good one , good product', 4, '44', '6', '2022-08-24 13:22:42', NULL),
(8, 4, 'nitish', 'jan 24,2022', 'good one , good product', 4, '44', '6', '2022-08-24 13:22:42', NULL),
(9, 5, 'nitish', 'jan 24,2022', 'good one , good product', 4, '44', '6', '2022-08-24 13:22:42', NULL),
(10, 6, 'priya', 'jan 24,2022', 'good one , good product', 4, '22', '6', '2022-08-24 13:22:42', NULL),
(11, 7, 'sandy', 'jan 25,2022', 'good one , good product', 3, '22', '6', '2022-08-24 13:22:42', NULL),
(12, 8, 'mayur', 'jan 12,2022', 'good one , good product', 4, '52', '16', '2022-08-24 13:22:42', NULL),
(13, 9, 'mayur', 'jan 22,2022', 'good one , good product', 5, '62', '36', '2022-08-24 13:22:42', NULL),
(14, 10, 'vaishu', 'jan 12,2022', 'good one , good product', 3, '62', '36', '2022-08-24 13:22:42', NULL),
(15, 11, 'avani', 'jan 26,2022', 'good one , good product', 5, '82', '36', '2022-08-24 13:22:42', NULL),
(16, 12, 'hrithik', 'jan 16,2022', 'not good , bad product', 2, '82', '36', '2022-08-24 13:22:42', NULL),
(17, 13, 'gaurav', 'jan 26,2022', 'not good , bad product', 1, '82', '36', '2022-08-24 13:22:42', NULL),
(18, 14, 'vishal', 'jan 26,2022', 'good product ,osm product', 5, '82', '36', '2022-08-24 13:22:42', NULL),
(19, 15, 'akash', 'jan 30,2022', 'good product ,osm product', 3, '22', '36', '2022-08-24 13:22:42', NULL),
(20, 16, 'akash', 'jan 30,2022', 'good product ,osm product', 3, '2', '36', '2022-08-24 13:22:42', NULL),
(21, 8, 'harsh', 'jan 17,2022', 'good product awesome', 5, '22', '11', '2022-08-24 13:22:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Sliders`
--

CREATE TABLE `Sliders` (
  `iSliderId` int(64) NOT NULL,
  `vSliderUrl` varchar(556) NOT NULL,
  `iSliderSortId` int(64) NOT NULL,
  `vSliderRedirectTo` varchar(556) NOT NULL,
  `eStatus` enum('Active','Inactive') NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Sliders`
--

INSERT INTO `Sliders` (`iSliderId`, `vSliderUrl`, `iSliderSortId`, `vSliderRedirectTo`, `eStatus`, `createdAt`, `updatedAt`) VALUES
(1, 'https://wowslider.com/sliders/demo-18/data1/images/shanghai.jpg', 1, 'https://wowslider.com/sliders/demo-18/data1/images/shanghai.jpg', 'Active', '2022-11-22 05:24:57', NULL),
(2, 'https://wowslider.com/sliders/demo-18/data1/images/hongkong1081704.jpg', 2, 'https://wowslider.com/sliders/demo-18/data1/images/hongkong1081704.jpg', 'Active', '2022-11-22 05:24:57', NULL),
(3, 'https://wowslider.com/sliders/demo-18/data1/images/london830775.jpg', 3, 'https://wowslider.com/sliders/demo-18/data1/images/london830775.jpg', 'Active', '2022-11-22 05:24:57', NULL),
(4, 'https://wowslider.com/sliders/demo-18/data1/images/new_york.jpg', 4, 'https://wowslider.com/sliders/demo-18/data1/images/new_york.jpg', 'Active', '2022-11-22 05:24:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Staticpages`
--

CREATE TABLE `Staticpages` (
  `iStaticPagesId` int(11) NOT NULL,
  `vTitle` varchar(255) NOT NULL,
  `vCode` varchar(255) NOT NULL,
  `tDescription` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  `eStatus` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Staticpages`
--

INSERT INTO `Staticpages` (`iStaticPagesId`, `vTitle`, `vCode`, `tDescription`, `createdAt`, `updatedAt`, `deletedAt`, `eStatus`) VALUES
(1, 'About us', 'ABOUT_US', 'About us text', '2022-11-23 10:32:13', NULL, NULL, 'Active'),
(2, 'Terms and condition', 'TERMS_AND_CONDITION', 'Terms and condition text', '2022-11-23 10:32:13', NULL, NULL, 'Active'),
(3, 'Privacy policy', 'PRIVACY_POLICY', 'Privacy and policy text', '2022-11-23 10:32:13', NULL, NULL, 'Active'),
(4, 'Rules and regulation', 'RULES_AND_REGULATION', 'Rules and regulations text', '2022-11-23 10:32:13', NULL, NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `iUserId` int(11) NOT NULL,
  `vFirstName` varchar(255) NOT NULL,
  `vLastName` varchar(255) NOT NULL,
  `vEmail` varchar(255) NOT NULL,
  `vPassword` varchar(255) NOT NULL,
  `vConfirmPassword` varchar(128) NOT NULL,
  `vProfilePic` varchar(255) NOT NULL,
  `iPostCount` int(128) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`iUserId`, `vFirstName`, `vLastName`, `vEmail`, `vPassword`, `vConfirmPassword`, `vProfilePic`, `iPostCount`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(13, 'Pravin', 'Dabhi', 'pravin.dabhi+1@hiddenbrains.in', '$2b$10$L3s/qsknwH3s.FknWlZn6.7kIs0.I.flh2HiybHajmk/ePn/BkLj2', '', '', 0, '2022-08-02 12:03:35', '2022-08-02 12:03:35', NULL),
(14, 'Ankit Singh', 'Sendhav', 'ankit.singh@hiddenbrains.in', '$2b$10$3WF2b2reXJb4tsBVUP80Ouko/wpljFKvXk23R.rHUe/eX.Xh9Uvwa', '', '', 0, '2022-08-05 05:29:45', '2022-08-05 05:29:45', NULL),
(20, 'Mayur', 'Badodiya', 'mayur.badodiya@gmail.in', '$2b$10$J7F5ckGc.g/skFsvYEwX2uU9rGM2F.ghw0U0HmT5iF8dEWSFG/rgO', '', '', 0, '2022-08-25 06:24:35', '2022-11-22 11:42:38', NULL),
(26, 'Sandeep', 'Kousalya', 'sandeep@gmail.in', '$2b$10$DaNCjVS6B8I/eASfFwgZmumE5ARFnQZS5v3sbDWaJkOpwVUs5ZdLO', 'Admin@123', '', NULL, '2022-08-25 09:47:07', '2022-08-26 09:40:13', NULL),
(28, 'Jyotiraditya', 'Dash', 'aditya@gmail.com', '$2b$10$OVvK4NwHwsaoJkiU/Jj7l.pqQQuK.drpo0mZkwBr37OyROznfmZ2e', 'admin@123', '', NULL, '2022-11-15 06:48:36', '2022-11-29 05:50:19', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Carts`
--
ALTER TABLE `Carts`
  ADD PRIMARY KEY (`iCartId`);

--
-- Indexes for table `ChannelMembers`
--
ALTER TABLE `ChannelMembers`
  ADD PRIMARY KEY (`iChannelMemberId`),
  ADD KEY `iChannelId` (`iChannelId`);

--
-- Indexes for table `Channels`
--
ALTER TABLE `Channels`
  ADD PRIMARY KEY (`iChannelId`);

--
-- Indexes for table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`iCommentId`);

--
-- Indexes for table `Conversations`
--
ALTER TABLE `Conversations`
  ADD PRIMARY KEY (`iConversationId`);

--
-- Indexes for table `Faqs`
--
ALTER TABLE `Faqs`
  ADD PRIMARY KEY (`iFaqId`);

--
-- Indexes for table `ForgetPasswords`
--
ALTER TABLE `ForgetPasswords`
  ADD PRIMARY KEY (`iForgetPasswordId`);

--
-- Indexes for table `Posts`
--
ALTER TABLE `Posts`
  ADD PRIMARY KEY (`iPostId`);

--
-- Indexes for table `ProductCatagories`
--
ALTER TABLE `ProductCatagories`
  ADD PRIMARY KEY (`iProductCatagoryId`),
  ADD UNIQUE KEY `iProductCatagoryId` (`iProductCatagoryId`);

--
-- Indexes for table `ProductImages`
--
ALTER TABLE `ProductImages`
  ADD PRIMARY KEY (`iProductImageId`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`iProductId`);

--
-- Indexes for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD PRIMARY KEY (`iReviewId`),
  ADD KEY `vProductId` (`iProductId`);

--
-- Indexes for table `Sliders`
--
ALTER TABLE `Sliders`
  ADD PRIMARY KEY (`iSliderId`);

--
-- Indexes for table `Staticpages`
--
ALTER TABLE `Staticpages`
  ADD PRIMARY KEY (`iStaticPagesId`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`iUserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Carts`
--
ALTER TABLE `Carts`
  MODIFY `iCartId` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `ChannelMembers`
--
ALTER TABLE `ChannelMembers`
  MODIFY `iChannelMemberId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Channels`
--
ALTER TABLE `Channels`
  MODIFY `iChannelId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Comments`
--
ALTER TABLE `Comments`
  MODIFY `iCommentId` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Conversations`
--
ALTER TABLE `Conversations`
  MODIFY `iConversationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Faqs`
--
ALTER TABLE `Faqs`
  MODIFY `iFaqId` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ForgetPasswords`
--
ALTER TABLE `ForgetPasswords`
  MODIFY `iForgetPasswordId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `Posts`
--
ALTER TABLE `Posts`
  MODIFY `iPostId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `ProductImages`
--
ALTER TABLE `ProductImages`
  MODIFY `iProductImageId` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `iProductId` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `Reviews`
--
ALTER TABLE `Reviews`
  MODIFY `iReviewId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `Sliders`
--
ALTER TABLE `Sliders`
  MODIFY `iSliderId` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Staticpages`
--
ALTER TABLE `Staticpages`
  MODIFY `iStaticPagesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `iUserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ChannelMembers`
--
ALTER TABLE `ChannelMembers`
  ADD CONSTRAINT `ChannelMembers_ibfk_1` FOREIGN KEY (`iChannelId`) REFERENCES `Channels` (`iChannelId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;