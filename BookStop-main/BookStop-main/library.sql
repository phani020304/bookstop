SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'Abhiram Gullapalli', 'abhiram@gmail.com', 'Abhiram', 'e570ccd40b7344669e44f764c7258b98', current_timestamp),
(2, 'Kautham Medaimani', 'kautham@gmail.com', 'Kautham', 'b2c2633e27f7b5ba8420030ba7b6d50c', current_timestamp);

CREATE TABLE `tblauthors` (
  `id` int(11) NOT NULL,
  `AuthorName` varchar(159) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tblauthors` (`id`, `AuthorName`, `creationDate`, `UpdationDate`) VALUES
(1, 'J. K. Rowling', '14-4-2023 21:45:00', current_timestamp);

CREATE TABLE `tblbooks` (
  `id` int(11) NOT NULL,
  `BookName` varchar(255) DEFAULT NULL,
  `CatId` int(11) DEFAULT NULL,
  `AuthorId` int(11) DEFAULT NULL,
  `ISBNNumber` varchar(25) DEFAULT NULL,
  `BookPrice` decimal(10,2) DEFAULT NULL,
  `bookImage` varchar(250) NOT NULL,
  `isIssued` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tblbooks` (`id`, `BookName`, `CatId`, `AuthorId`, `ISBNNumber`, `BookPrice`, `bookImage`, `isIssued`, `RegDate`, `UpdationDate`) VALUES
(1, 'Harry Potter: Chamber Of Secrets', 9, 1, '2', '20.00', 'HP_ChamberOfSecrets.jpg', 0, current_timestamp, current_timestamp),
(3, 'Harry Potter: Deathly Hallows', 9, 1, '7', '20.00', 'HP_DeathlyHallows1.jpg', 0, '14-4-2023 07:23:03', '14-4-2023 16:24:17'),
(5, 'Harry Potter: Goblet Of Fire', 9, 1, '4', '20.00', 'HP_GobletOfFire.jpg', 1, '2022-01-21 16:42:11', '14-4-2023 06:11:03'),
(6, 'Harry Potter: Half Blood Prince', 9, 1, '6', '20.00', 'HP_HalfBloodPrince.jpg', NULL, '14-4-2023 07:16:07', '14-4-2023 07:20:49'),
(7, 'Harry Potter: Order Of Pheonix', 9, 1, '5', '20.00', 'HP_OrderOfPheonix.jpg', 0, '14-4-2023 07:18:03', '14-4-2023 07:20:58'),
(8, 'Harry Potter: Prisoner Of Azkaban', 9, 1, '3', '20.00', 'HP_PrisonerOfAzkaban.jpg', 1, '14-4-2023 07:20:39', NULL),
(9, 'Harry Potter: Sorcerer Stone', 9, 1, '1', '20.00', 'HP_SorcererStone.jpg', 0, '14-4-2023 07:22:33', NULL);

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Status`, `CreationDate`, `UpdationDate`) VALUES
(4, 'Romantic', 1, '14-4-2023 07:23:03', '14-4-2023 07:23:03'),
(5, 'Technology', 1, '14-4-2023 07:23:03', '14-4-2023 07:23:03'),
(6, 'Science', 1, '14-4-2023 07:23:03', '14-4-2023 16:24:37'),
(7, 'Management', 1, '14-4-2023 07:23:03', '14-4-2023 16:24:35'),
(8, 'General', 1, '14-4-2023 07:23:03', '14-4-2023 16:24:40'),
(9, 'Fiction', 1, '14-4-2023 07:23:03', '14-4-2023 16:24:42');


CREATE TABLE `tblissuedbookdetails` (
  `id` int(11) NOT NULL,
  `BookId` int(11) DEFAULT NULL,
  `StudentID` varchar(150) DEFAULT NULL,
  `IssuesDate` timestamp NULL DEFAULT current_timestamp(),
  `ReturnDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `RetrunStatus` int(1) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tblissuedbookdetails` (`id`, `BookId`, `StudentID`, `IssuesDate`, `ReturnDate`, `RetrunStatus`, `fine`) VALUES
(7, 5, '210905001', '14-4-2023 05:45:57', NULL, NULL, NULL),
(8, 1, '210905002', '14-4-2023 05:59:17', '14-4-2023 06:18:08', 1, 0),
(9, 3, '210905003', '14-4-2023 07:38:09', '14-4-2023 07:38:54', 1, 0),
(10, 7, '210905004', '14-4-2023 08:15:02', '14-4-2023 08:15:23', 1, 0),
(11, 8, '210905005', '14-4-2023 08:17:15', NULL, NULL, NULL),
(12, 9, '210905006', '14-4-2023 08:18:08', '14-4-2023 08:18:22', 1, 5);

CREATE TABLE `tblstudents` (
  `id` int(11) NOT NULL,
  `StudentId` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `StudentId` (`StudentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tblstudents` (`id`, `StudentId`, `FullName`, `EmailId`, `MobileNumber`, `Password`, `Status`, `RegDate`, `UpdationDate`) VALUES
(1, '210905123', 'Pavan Thumu', 'pavan.thumu@learner.manipal.edu', '987654321', 'fc66fc790911eaf9d3a09df5d2908411', 1, '14-4-2023 07:23:03', '14-4-2023 16:25:45');

ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `tblauthors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

ALTER TABLE `tblbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `tblissuedbookdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `tblstudents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;
