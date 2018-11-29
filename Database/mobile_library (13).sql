-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2017 at 03:57 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobile_library`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBookAuthor` (IN `bid` INT(11), IN `aid` INT(11))  NO SQL
INSERT INTO book_author VALUES(null, bid, aid)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBookCatagory` (IN `bid` INT(11), IN `cid` INT(11))  NO SQL
INSERT INTO book_catagory VALUES(null, bid, cid)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewAuthor` (IN `fName` VARCHAR(128), IN `lName` VARCHAR(128))  NO SQL
INSERT INTO authors VALUES(null, fName, lName)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewBook` (IN `bNum` VARCHAR(128), IN `bTitle` VARCHAR(128), IN `bPrice` INT(11), IN `bLan` VARCHAR(128), IN `bEdi` VARCHAR(128))  NO SQL
INSERT INTO books VALUES(null, bNum, bTitle, bPrice, bLan, bEdi)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewBookRecord` (IN `mid` INT(11), IN `bid` INT(11), IN `tDate` DATE, IN `rDate` DATE)  NO SQL
INSERT INTO books_record VALUES(null, mid, bid, tDate, rDate, 0)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewCatagory` (IN `name` VARCHAR(128))  NO SQL
INSERT INTO catagory VALUES(null, name)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewFee` (IN `type` VARCHAR(128), IN `bdt` INT(11))  NO SQL
INSERT INTO fees VALUES(null, type, bdt)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewMember` (IN `uid` VARCHAR(256), IN `mNo` VARCHAR(11), IN `occ` VARCHAR(128), IN `isApp` BOOLEAN, IN `date` DATE, IN `type` INT(11))  NO SQL
INSERT INTO member VALUES(null, uid, mNo, occ, isApp, date, type)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewSchedule` (IN `day` VARCHAR(128), IN `place_name` VARCHAR(128), IN `place_address` VARCHAR(256), IN `arr_time` TIMESTAMP, IN `lea_time` TIMESTAMP)  NO SQL
INSERT INTO schedule VALUES(null, day, place_name, place_address, arr_time, lea_time)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ApprovedByUid` (IN `uid` VARCHAR(256), IN `isApp` BOOLEAN, IN `mNum` VARCHAR(11))  NO SQL
UPDATE member SET member.member_number = mNum, member.Is_approved = 1
WHERE member.user_id = uid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DelateAuthorByAid` (IN `aid` INT(11))  NO SQL
DELETE FROM authors WHERE authors.id = aid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DelateCatagoryByCID` (IN `cid` INT(11))  NO SQL
DELETE FROM catagory WHERE catagory.id = cid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFees` (IN `id` INT(11))  NO SQL
DELETE FROM fees 
WHERE fees.id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteSchedule` (IN `id` INT(11))  NO SQL
DELETE FROM schedule 
WHERE schedule.id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllApprovedMember` ()  NO SQL
SELECT users.Id, users.UserName, users.Email, users.PhoneNumber, 
member.member_number, member.date_registered, 
member_type.type
FROM users
INNER JOIN member ON member.user_id = users.Id
INNER JOIN member_type ON member.member_type_id = member_type.id
WHERE member.Is_approved = 1
ORDER BY member.member_number$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllAuthor` ()  NO SQL
SELECT authors.id, authors.first_name, authors.last_name FROM authors
ORDER BY authors.first_name$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllBooks` ()  NO SQL
SELECT b.title, b.price, b.language,COUNT(*),
catagory.catagoty_name, authors.first_name, authors.last_name
FROM books as b
INNER JOIN book_catagory ON b.id = book_catagory.books_id
INNER JOIN catagory ON book_catagory.catagory_id = catagory.id
INNER JOIN book_author ON b.id = book_author.book_id
INNER JOIN authors ON authors.id = book_author.author_id
GROUP BY b.title$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCategory` ()  NO SQL
SELECT catagory.id, catagory.catagoty_name FROM catagory
ORDER BY catagory.catagoty_name$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFees` ()  NO SQL
SELECT * FROM fees$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllNotApprovedMemmbers` ()  NO SQL
SELECT users.Id, users.UserName, users.Email, users.PhoneNumber, 
member.date_registered, 
member_type.type
FROM users
INNER JOIN member ON member.user_id = users.Id
INNER JOIN member_type ON member.member_type_id = member_type.id
WHERE member.Is_approved = 0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllSchedule` ()  NO SQL
SELECT schedule.id, days.day, schedule.place_name, 
schedule.place_address, schedule.arrive_time, schedule.leave_time
FROM schedule
INNER JOIN days ON schedule.day = days.id
ORDER BY schedule.day$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBookForLibrarian` ()  NO SQL
SELECT br.id, br.date_taken, br.date_tobe_returned, member.member_number,
users.firstname, users.lastname, books.title, books.book_number
FROM books_record as br
INNER JOIN member on member.id = br.member_id
INNER JOIN users on users.Id = member.user_id
INNER JOIN books on books.id = br.books_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBookHistoryByUid` (IN `uid` VARCHAR(128))  NO SQL
SELECT books_record.date_taken, books_record.has_returned,
books.title, books.book_number
FROM books_record
INNER JOIN books ON books_record.books_id = books.id
INNER JOIN member On books_record.member_id = member.id
WHERE member.user_id = uid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBookIdByBookNum` (IN `bNum` VARCHAR(128))  NO SQL
SELECT books.id 
FROM books
WHERE books.book_number = bNum$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBookNumber` (IN `bNum` VARCHAR(128))  NO SQL
SELECT books.book_number FROM books
WHERE books.book_number = bNum$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBooksForReceived` ()  NO SQL
SELECT br.id, br.date_taken, br.date_tobe_returned, member.member_number,
users.firstname, users.lastname, books.title, books.book_number
FROM books_record as br
INNER JOIN member on member.id = br.member_id
INNER JOIN users on users.Id = member.user_id
INNER JOIN books on books.id = br.books_id
WHERE br.has_returned=0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDayFromSchedule` ()  NO SQL
SELECT day FROM schedule$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetLastInsertedBookId` ()  NO SQL
SELECT MAX(id) FROM books$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetLastUserID` ()  NO SQL
SELECT LAST_INSERT_ID(users.Id) FROM users$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMemberDetailByUid` (IN `uid` VARCHAR(256))  NO SQL
SELECT u.id, u.UserName, u.firstname, u.lastname, u.father_name,
u.mother_name, u.Email, u.sex, u.current_address, u.parmanent_address,
u.date_of_birth, u.education, u.blood_group, u.PhoneNumber,
member.member_number, member.occupation, member.date_registered,
member_type.type
FROM users as u
INNER JOIN member on u.Id = member.user_id
INNER JOIN member_type on member.member_type_id = member_type.id
WHERE u.Id = uid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMemberIdByMemberNum` (IN `mNum` VARCHAR(128))  NO SQL
SELECT member.id
FROM member
WHERE member.member_number = mNum$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMemberNumber` (IN `mnum` VARCHAR(11))  NO SQL
SELECT member.member_number 
FROM member
WHERE member.member_number = mnum
LIMIT 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPlaceAddressByDayPlaceName` (IN `pName` VARCHAR(128), IN `day` VARCHAR(128))  NO SQL
SELECT schedule.place_address FROM schedule
WHERE schedule.place_name = pName AND schedule.day = day$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPlaceNameByDay` (IN `day` VARCHAR(128))  NO SQL
SELECT schedule.place_name FROM schedule
WHERE schedule.day = day$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTimeByDayPlaceNameAddress` (IN `day` VARCHAR(128), IN `pName` VARCHAR(128), IN `pAddress` VARCHAR(256))  NO SQL
SELECT schedule.id, schedule.arrive_time, schedule.leave_time FROM schedule
WHERE schedule.day = day 
AND schedule.place_name = pName
AND schedule.place_address = pAddress$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserDetailsByUid` (IN `uid` VARCHAR(128))  NO SQL
SELECT u.id, u.UserName, u.firstname, u.lastname, u.father_name, u.mother_name, u.Email, u.sex, u.current_address, u.parmanent_address, u.date_of_birth, u.education, u.blood_group, u.PhoneNumber
FROM users as u
WHERE u.id = uid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByAuthorName` (IN `author` VARCHAR(128))  NO SQL
SELECT b.title, b.price, b.language,COUNT(*),
catagory.catagoty_name, authors.first_name, authors.last_name
FROM books as b
INNER JOIN book_catagory ON b.id = book_catagory.books_id
INNER JOIN catagory ON book_catagory.catagory_id = catagory.id
INNER JOIN book_author ON b.id = book_author.book_id
INNER JOIN authors ON authors.id = book_author.author_id
WHERE authors.first_name = author OR authors.last_name = author
GROUP BY b.title$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByBookName` (IN `Bname` VARCHAR(128))  NO SQL
SELECT br.id, br.date_taken, br.date_tobe_returned, member.member_number,
users.firstname, users.lastname, books.title, books.book_number
FROM books_record as br
INNER JOIN member on member.id = br.member_id
INNER JOIN users on users.Id = member.user_id
INNER JOIN books on books.id = br.books_id
WHERE books.title=Bname$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByBookNameForRe` (IN `Bname` VARCHAR(128))  NO SQL
SELECT br.id, br.date_taken, br.date_tobe_returned, member.member_number,
users.firstname, users.lastname, books.title, books.book_number
FROM books_record as br
INNER JOIN member on member.id = br.member_id
INNER JOIN users on users.Id = member.user_id
INNER JOIN books on books.id = br.books_id
WHERE books.title=Bname
AND br.has_returned=0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByBookNumber` (IN `Bnum` VARCHAR(128))  NO SQL
SELECT br.id, br.date_taken, br.date_tobe_returned, member.member_number,
users.firstname, users.lastname, books.title, books.book_number
FROM books_record as br
INNER JOIN member on member.id = br.member_id
INNER JOIN users on users.Id = member.user_id
INNER JOIN books on books.id = br.books_id
WHERE books.book_number=Bnum$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByBookNumberForRe` (IN `Bnum` VARCHAR(128))  NO SQL
SELECT br.id, br.date_taken, br.date_tobe_returned, member.member_number,
users.firstname, users.lastname, books.title, books.book_number
FROM books_record as br
INNER JOIN member on member.id = br.member_id
INNER JOIN users on users.Id = member.user_id
INNER JOIN books on books.id = br.books_id
WHERE books.book_number=Bnum
AND br.has_returned=0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByBookTitle` (IN `title` VARCHAR(128))  NO SQL
SELECT b.title, b.price, b.language,COUNT(*),
catagory.catagoty_name, authors.first_name, authors.last_name
FROM books as b
INNER JOIN book_catagory ON b.id = book_catagory.books_id
INNER JOIN catagory ON book_catagory.catagory_id = catagory.id
INNER JOIN book_author ON b.id = book_author.book_id
INNER JOIN authors ON authors.id = book_author.author_id
WHERE b.title = title
GROUP BY b.title$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByCatagoryName` (IN `catagory` VARCHAR(128))  NO SQL
SELECT b.title, b.price, b.language,COUNT(*),
catagory.catagoty_name, authors.first_name, authors.last_name
FROM books as b
INNER JOIN book_catagory ON b.id = book_catagory.books_id
INNER JOIN catagory ON book_catagory.catagory_id = catagory.id
INNER JOIN book_author ON b.id = book_author.book_id
INNER JOIN authors ON authors.id = book_author.author_id
WHERE catagory.catagoty_name = catagory
GROUP BY b.title$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByEmailForApproved` (IN `mail` VARCHAR(256))  NO SQL
SELECT users.Id, users.UserName, users.Email, users.PhoneNumber, 
member.member_number, member.date_registered, 
member_type.type
FROM users
INNER JOIN member ON member.user_id = users.Id
INNER JOIN member_type ON member.member_type_id = member_type.id
WHERE member.Is_approved = 1
AND MATCH(Email) Against(mail)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByEmailForNotApproved` (IN `mail` VARCHAR(256))  NO SQL
SELECT users.Id, users.UserName, users.Email, users.PhoneNumber, 
member.member_number, member.date_registered, 
member_type.type
FROM users
INNER JOIN member ON member.user_id = users.Id
INNER JOIN member_type ON member.member_type_id = member_type.id
WHERE member.Is_approved = 0
AND MATCH(Email) Against(mail)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByMemberNAme` (IN `Mname` VARCHAR(128))  NO SQL
SELECT br.id, br.date_taken, br.date_tobe_returned, member.member_number,
users.firstname, users.lastname, books.title, books.book_number
FROM books_record as br
INNER JOIN member on member.id = br.member_id
INNER JOIN users on users.Id = member.user_id
INNER JOIN books on books.id = br.books_id
WHERE users.firstname=Mname OR users.lastname=Mname$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByMemberNAmeForRe` (IN `Mname` VARCHAR(128))  NO SQL
SELECT br.id, br.date_taken, br.date_tobe_returned, member.member_number,
users.firstname, users.lastname, books.title, books.book_number
FROM books_record as br
INNER JOIN member on member.id = br.member_id
INNER JOIN users on users.Id = member.user_id
INNER JOIN books on books.id = br.books_id
WHERE (users.firstname=Mname OR users.lastname=Mname)
AND br.has_returned=0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByMemberNo` (IN `Mnum` VARCHAR(128))  NO SQL
SELECT br.id, br.date_taken, br.date_tobe_returned, member.member_number,
users.firstname, users.lastname, books.title, books.book_number
FROM books_record as br
INNER JOIN member on member.id = br.member_id
INNER JOIN users on users.Id = member.user_id
INNER JOIN books on books.id = br.books_id
WHERE member.member_number=Mnum$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByMemberNoForRe` (IN `Mnum` VARCHAR(128))  NO SQL
SELECT br.id, br.date_taken, br.date_tobe_returned, member.member_number,
users.firstname, users.lastname, books.title, books.book_number
FROM books_record as br
INNER JOIN member on member.id = br.member_id
INNER JOIN users on users.Id = member.user_id
INNER JOIN books on books.id = br.books_id
WHERE member.member_number=Mnum$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByMemberNumForApproved` (IN `mNum` VARCHAR(11))  NO SQL
SELECT users.Id, users.UserName, users.Email, users.PhoneNumber, 
member.member_number, member.date_registered, 
member_type.type
FROM member
INNER JOIN users ON member.user_id = users.Id
INNER JOIN member_type ON member.member_type_id = member_type.id
WHERE member.Is_approved = 1
AND member.member_number = mNum$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByMemberNumForNotApproved` (IN `mNum` INT(11))  NO SQL
SELECT users.Id, users.UserName, users.Email, users.PhoneNumber, 
member.member_number, member.date_registered, 
member_type.type
FROM member
INNER JOIN users ON member.user_id = users.Id
INNER JOIN member_type ON member.member_type_id = member_type.id
WHERE member.Is_approved = 0
AND member.member_number = mNum$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByPhoneForApproved` (IN `num` LONGTEXT)  NO SQL
SELECT users.Id, users.UserName, users.Email, users.PhoneNumber, 
member.member_number, member.date_registered, 
member_type.type
FROM users
INNER JOIN member ON member.user_id = users.Id
INNER JOIN member_type ON member.member_type_id = member_type.id
WHERE member.Is_approved = 1
AND MATCH(PhoneNumber) Against(num)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByPhoneForNotApproved` (IN `num` LONGTEXT)  NO SQL
SELECT users.Id, users.UserName, users.Email, users.PhoneNumber, 
member.member_number, member.date_registered, 
member_type.type
FROM users
INNER JOIN member ON member.user_id = users.Id
INNER JOIN member_type ON member.member_type_id = member_type.id
WHERE member.Is_approved = 0
AND MATCH(PhoneNumber) Against(num)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByTitleLanguage` (IN `name` VARCHAR(128))  NO SQL
SELECT b.title, b.price, b.language,COUNT(*),
catagory.catagoty_name, authors.first_name, authors.last_name
FROM books as b
INNER JOIN book_catagory ON b.id = book_catagory.books_id
INNER JOIN catagory ON book_catagory.catagory_id = catagory.id
INNER JOIN book_author ON b.id = book_author.book_id
INNER JOIN authors ON authors.id = book_author.author_id
WHERE MATCH(title,language ) Against(name)
GROUP BY b.title$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByUserNameForApproved` (IN `uName` VARCHAR(256))  NO SQL
SELECT users.Id, users.UserName, users.Email, users.PhoneNumber, 
member.member_number, member.date_registered, 
member_type.type
FROM users
INNER JOIN member ON member.user_id = users.Id
INNER JOIN member_type ON member.member_type_id = member_type.id
WHERE member.Is_approved = 1
AND MATCH(UserName) Against(uName)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchByUserNameForNotApproved` (IN `uName` VARCHAR(256))  NO SQL
SELECT users.Id, users.UserName, users.Email, users.PhoneNumber, 
member.member_number, member.date_registered, 
member_type.type
FROM users
INNER JOIN member ON member.user_id = users.Id
INNER JOIN member_type ON member.member_type_id = member_type.id
WHERE member.Is_approved = 0
AND MATCH(UserName) Against(uName)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBookRecordRe` (IN `brid` INT(11))  NO SQL
UPDATE books_record 
SET books_record.has_returned = 1 
WHERE books_record.id = brid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateFees` (IN `id` INT(11), IN `type` VARCHAR(128), IN `bdt` INT(11))  NO SQL
UPDATE fees SET fees.fee_type = type, fees.amount = bdt
WHERE fees.id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateMemberDetail2ByUid` (IN `uid` VARCHAR(256), IN `mid` INT(11), IN `occ` VARCHAR(128), IN `rdate` DATE, IN `mtype` INT(11))  NO SQL
UPDATE member as m SET m.member_number = mid, m.occupation = occ,
m.date_registered = rDate, m.member_type_id=mType
WHERE m.user_id = uid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateMemberDetailByUid` (IN `uid` VARCHAR(256), IN `fName` VARCHAR(256), IN `lName` VARCHAR(256), IN `FaName` VARCHAR(256), IN `MaName` VARCHAR(256), IN `email` VARCHAR(256), IN `phone` LONGTEXT, IN `sex` VARCHAR(256), IN `cAdd` VARCHAR(256), IN `pAdd` VARCHAR(256), IN `bDate` DATE, IN `education` VARCHAR(256), IN `blood` VARCHAR(256))  NO SQL
Update users as u SET u.firstname = fName, u.lastname = lName,
u.father_name = FaNAme, u.mother_name = MaName, u.Email = email,
u.PhoneNumber = phone, u.sex = sex, u.current_address = cAdd,
u.parmanent_address = pAdd, u.date_of_birth = bDate,
u.education = education, u.blood_group = blood
WHERE u.Id = uid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUserLibrarianByUid` (IN `uid` VARCHAR(128), IN `fName` VARCHAR(256), IN `lName` VARCHAR(256), IN `FaName` VARCHAR(256), IN `MaName` VARCHAR(256), IN `email` VARCHAR(256), IN `phone` LONGTEXT, IN `sex` VARCHAR(256), IN `cAdd` VARCHAR(256), IN `pAdd` VARCHAR(256), IN `bDate` DATE, IN `education` VARCHAR(256), IN `blood` VARCHAR(256))  NO SQL
UPDATE users as u SET u.firstname = fName, u.lastname = lName, u.father_name = FaName, u.mother_name = MaName, u.Email= email,
u.PhoneNumber=phone, u.sex = sex, u.current_address =cAdd, u.parmanent_address =pAdd, u.date_of_birth= bDate,
u.education = education, u.blood_group = blood
WHERE u.id =uid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `first_name`, `last_name`) VALUES
(1, 'asd', 'zxc'),
(4, 'dasd', 'asdasd');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `book_number` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `price` int(11) NOT NULL,
  `language` varchar(128) NOT NULL,
  `edition` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `book_number`, `title`, `price`, `language`, `edition`) VALUES
