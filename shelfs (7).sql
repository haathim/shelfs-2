-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2022 at 06:38 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shelfs`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phoneNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `adId` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `language` varchar(20) NOT NULL,
  `availableStatus` tinyint(1) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bookFrontPhoto` varchar(255) NOT NULL,
  `bookBackPhoto` varchar(255) NOT NULL,
  `category` varchar(30) NOT NULL,
  `sellerId` varchar(20) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`adId`, `title`, `author`, `price`, `ISBN`, `language`, `availableStatus`, `description`, `bookFrontPhoto`, `bookBackPhoto`, `category`, `sellerId`, `dateAdded`) VALUES
(1, 'Village By the Sea', 'Anita Desai', 2500, '1234567890123', 'English', 0, 'This is Village by the Sea.', '80.jpg', '80.jpg', 'Fiction', 'seller2', '2022-03-19 16:29:14'),
(2, 'Village By the Sea', 'Anita Desai', 2500, '1234567890123', 'English', 0, 'This is Village by the Sea.', '80.jpg', '80.jpg', 'Fiction', 'seller2', '2022-03-16 03:58:59'),
(3, 'Village By the Sea', 'Anita Desai', 2500, '1234567890123', 'English', 0, 'This is Village by the Sea.', '80.jpg', '80.jpg', 'Fiction', 'seller2', '2022-03-16 03:59:03'),
(4, 'Village By the Sea', 'Anita Desai', 2500, '1234567890123', 'English', 0, 'This is Village by the Sea.', '80.jpg', '80.jpg', 'Fiction', 'seller2', '2022-03-16 03:59:05'),
(5, 'Village By the Sea', 'Anita Desai', 2500, '1234567890123', 'English', 0, 'This is Village by the Sea.', '80.jpg', '80.jpg', 'Fiction', 'seller2', '2022-03-16 03:59:10'),
(6, 'Village By the Sea', 'Anita Desai', 2500, '1234567890123', 'English', 0, 'This is Village by the Sea.', '80.jpg', '80.jpg', 'Non-Fiction', 'seller2', '2022-03-16 03:59:12'),
(7, 'Village By the Sea', 'Anita Desai', 2500, '1234567890123', 'English', 0, 'This is Village by the Sea.', '80.jpg', '80.jpg', 'Non-Fiction', 'seller2', '2022-03-16 03:59:15'),
(8, 'Village By the Sea', 'Anita Desai', 2500, '1234567890123', 'English', 0, 'This is Village by the Sea.', '80.jpg', '80.jpg', 'Non-Fiction', 'seller2', '2022-03-16 03:59:18'),
(9, 'Village By the Sea', 'Anita Desai', 2500, '1234567890123', 'English', 0, 'This is Village by the Sea.', '80.jpg', '80.jpg', 'Non-Fiction', 'seller2', '2022-03-16 03:59:21'),
(10, 'Village By the Sea', 'Anita Desai', 2500, '1234567890123', 'English', 0, 'This is Village by the Sea.', '80.jpg', '80.jpg', 'Non-Fiction', 'seller2', '2022-03-16 03:59:24'),
(11, 'Village By the Sea', 'Anita Desai', 2500, '1234567890123', 'English', 0, 'This is Village by the Sea.', '80.jpg', '80.jpg', 'Other', 'seller2', '2022-03-16 03:59:27'),
(12, 'Village By the Sea', 'Anita Desai', 2500, '1234567890123', 'English', 0, 'This is Village by the Sea.', '80.jpg', '80.jpg', 'Other', 'seller2', '2022-03-16 03:59:29'),
(13, 'Village By the Sea', 'Anita Desai', 2500, '1234567890123', 'English', 0, 'This is Village by the Sea.', '80.jpg', '80.jpg', 'Other', 'seller2', '2022-03-16 03:59:33'),
(14, 'Village By the Sea', 'Anita Desai', 2500, '1234567890123', 'English', 0, 'This is Village by the Sea.', '80.jpg', '80.jpg', 'Other', 'seller2', '2022-03-23 12:08:08'),
(15, 'Village By the Sea', 'Anita Desai', 2500, '1234567890123', 'English', 0, 'This is Village by the Sea.', '80.jpg', '80.jpg', 'Other', 'seller2', '2022-03-23 12:08:09'),
(17, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 0, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2022-03-23 12:08:09'),
(19, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 0, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2022-03-23 12:08:09'),
(20, 'The Gota Games', 'Densel Washington', 975, '1234567890123', 'English', 0, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2022-03-23 16:02:28'),
(21, 'The Sound Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2022-03-24 03:00:23'),
(22, 'The Light Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2022-03-24 03:00:29'),
(23, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2022-03-24 01:15:43'),
(24, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2021-09-19 05:16:16'),
(25, 'The Hunger Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2022-03-22 07:00:00'),
(26, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2021-09-19 05:16:16'),
(27, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2021-09-19 05:16:16'),
(28, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2022-03-23 12:02:09'),
(29, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2021-09-19 05:16:16'),
(30, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2021-09-19 05:16:16'),
(31, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2021-09-19 05:16:16'),
(32, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2021-09-19 05:16:16'),
(33, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2021-09-19 05:16:16'),
(34, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2021-09-19 05:16:16'),
(35, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2021-09-19 05:16:16'),
(36, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2021-09-19 05:16:16'),
(37, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Non-Fiction', 'seller1', '2021-09-19 05:16:16'),
(38, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 0, 'Best description in the planet.', '14.jpg', '14.jpg', 'Fiction', 'seller1', '2022-03-23 16:02:28'),
(39, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Fiction', 'seller1', '2021-09-19 05:16:16'),
(40, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Fiction', 'seller1', '2021-09-19 05:16:16'),
(41, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Fiction', 'seller1', '2021-09-19 05:16:16'),
(42, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Fiction', 'seller1', '2021-09-19 05:16:16'),
(43, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 0, 'Best description in the planet.', '14.jpg', '14.jpg', 'Fiction', 'seller1', '2022-03-23 16:02:28'),
(44, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 0, 'Best description in the planet.', '14.jpg', '14.jpg', 'Fiction', 'seller1', '2022-03-24 05:16:13'),
(45, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Fiction', 'seller1', '2021-09-19 05:16:16'),
(46, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Fiction', 'seller1', '2021-09-19 05:16:16'),
(47, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Fiction', 'seller1', '2021-09-19 05:16:16'),
(48, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Fiction', 'seller1', '2021-09-19 05:16:16'),
(49, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Fiction', 'seller1', '2021-09-19 05:16:16'),
(50, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Fiction', 'seller1', '2021-09-19 05:16:16'),
(51, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(52, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(53, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(54, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(55, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(56, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(57, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(58, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(59, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(60, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(61, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(62, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(63, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(64, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(65, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(66, 'The Mind Games', 'Densel Washington', 975, '1234567890123', 'English', 1, 'Best description in the planet.', '14.jpg', '14.jpg', 'Other', 'seller1', '2021-09-19 05:16:16'),
(69, 'The Lord of the Rings', 'J.R.R. Tolkien', 1250, '1234567890123', 'English', 3, 'This is a fantasy book by J.R.R. Tolkien.', '80.jpg', '80.jpg', 'Fiction', 'seller1', '2022-03-24 05:18:30'),
(76, 'Gullivers Travels', 'Jonathan Swift', 1375, '1234567890123', 'English', 0, 'This is sample description.', '80.jpg', '80.jpg', 'Fiction', 'seller2', '2022-03-23 12:04:15'),
(80, 'Sample Title', 'S. Author', 1375, '1234567890123', 'English', 0, 'Sample description of book', '80.jpg', '80.jpg', 'Fiction', 'seller2', '2022-03-23 12:06:20');

-- --------------------------------------------------------

--
-- Table structure for table `buyerrequests`
--

CREATE TABLE `buyerrequests` (
  `requestId` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  `buyerId` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `comment` mediumtext NOT NULL,
  `preferredPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyerrequests`
--

INSERT INTO `buyerrequests` (`requestId`, `title`, `author`, `date`, `buyerId`, `category`, `comment`, `preferredPrice`) VALUES
(1, 'Village By the Land', 'Anita Usai', '2022-03-24 10:28:29', 'buyer1', 'Non-Fiction', 'This is the edited Version of the request.', 1250),
(11, 'Hard Times Create Strong Men', 'Charles Dickens', '2022-03-24 10:31:40', 'buyer1', 'Fiction', 'This is a book by CHarles Dickens.', 1200),
(12, 'The Head Game', 'Philip Mudd', '2021-10-02 12:26:38', 'buyer2', 'Fiction', 'Become a High Efficiency Analytic Decision maker.\r\nWe\'ve all been there: faced with a major decision, yet overwhelmed by the very data that is supposed to help us. It’s an all-too-common struggle in the digital age, when Google searches produce a million results in a split second and software programs provide analysis faster than we could ever hope to read it.', 1000),
(13, 'The Hobbit', 'J.R.R. Tolkien', '2021-10-01 12:26:38', 'buyer2', 'Fiction', 'The Hobbit, or There and Back Again is a children\'s fantasy novel by English author J. R. R. Tolkien. It was published on 21 September 1937 to wide critical acclaim, being nominated for the Carnegie Medal and awarded a prize from the New York Herald Tribune for best juvenile fiction.\r\nThe Hobbit, or There and Back Again is a children\'s fantasy novel by English author J. R. R. Tolkien. It was published on 21 September 1937 to wide critical acclaim, being nominated for the Carnegie Medal and awarded a prize from the New York Herald Tribune for best juvenile fiction.', 1000),
(15, 'Big Data', 'Timandra Harkins', '2021-10-14 15:52:02', 'seller1', 'Non-Fiction', 'This is a book about the Big Data', 2500),
(16, 'Big Data Part 2', 'Timandra Harkins', '2021-10-14 15:55:21', 'seller1', 'Non-Fiction', 'This is part 2 of Big Data', 2600),
(17, 'Structures and How they work', 'B. A. Shelfs', '2022-03-16 10:19:54', 'buyer2', 'Fiction', 'Book about civil engineering', 1200);

-- --------------------------------------------------------

--
-- Table structure for table `buyers`
--

CREATE TABLE `buyers` (
  `username` varchar(20) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `houseNo` varchar(10) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `district` varchar(20) NOT NULL,
  `province` varchar(20) NOT NULL,
  `sellerApplied` tinyint(1) NOT NULL,
  `phoneNo` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyers`
--

INSERT INTO `buyers` (`username`, `firstName`, `lastname`, `houseNo`, `street`, `city`, `district`, `province`, `sellerApplied`, `phoneNo`, `email`) VALUES
('buyer1', 'firstName1', 'lastName1', 'houseNo1', 'street1', 'city1', 'district1', 'province1', 0, '123456789', 'email1@gmail.com'),
('buyer10', 'Seven', 'Twenty', '67F', 'Core Road', 'Denver', 'Colombo', 'Central', 1, '0777345234', 'testEmai@gmail.com'),
('buyer2', 'firstName2', 'lastName2', 'houseNo2', 'street2', 'city2', 'district2', 'province2', 1, '123456789', 'email2@gmail.com'),
('buyer3', 'Andres', 'Vidoza', '45A', 'Reid Avenue', 'Colombo', 'Colombo', 'Western', 1, '0777567234', 'testEmail@gmail.com'),
('buyer4', 'Peter', 'Mckinnon', '21E', 'Baseline Road', 'Colombo', 'Colombo', 'Western', 1, '0777890432', 'testEmail1@gmail.com'),
('buyer456', 'Shehan', 'Miaduwantha', '786', 'Diagon Alley', 'Cadbury', 'Kegalle', 'Sabaragamuwa', 1, '0777456789', 'testEamail@gmail.com'),
('buyer5', 'Marques', 'Brownlee', '12D', 'Kandy Road', 'Kandy', 'Kandy', 'Central', 1, '0777345890', 'testEmail2@gmail.com'),
('buyer6', 'Mike', 'Tyson', '45A', 'Galle Road', 'Colombo', 'Colombo', 'Western', 1, '0777246357', 'testEmail3@gmail.com'),
('buyer7', 'Robin', 'Hobb', '89A', 'Pentreve Gardens', 'Colombo', 'Colombo', 'Western', 1, '0777098543', 'testEmail4@gmail.com'),
('newuser45', 'New', 'User', '34', 'Street One', 'City One', 'Colombo', 'Western', 0, '0773271199', 'darkhollows@gmail.com'),
('seller1', 'firstName3', 'lastName3', 'houseNo3', 'street3', 'city3', 'district3', 'province3', 1, '987654321', 'email3@gmail.com'),
('seller2', 'firstName4', 'lastName4', 'houseNo4', 'street4', 'city4', 'district4', 'province4', 1, '987654321', 'email4@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `cartitems`
--

CREATE TABLE `cartitems` (
  `cartId` int(11) NOT NULL,
  `adId` int(11) NOT NULL,
  `buyerId` varchar(20) NOT NULL,
  `timeAdded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `complaintId` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `readByAdmin` tinyint(1) DEFAULT NULL,
  `buyerId` varchar(20) DEFAULT NULL,
  `reply` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`complaintId`, `title`, `description`, `readByAdmin`, `buyerId`, `reply`) VALUES
(1, 'Pure Mathematics', 'dgfdsgdf dg dg dfg df gdfg fdgfdsg df gdfg dfg dfg dfs', 1, 'buyer2', 'We have addressed your complaint. Thanks for the suggestion.'),
(2, 'Not Functioning', 'The Functions of this website are not functioning.', 1, 'buyer2', 'This complaint is noted'),
(3, 'I want to quit', 'i kdsjbvh vkjvlkj kfvlkj fhk hkj hkjh kjfvh k vv v v v', 1, 'buyer2', 'Thank you we will check it immedaiately.');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `username` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phoneNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`username`, `name`, `phoneNo`) VALUES
('delivery1', 'Delivery One', '1234567890'),
('delivery2', 'Atlas Chooty', '0777123456'),
('delivery23', 'Thisura Ramanayake', '0777123456'),
('delivery3', 'School Mate', '0777123456'),
('delivery34', 'Harry Potter', '0777123456');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `messageId` int(11) NOT NULL,
  `from` varchar(20) NOT NULL,
  `to` varchar(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `content` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `neworderpickups`
--

CREATE TABLE `neworderpickups` (
  `pickupId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `sellerId` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `deliverer` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `neworderpickups`
--

INSERT INTO `neworderpickups` (`pickupId`, `orderId`, `sellerId`, `status`, `deliverer`) VALUES
(34, 23, 'seller1', 2, 'delivery1'),
(35, 23, 'seller2', 2, 'delivery1'),
(36, 24, 'seller1', 0, 'delivery1'),
(37, 24, 'seller2', 0, 'delivery1'),
(38, 25, 'seller1', 0, 'delivery1');

-- --------------------------------------------------------

--
-- Table structure for table `neworders`
--

CREATE TABLE `neworders` (
  `orderId` int(11) NOT NULL,
  `buyerId` varchar(20) NOT NULL,
  `dateOrdered` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL,
  `deliverer` varchar(20) DEFAULT NULL,
  `isCourier` tinyint(1) DEFAULT NULL,
  `totalPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `neworders`
--

INSERT INTO `neworders` (`orderId`, `buyerId`, `dateOrdered`, `status`, `deliverer`, `isCourier`, `totalPrice`) VALUES
(23, 'buyer2', '2022-03-24 05:19:22', 3, 'delivery1', 0, 4975),
(24, 'buyer1', '2022-03-23 12:08:08', 0, NULL, 0, 6950),
(25, 'buyer1', '2022-03-23 16:02:28', 0, NULL, 0, 2925);

-- --------------------------------------------------------

--
-- Table structure for table `newpickupsads`
--

CREATE TABLE `newpickupsads` (
  `pickupId` int(11) NOT NULL,
  `adId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `newpickupsads`
--

INSERT INTO `newpickupsads` (`pickupId`, `adId`) VALUES
(34, 44),
(34, 69),
(35, 76),
(35, 80),
(36, 17),
(36, 19),
(37, 14),
(37, 15),
(38, 20),
(38, 38),
(38, 43);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `buyerId` varchar(20) NOT NULL,
  `adId` int(11) NOT NULL,
  `isCompleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `buyerId`, `adId`, `isCompleted`) VALUES
(42, 'buyer1', 6, 0),
(43, 'buyer1', 7, 0),
(44, 'buyer1', 8, 0),
(45, 'buyer1', 9, 0),
(46, 'buyer1', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pendingjobs`
--

CREATE TABLE `pendingjobs` (
  `orderId` int(11) NOT NULL,
  `seller-houseNo` varchar(10) NOT NULL,
  `seller-street` varchar(50) NOT NULL,
  `seller-city` varchar(50) NOT NULL,
  `seller-district` varchar(30) NOT NULL,
  `seller-province` varchar(30) NOT NULL,
  `buyer-houseNo` varchar(10) NOT NULL,
  `buyer-street` varchar(50) NOT NULL,
  `buyer-city` varchar(50) NOT NULL,
  `buyer-district` varchar(30) NOT NULL,
  `buyer-province` varchar(30) NOT NULL,
  `acceptedByDeliverer` tinyint(1) NOT NULL,
  `deliverer` varchar(20) DEFAULT NULL,
  `isPickedup` tinyint(1) NOT NULL,
  `isDelivered` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pickuporders`
--

CREATE TABLE `pickuporders` (
  `id` int(11) NOT NULL,
  `pickupId` int(11) NOT NULL,
  `adId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pickuporders`
--

INSERT INTO `pickuporders` (`id`, `pickupId`, `adId`) VALUES
(1, 8, 1),
(2, 8, 3),
(3, 9, 2),
(4, 9, 5),
(7, 14, 6),
(8, 14, 8),
(9, 15, 7),
(10, 15, 10),
(11, 17, 6),
(12, 17, 8),
(13, 18, 7),
(14, 18, 10);

-- --------------------------------------------------------

--
-- Table structure for table `pickuppaymentstatus`
--

CREATE TABLE `pickuppaymentstatus` (
  `pickupId` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pickuppaymentstatus`
--

INSERT INTO `pickuppaymentstatus` (`pickupId`, `status`) VALUES
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pickups`
--

CREATE TABLE `pickups` (
  `pickupId` int(11) NOT NULL,
  `sellerId` varchar(20) NOT NULL,
  `datePlaced` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL,
  `deliverer` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pickups`
--

INSERT INTO `pickups` (`pickupId`, `sellerId`, `datePlaced`, `status`, `deliverer`) VALUES
(1, 'buyer5', '2021-12-11 10:39:20', 0, 'delivery1'),
(2, 'buyer6', '2021-12-11 10:39:20', 0, 'delivery2'),
(3, 'seller1', '2021-12-11 10:39:38', 0, 'delivery3'),
(4, 'seller2', '2021-12-11 10:39:38', 0, 'delivery34'),
(5, 'seller1', '2021-12-11 11:12:49', 0, NULL),
(6, 'seller2', '2021-12-11 11:12:49', 0, NULL),
(8, 'seller1', '2021-12-11 11:14:34', 0, NULL),
(9, 'seller2', '2021-12-11 11:14:34', 0, NULL),
(11, 'seller1', '2021-12-11 11:17:31', 0, NULL),
(12, 'seller2', '2021-12-11 11:17:31', 0, NULL),
(14, 'seller1', '2021-12-11 11:19:23', 0, NULL),
(15, 'seller2', '2021-12-11 11:19:23', 0, NULL),
(17, 'seller1', '2021-12-11 11:20:11', 0, NULL),
(18, 'seller2', '2021-12-11 11:20:11', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `ratingId` int(11) NOT NULL,
  `buyerId` varchar(20) NOT NULL,
  `sellerId` varchar(20) NOT NULL,
  `orderId` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rating` tinyint(1) NOT NULL,
  `comment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sellerapplications`
--

CREATE TABLE `sellerapplications` (
  `buyerId` varchar(20) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `nicPhotoFront` varchar(255) NOT NULL,
  `nicPhotoBack` varchar(255) NOT NULL,
  `isAccepted` tinyint(1) NOT NULL,
  `isRejected` tinyint(1) NOT NULL,
  `bankAccountNo` varchar(15) NOT NULL,
  `bankName` varchar(50) NOT NULL,
  `bankBranch` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sellerapplications`
--

INSERT INTO `sellerapplications` (`buyerId`, `nic`, `nicPhotoFront`, `nicPhotoBack`, `isAccepted`, `isRejected`, `bankAccountNo`, `bankName`, `bankBranch`) VALUES
('buyer2', '199933210059', 'buyer2062c1ebc-6986-473b-807c-5e0adcccebf6.jpg', 'buyer21d9cc9d1-bcfd-45b9-ba8d-5ae14d713fbc.jpg', 0, 0, '1234 3456', 'Sampath Back', 'Colombo'),
('buyer3', '199933210055', 'buyer2062c1ebc-6986-473b-807c-5e0adcccebf6.jpg', 'buyer21d9cc9d1-bcfd-45b9-ba8d-5ae14d713fbc.jpg', 0, 0, '123456789012345', 'Seylan Bank', 'Wellawatte'),
('buyer4', '199933210054', 'buyer2062c1ebc-6986-473b-807c-5e0adcccebf6.jpg', 'buyer21d9cc9d1-bcfd-45b9-ba8d-5ae14d713fbc.jpg', 0, 0, '123456789012345', 'Seylan Bank', 'Wellawatte'),
('buyer456', '199933210059', 'buyer2062c1ebc-6986-473b-807c-5e0adcccebf6.jpg', 'buyer21d9cc9d1-bcfd-45b9-ba8d-5ae14d713fbc.jpg', 0, 0, '123456789012345', 'Seylan Bank', 'Wellawatte'),
('buyer5', '199922356787', 'buyer2062c1ebc-6986-473b-807c-5e0adcccebf6.jpg', 'buyer21d9cc9d1-bcfd-45b9-ba8d-5ae14d713fbc.jpg', 1, 0, '123456789012345', 'Seylan Bank', 'Wellawatte'),
('buyer6', '199933210044', 'buyer2062c1ebc-6986-473b-807c-5e0adcccebf6.jpg', 'buyer21d9cc9d1-bcfd-45b9-ba8d-5ae14d713fbc.jpg', 1, 0, '123456789012345', 'Seylan Bank', 'Wellawatte'),
('buyer7', '199933210033', 'buyer2062c1ebc-6986-473b-807c-5e0adcccebf6.jpg', 'buyer21d9cc9d1-bcfd-45b9-ba8d-5ae14d713fbc.jpg', 0, 0, '123456789012345', 'Seylan Bank', 'Wellawatte');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `username` varchar(20) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `nicPhotoFront` varchar(255) NOT NULL,
  `nicPhotoBack` varchar(255) NOT NULL,
  `bankAccountNo` varchar(15) NOT NULL,
  `bankName` varchar(50) NOT NULL,
  `bankBranch` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`username`, `nic`, `nicPhotoFront`, `nicPhotoBack`, `bankAccountNo`, `bankName`, `bankBranch`) VALUES
('buyer5', '199922356787', 'buyer2062c1ebc-6986-473b-807c-5e0adcccebf6.jpg', 'buyer21d9cc9d1-bcfd-45b9-ba8d-5ae14d713fbc.jpg', '123456789012345', 'Seylan Bank', 'Wellawatte'),
('buyer6', '199933210044', 'buyer2062c1ebc-6986-473b-807c-5e0adcccebf6.jpg', 'buyer21d9cc9d1-bcfd-45b9-ba8d-5ae14d713fbc.jpg', '123456789012345', 'HSBC', 'Colombo'),
('seller1', '2009765321', 'buyer2062c1ebc-6986-473b-807c-5e0adcccebf6.jpg', 'buyer21d9cc9d1-bcfd-45b9-ba8d-5ae14d713fbc.jpg', '123456789012345', 'HSBC', 'Colombo'),
('seller2', '2009765322', 'buyer2062c1ebc-6986-473b-807c-5e0adcccebf6.jpg', 'buyer21d9cc9d1-bcfd-45b9-ba8d-5ae14d713fbc.jpg', '123456789012345', 'HSBC', 'Colombo');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `userType` varchar(20) DEFAULT NULL,
  `salt` int(11) NOT NULL,
  `dateJoined` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `userType`, `salt`, `dateJoined`, `verified`) VALUES
('admin1', '3e0a3501a65b4a7bf889c6f180cc6e35747e5aaff931cc90b760671efa09aeac', 'admin', 1234, '2021-09-01 03:03:56', 1),
('buyer1', '3e0a3501a65b4a7bf889c6f180cc6e35747e5aaff931cc90b760671efa09aeac', 'buyer', 1234, '2021-09-08 07:31:55', 1),
('buyer10', 'd182b13244ef9f63610c89517956d1c7957d8605f1a0bb65a3a63082cafcc575', 'buyer', 7300, '2021-10-14 13:42:15', 1),
('buyer123', '234287db0b6c0a32297aef7a684145fabb34f8c60792a91a9716c70c505afdee', 'buyer', 8000, '2021-10-19 06:19:00', 1),
('buyer2', '3e0a3501a65b4a7bf889c6f180cc6e35747e5aaff931cc90b760671efa09aeac', 'buyer', 1234, '2021-10-01 07:31:55', 1),
('buyer3', '3e0a3501a65b4a7bf889c6f180cc6e35747e5aaff931cc90b760671efa09aeac', 'buyer', 1234, '2021-10-12 04:48:17', 1),
('buyer4', 'f7a57d37a3933478fa043ccda4fd0cd7dbd860d0356e9c2d440d261e64a2e536', 'buyer', 214, '2021-10-12 09:44:40', 1),
('buyer456', '788d435b640973aedd0fe6bb4d087eebe2e9a3e154ac258c6e90f25e0c1db59b', 'buyer', 1646, '2021-10-22 04:49:40', 1),
('buyer5', '83392aabc2e923366b6b81888317936bd08984dae29633005c3e53a4a00d31b6', 'seller', 1495, '2021-10-12 15:27:07', 1),
('buyer6', '979abcaa109eddfff3507dee704682830c01a27efeb812bf7ca818de3820b90d', 'seller', 8900, '2021-10-12 15:29:51', 1),
('buyer7', '321d59dda50637b25ec88787f08c57b41429796efbb55b1006ae2886c0e69181', 'buyer', 6237, '2021-10-12 15:36:30', 1),
('delivery1', '3e0a3501a65b4a7bf889c6f180cc6e35747e5aaff931cc90b760671efa09aeac', 'delivery', 1234, '2021-10-01 06:14:32', 1),
('delivery2', 'c585d6268dc3c3ca23bef57c92aac3188b5c3a375cfb6856621d48b7779dce66', 'delivery', 8558, '2021-10-16 09:25:36', 1),
('delivery23', '0fa5a27ed02ad3068af42a5e15937e72eb12d54920280bd7f671c4ed9e682548', 'delivery', 167, '2021-10-27 12:57:00', 1),
('delivery3', 'f47527cc873cf93f5fd665889b97c0812d26c3aa07178d4e3ec1ad58ef195149', 'delivery', 4280, '2021-10-16 10:51:26', 1),
('delivery34', '1539b17c2f176eeab3f5d5d1cba188d1b9192e0f6453c733e2bf7c5f5f34bdb4', 'delivery', 3621, '2021-10-27 17:16:51', 1),
('newuser45', '41e85fd13181768c52592cd4c3c8929fd3e9fb7364a6fc459064d2d88900ca8c', 'buyer', 29, '2022-01-10 04:42:09', 1),
('seller1', '3e0a3501a65b4a7bf889c6f180cc6e35747e5aaff931cc90b760671efa09aeac', 'seller', 1234, '2021-09-16 06:14:32', 1),
('seller2', '3e0a3501a65b4a7bf889c6f180cc6e35747e5aaff931cc90b760671efa09aeac', 'seller', 1234, '2021-10-01 06:14:32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlistId` int(11) NOT NULL,
  `adId` int(11) NOT NULL,
  `buyerId` varchar(20) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlistId`, `adId`, `buyerId`, `dateAdded`) VALUES
(3, 76, 'buyer2', '2022-03-16 04:48:58'),
(4, 69, 'seller1', '2022-03-17 09:07:08'),
(5, 76, 'seller1', '2022-03-17 09:07:08'),
(9, 69, 'buyer2', '2022-03-20 13:52:05'),
(14, 38, 'buyer1', '2022-03-21 05:54:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`adId`),
  ADD KEY `sellerId` (`sellerId`);

--
-- Indexes for table `buyerrequests`
--
ALTER TABLE `buyerrequests`
  ADD PRIMARY KEY (`requestId`),
  ADD KEY `buyerId` (`buyerId`);

--
-- Indexes for table `buyers`
--
ALTER TABLE `buyers`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD PRIMARY KEY (`cartId`),
  ADD KEY `buyerId` (`buyerId`),
  ADD KEY `adId` (`adId`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`complaintId`),
  ADD KEY `buyerId` (`buyerId`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageId`),
  ADD KEY `from` (`from`),
  ADD KEY `to` (`to`);

--
-- Indexes for table `neworderpickups`
--
ALTER TABLE `neworderpickups`
  ADD PRIMARY KEY (`pickupId`),
  ADD KEY `orderId` (`orderId`),
  ADD KEY `sellerId` (`sellerId`),
  ADD KEY `deliverer` (`deliverer`);

--
-- Indexes for table `neworders`
--
ALTER TABLE `neworders`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `buyerId` (`buyerId`),
  ADD KEY `deliverer` (`deliverer`);

--
-- Indexes for table `newpickupsads`
--
ALTER TABLE `newpickupsads`
  ADD PRIMARY KEY (`adId`),
  ADD KEY `pickupId` (`pickupId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`),
  ADD UNIQUE KEY `adId` (`adId`),
  ADD KEY `buyerId` (`buyerId`);

--
-- Indexes for table `pendingjobs`
--
ALTER TABLE `pendingjobs`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `deliverer` (`deliverer`);

--
-- Indexes for table `pickuporders`
--
ALTER TABLE `pickuporders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adId` (`adId`),
  ADD KEY `pickupId` (`pickupId`);

--
-- Indexes for table `pickuppaymentstatus`
--
ALTER TABLE `pickuppaymentstatus`
  ADD PRIMARY KEY (`pickupId`);

--
-- Indexes for table `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`pickupId`),
  ADD KEY `sellerId` (`sellerId`),
  ADD KEY `deliverer` (`deliverer`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`ratingId`),
  ADD KEY `buyerId` (`buyerId`),
  ADD KEY `sellerId` (`sellerId`),
  ADD KEY `orderId` (`orderId`);

--
-- Indexes for table `sellerapplications`
--
ALTER TABLE `sellerapplications`
  ADD PRIMARY KEY (`buyerId`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlistId`),
  ADD KEY `buyerId` (`buyerId`),
  ADD KEY `adId` (`adId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `adId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `buyerrequests`
--
ALTER TABLE `buyerrequests`
  MODIFY `requestId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cartitems`
--
ALTER TABLE `cartitems`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `complaintId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `messageId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `neworderpickups`
--
ALTER TABLE `neworderpickups`
  MODIFY `pickupId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `neworders`
--
ALTER TABLE `neworders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `pickuporders`
--
ALTER TABLE `pickuporders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pickups`
--
ALTER TABLE `pickups`
  MODIFY `pickupId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `ratingId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlistId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD CONSTRAINT `advertisements_ibfk_1` FOREIGN KEY (`sellerId`) REFERENCES `sellers` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `buyerrequests`
--
ALTER TABLE `buyerrequests`
  ADD CONSTRAINT `buyerrequests_ibfk_1` FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `buyers`
--
ALTER TABLE `buyers`
  ADD CONSTRAINT `buyers_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD CONSTRAINT `cartitems_ibfk_1` FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `cartitems_ibfk_2` FOREIGN KEY (`adId`) REFERENCES `advertisements` (`adId`) ON DELETE CASCADE;

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from`) REFERENCES `users` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to`) REFERENCES `users` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `neworderpickups`
--
ALTER TABLE `neworderpickups`
  ADD CONSTRAINT `neworderpickups_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `neworders` (`orderId`) ON DELETE CASCADE,
  ADD CONSTRAINT `neworderpickups_ibfk_2` FOREIGN KEY (`sellerId`) REFERENCES `sellers` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `neworderpickups_ibfk_3` FOREIGN KEY (`deliverer`) REFERENCES `delivery` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `neworders`
--
ALTER TABLE `neworders`
  ADD CONSTRAINT `neworders_ibfk_1` FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `neworders_ibfk_2` FOREIGN KEY (`deliverer`) REFERENCES `delivery` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `newpickupsads`
--
ALTER TABLE `newpickupsads`
  ADD CONSTRAINT `newpickupsads_ibfk_1` FOREIGN KEY (`pickupId`) REFERENCES `neworderpickups` (`pickupId`) ON DELETE CASCADE,
  ADD CONSTRAINT `newpickupsads_ibfk_2` FOREIGN KEY (`adId`) REFERENCES `advertisements` (`adId`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`adId`) REFERENCES `advertisements` (`adId`) ON DELETE CASCADE;

--
-- Constraints for table `pendingjobs`
--
ALTER TABLE `pendingjobs`
  ADD CONSTRAINT `pendingjobs_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE,
  ADD CONSTRAINT `pendingjobs_ibfk_2` FOREIGN KEY (`deliverer`) REFERENCES `delivery` (`username`);

--
-- Constraints for table `pickuporders`
--
ALTER TABLE `pickuporders`
  ADD CONSTRAINT `pickuporders_ibfk_1` FOREIGN KEY (`adId`) REFERENCES `advertisements` (`adId`) ON DELETE CASCADE,
  ADD CONSTRAINT `pickuporders_ibfk_2` FOREIGN KEY (`pickupId`) REFERENCES `pickups` (`pickupId`) ON DELETE CASCADE;

--
-- Constraints for table `pickuppaymentstatus`
--
ALTER TABLE `pickuppaymentstatus`
  ADD CONSTRAINT `pickuppaymentstatus_ibfk_1` FOREIGN KEY (`pickupId`) REFERENCES `neworderpickups` (`pickupId`) ON DELETE CASCADE;

--
-- Constraints for table `pickups`
--
ALTER TABLE `pickups`
  ADD CONSTRAINT `pickups_ibfk_1` FOREIGN KEY (`sellerId`) REFERENCES `sellers` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `pickups_ibfk_2` FOREIGN KEY (`deliverer`) REFERENCES `delivery` (`username`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`sellerId`) REFERENCES `sellers` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE;

--
-- Constraints for table `sellerapplications`
--
ALTER TABLE `sellerapplications`
  ADD CONSTRAINT `sellerapplications_ibfk_1` FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `sellers`
--
ALTER TABLE `sellers`
  ADD CONSTRAINT `sellers_ibfk_1` FOREIGN KEY (`username`) REFERENCES `buyers` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`adId`) REFERENCES `advertisements` (`adId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