(7, 'a', 'qwe', 114, 'asda', 'asdasd');

-- --------------------------------------------------------

--
-- Table structure for table `books_record`
--

CREATE TABLE `books_record` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `books_id` int(11) NOT NULL,
  `date_taken` date NOT NULL,
  `date_tobe_returned` date NOT NULL,
  `has_returned` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books_record`
--

INSERT INTO `books_record` (`id`, `member_id`, `books_id`, `date_taken`, `date_tobe_returned`, `has_returned`) VALUES
(1, 1, 7, '2017-03-25', '2017-04-01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `book_author`
--

CREATE TABLE `book_author` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_author`
--

INSERT INTO `book_author` (`id`, `book_id`, `author_id`) VALUES
(3, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `book_catagory`
--

CREATE TABLE `book_catagory` (
  `id` int(11) NOT NULL,
  `books_id` int(11) NOT NULL,
  `catagory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_catagory`
--

INSERT INTO `book_catagory` (`id`, `books_id`, `catagory_id`) VALUES
(3, 7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `catagory`
--

CREATE TABLE `catagory` (
  `id` int(11) NOT NULL,
  `catagoty_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catagory`
--

INSERT INTO `catagory` (`id`, `catagoty_name`) VALUES
(4, 'a'),
(5, 'as'),
(7, 'v');

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` int(11) NOT NULL,
  `day` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `day`) VALUES
(1, 'Friday'),
(2, 'Saturday'),
(3, 'Sunday'),
(4, 'Monday'),
(5, 'Tuesday'),
(6, 'Wednesday'),
(7, 'Thursday');

-- --------------------------------------------------------

--
-- Table structure for table `diposit`
--

CREATE TABLE `diposit` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `diposite_amount` int(11) NOT NULL,
  `diposit_type_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `diposit_type`
--

CREATE TABLE `diposit_type` (
  `id` int(11) NOT NULL,
  `type` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` int(11) NOT NULL,
  `fee_type` varchar(128) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`id`, `fee_type`, `amount`) VALUES
(2, 'asdasd', 25),
(5, 'asdasd', 0);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `user_id` varchar(256) NOT NULL,
  `member_number` varchar(11) DEFAULT NULL,
  `occupation` varchar(128) NOT NULL,
  `Is_approved` tinyint(1) NOT NULL,
  `date_registered` date NOT NULL,
  `member_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `user_id`, `member_number`, `occupation`, `Is_approved`, `date_registered`, `member_type_id`) VALUES
(1, 'f1c7b76f-53f5-4996-a51a-5745ca5fcb3e', '1', 'asdw', 1, '2017-03-02', 1),
(2, '0c4359ef-d084-4c43-a89d-6c2795349d6b', '2', 'asdas45das45d', 1, '2017-03-21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `member_type`
--

CREATE TABLE `member_type` (
  `id` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `safe_money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member_type`
--

INSERT INTO `member_type` (`id`, `type`, `safe_money`) VALUES
(1, 'General', 100),
(2, 'Special', 200);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `Id` varchar(128) NOT NULL,
  `Name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`Id`, `Name`) VALUES
('31d873e6-4a6f-405a-b0c7-83762af5b292', 'Librarian'),
('d48e198f-1489-4f34-bcea-40378e8d29a7', 'Member');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `place_name` varchar(128) NOT NULL,
  `place_address` varchar(256) NOT NULL,
  `arrive_time` time NOT NULL,
  `leave_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `day`, `place_name`, `place_address`, `arrive_time`, `leave_time`) VALUES
(16, 1, 'and', 'asd', '01:00:00', '00:00:00'),
(17, 3, 'fgfdg', 'dfgdfg', '00:51:00', '04:54:00'),
(18, 3, 'fgfdg', 'dfgdfg', '00:51:00', '04:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `userclaims`
--

CREATE TABLE `userclaims` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(128) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userlogins`
--

CREATE TABLE `userlogins` (
  `LoginProvider` varchar(128) NOT NULL,
  `ProviderKey` varchar(128) NOT NULL,
  `UserId` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE `userroles` (
  `UserId` varchar(128) NOT NULL,
  `RoleId` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userroles`
--

INSERT INTO `userroles` (`UserId`, `RoleId`) VALUES
('0c4359ef-d084-4c43-a89d-6c2795349d6b', 'd48e198f-1489-4f34-bcea-40378e8d29a7'),
('435fc308-14ad-4b7c-9c01-9eba47b2ed99', '31d873e6-4a6f-405a-b0c7-83762af5b292'),
('f1c7b76f-53f5-4996-a51a-5745ca5fcb3e', 'd48e198f-1489-4f34-bcea-40378e8d29a7');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` varchar(128) NOT NULL,
  `UserName` varchar(256) NOT NULL,
  `firstname` varchar(256) NOT NULL,
  `lastname` varchar(256) NOT NULL,
  `father_name` varchar(256) NOT NULL,
  `mother_name` varchar(256) NOT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `sex` varchar(256) NOT NULL,
  `current_address` varchar(256) NOT NULL,
  `parmanent_address` varchar(256) NOT NULL,
  `date_of_birth` date NOT NULL,
  `education` varchar(256) NOT NULL,
  `blood_group` varchar(256) NOT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEndDateUtc` datetime DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `UserName`, `firstname`, `lastname`, `father_name`, `mother_name`, `Email`, `sex`, `current_address`, `parmanent_address`, `date_of_birth`, `education`, `blood_group`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEndDateUtc`, `LockoutEnabled`, `AccessFailedCount`) VALUES
('0c4359ef-d084-4c43-a89d-6c2795349d6b', 'asdasd', 'asdasd', 'asdasd', 'asdasd', 'asdasd', 'admin@amdin.com', 'Male', 'asdasd45asd', 'asdasd', '2017-04-05', 'asdasd', 'a+', 0, 'AGkKZCU9uZn6YJEgwR/Q/PywHt6sll+y0dvBQj2d8AASqT1XuJS4eaniobdW9CayHA==', 'ab5b632a-617a-4bf1-8c50-ae5c89a19624', '14544584', 0, 0, '2017-03-21 15:52:32', 0, 0),
('435fc308-14ad-4b7c-9c01-9eba47b2ed99', 'admin', 'anik', 'demo', 'demo', 'demo', 'demo@demo.com', 'Male', 'demo,demo,demo.', 'demo,demo,demo.', '1980-01-02', 'demo', 'demo', 0, 'AMVBV6iF96uX+28buojvOUyoEvJFkswbNc2FzgWi3G3RMasD++U/RnuJUNPxpEtnmw==', '755235f0-f655-446f-a77a-9774c02ce8d2', '123456789', 0, 0, NULL, 1, 0),
('f1c7b76f-53f5-4996-a51a-5745ca5fcb3e', 'asd', 'qe', 'qweas', 'qweasd', 'qda', 'anikpro.exe@gmail.com', 'Female', 'asd', 'asd', '2017-01-01', 'qwdas', 'asd', 0, 'APm8IcL1a8SQ8CsYHaswJahGkd6OtFzZVCc2iUKJ48uoAXSEIJBz87u3wvJgcCHRhw==', '7cfd7153-88a2-4874-b269-d097311b738c', '2542312645456', 0, 0, '2017-03-02 00:18:43', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `authors` ADD FULLTEXT KEY `first_name` (`first_name`);
ALTER TABLE `authors` ADD FULLTEXT KEY `last_name` (`last_name`);
ALTER TABLE `authors` ADD FULLTEXT KEY `first_name_2` (`first_name`);
ALTER TABLE `authors` ADD FULLTEXT KEY `last_name_2` (`last_name`);
ALTER TABLE `authors` ADD FULLTEXT KEY `first_name_3` (`first_name`,`last_name`);
ALTER TABLE `authors` ADD FULLTEXT KEY `first_name_4` (`first_name`,`last_name`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `books` ADD FULLTEXT KEY `title` (`title`);
ALTER TABLE `books` ADD FULLTEXT KEY `language` (`language`);
ALTER TABLE `books` ADD FULLTEXT KEY `language_2` (`language`);
ALTER TABLE `books` ADD FULLTEXT KEY `language_3` (`language`);
ALTER TABLE `books` ADD FULLTEXT KEY `title_2` (`title`,`language`);
ALTER TABLE `books` ADD FULLTEXT KEY `title_3` (`title`,`language`);
ALTER TABLE `books` ADD FULLTEXT KEY `title_4` (`title`,`language`);

--
-- Indexes for table `books_record`
--
ALTER TABLE `books_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `books_id` (`books_id`);

--
-- Indexes for table `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `book_catagory`
--
ALTER TABLE `book_catagory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `books_id` (`books_id`),
  ADD KEY `catagory_id` (`catagory_id`);

--
-- Indexes for table `catagory`
--
ALTER TABLE `catagory`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `catagory` ADD FULLTEXT KEY `catagoty_name` (`catagoty_name`);
ALTER TABLE `catagory` ADD FULLTEXT KEY `catagoty_name_2` (`catagoty_name`);
ALTER TABLE `catagory` ADD FULLTEXT KEY `catagoty_name_3` (`catagoty_name`);
ALTER TABLE `catagory` ADD FULLTEXT KEY `catagoty_name_4` (`catagoty_name`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diposit`
--
ALTER TABLE `diposit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diposit_type_id` (`diposit_type_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `diposit_type`
--
ALTER TABLE `diposit_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `member_type_id` (`member_type_id`);
ALTER TABLE `member` ADD FULLTEXT KEY `member_number` (`member_number`);
ALTER TABLE `member` ADD FULLTEXT KEY `member_number_2` (`member_number`);
ALTER TABLE `member` ADD FULLTEXT KEY `member_number_3` (`member_number`);

--
-- Indexes for table `member_type`
--
ALTER TABLE `member_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `day` (`day`);

--
-- Indexes for table `userclaims`
--
ALTER TABLE `userclaims`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `userlogins`
--
ALTER TABLE `userlogins`
  ADD PRIMARY KEY (`LoginProvider`,`ProviderKey`,`UserId`),
  ADD KEY `ApplicationUser_Logins` (`UserId`);

--
-- Indexes for table `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `IdentityRole_Users` (`RoleId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);
ALTER TABLE `users` ADD FULLTEXT KEY `UserName` (`UserName`);
ALTER TABLE `users` ADD FULLTEXT KEY `UserName_2` (`UserName`);
ALTER TABLE `users` ADD FULLTEXT KEY `UserName_3` (`UserName`);
ALTER TABLE `users` ADD FULLTEXT KEY `UserName_4` (`UserName`);
ALTER TABLE `users` ADD FULLTEXT KEY `Email` (`Email`);
ALTER TABLE `users` ADD FULLTEXT KEY `PhoneNumber` (`PhoneNumber`);
ALTER TABLE `users` ADD FULLTEXT KEY `PhoneNumber_2` (`PhoneNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `books_record`
--
ALTER TABLE `books_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `book_author`
--
ALTER TABLE `book_author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `book_catagory`
--
ALTER TABLE `book_catagory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `catagory`
--
ALTER TABLE `catagory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `diposit`
--
ALTER TABLE `diposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `diposit_type`
--
ALTER TABLE `diposit_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `member_type`
--
ALTER TABLE `member_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `userclaims`
--
ALTER TABLE `userclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `books_record`
--
ALTER TABLE `books_record`
  ADD CONSTRAINT `books_record_ibfk_1` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_record_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book_catagory`
--
ALTER TABLE `book_catagory`
  ADD CONSTRAINT `book_catagory_ibfk_1` FOREIGN KEY (`catagory_id`) REFERENCES `catagory` (`id`),
  ADD CONSTRAINT `book_catagory_ibfk_2` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diposit`
--
ALTER TABLE `diposit`
  ADD CONSTRAINT `diposit_ibfk_2` FOREIGN KEY (`diposit_type_id`) REFERENCES `diposit_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diposit_ibfk_3` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_2` FOREIGN KEY (`member_type_id`) REFERENCES `member_type` (`id`),
  ADD CONSTRAINT `member_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`day`) REFERENCES `days` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userclaims`
--
ALTER TABLE `userclaims`
  ADD CONSTRAINT `ApplicationUser_Claims` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `userlogins`
--
ALTER TABLE `userlogins`
  ADD CONSTRAINT `ApplicationUser_Logins` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `userroles`
--
ALTER TABLE `userroles`
  ADD CONSTRAINT `ApplicationUser_Roles` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `IdentityRole_Users` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
