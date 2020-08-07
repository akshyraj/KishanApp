-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2020 at 01:57 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kishan_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `Id` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `description` varchar(300) NOT NULL,
  `image` varchar(20) DEFAULT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`Id`, `questionID`, `userID`, `description`, `image`, `time`, `date`) VALUES
(1, 1, 5, 'Leaf Rust', '', '00:00:00', '2020-02-02'),
(2, 1, 7, 'Leaf Rust', '', '00:00:00', '2020-02-02'),
(3, 1, 2, 'Black Chaff', '', '00:00:00', '2020-02-02'),
(4, 2, 1, 'Acid Mix 4-3-6', 'AcidMix.jpg', '00:00:00', '2020-02-02'),
(5, 2, 3, 'Organic Potato Fertilizer', 'OPF.png', '00:00:00', '2020-02-02'),
(6, 3, 9, 'Rice,Wheat,Maize', 'imgs1.jpg', '00:00:00', '2020-02-02'),
(7, 3, 2, 'Peanut,Wheat,Rice', 'imgs2.jpg', '00:00:00', '2020-02-02'),
(8, 4, 12, 'Water compusption of rice for 1 kg = 2,497 litres', '', '00:00:00', '2020-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `bankID` int(11) NOT NULL,
  `bankName` varchar(60) NOT NULL,
  `bankSector` varchar(30) NOT NULL,
  `bankPhone` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank_details`
--

INSERT INTO `bank_details` (`bankID`, `bankName`, `bankSector`, `bankPhone`) VALUES
(1, 'Saurashtra Gramin Bank', 'Agriculture Co-oprative', 8321048392),
(2, 'SBI', 'Public Sector', 7463829405),
(3, 'ICICI Bank', 'Private Sector', 8907483910),
(4, 'HDFC Bank', 'Private Sector', 8084361721),
(5, 'Punjab National Bank', 'Private Sector', 9076438402),
(6, 'Allahbad Bank', 'Private Sector', 8304836109),
(7, 'Axis Bank', 'Private Sector', 9086479014),
(8, 'Orient Bank Of Commerce', 'Private Sector', 2782445566),
(9, 'Union Bank Of India', 'Private Sector', 7572998951);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `catparID` int(11) NOT NULL,
  `catName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `catparID`, `catName`) VALUES
(1, 0, 'Product'),
(2, 0, 'Loan'),
(3, 0, 'News'),
(4, 0, 'User'),
(5, 1, 'Urea Fertilizer'),
(6, 1, 'Pestisides'),
(7, 1, 'Natural Fertilizer'),
(8, 1, 'Seeds'),
(9, 1, 'Liquid Fertilizer'),
(10, 2, 'Loan on Land'),
(11, 2, 'Equipment Loan'),
(12, 2, 'Tractor Loan'),
(13, 2, 'Loan For Farming'),
(14, 3, 'Government Scheme Ne'),
(15, 3, 'Crop Selling News'),
(16, 3, 'Farmer Help'),
(17, 3, 'Weather'),
(18, 3, 'Political'),
(19, 3, 'Farmer Issues'),
(20, 4, 'Farmer'),
(21, 4, 'Merchant'),
(22, 4, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `company_name`
--

CREATE TABLE `company_name` (
  `companyID` int(11) NOT NULL,
  `companyName` varchar(100) NOT NULL,
  `companyDesc` varchar(200) NOT NULL,
  `contactNo` bigint(10) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_name`
--

INSERT INTO `company_name` (`companyID`, `companyName`, `companyDesc`, `contactNo`, `address`) VALUES
(1, 'Deluxe pest Control ', 'All peststisides', 9825727751, 'Sadar Kunj Road, near MB Patel science College, Anand'),
(2, 'Syngenta India', 'Leadig brands in crop products In india', 2030699200, '110/11/3, Amar Paradigm Banner Road, Pune'),
(3, 'Annexe Chem', 'Chemical Manufacturer', 8906543290, 'E-91-92, Nutan Saurah Society, Behind vijay nagar, Vadodra'),
(4, 'Eagle Chem', 'Chemical Manufacturer', 2602430597, 'Vapi Industrial Esatate, Plot no-29, GIDC Pardi, Vapi'),
(5, 'Avani seeds ltd', 'Seeds Manufacturer', 7926923216, '307 Dev Arc Complex, Iscon cross Road, Sarkhej, Gandhinagar'),
(6, 'Guajarat state fertilizers and chemical ltd', 'All types of fertilizers', 2652242451, 'P.O. FertilizeNagar-391750, Vadodra'),
(7, 'Gujarat Pesticides Company', 'Company for all types of the crop products', 1686262575, '118, Old Grain Market, Safidon, 126112'),
(8, 'Redox Industries Limited', 'Supply organic fertilizers for crops and vegetables', 8023568927, 'Makarba, Ahemdabad'),
(9, 'Gujarat seeds Company', 'Have all types of seeds', 8046035859, 'Plot No. 3 B/P/1, gate No 4, Anand'),
(10, 'Vinayak seeds Corporation Ltd', 'Have all types of seeds', 9012758401, 'Lal Darwaja, Ahemdabad');

-- --------------------------------------------------------

--
-- Table structure for table `crop_details`
--

CREATE TABLE `crop_details` (
  `id` int(11) NOT NULL,
  `cropName` varchar(15) NOT NULL,
  `cropImage` varchar(15) NOT NULL,
  `time` varchar(15) NOT NULL,
  `season` varchar(40) NOT NULL,
  `soil` varchar(40) NOT NULL,
  `irrigation` varchar(40) NOT NULL,
  `fertilizer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crop_details`
--

INSERT INTO `crop_details` (`id`, `cropName`, `cropImage`, `time`, `season`, `soil`, `irrigation`, `fertilizer`) VALUES
(1, 'wheat', 'image.jpg', '10 months', 'summer and winter', 'clay loam or loam texture', '40 cm depth of water', 'Muriate of potash and potassium sulphate'),
(2, 'rice', 'image.jpg', '3.5 months', 'majority winter + summer', 'silts, loams, gravels', '5 cm depth of water', 'Nitrogenous fertilizer'),
(3, 'cotton', 'image.jpg', '8 months', 'monsoon', 'sandy loam', '50 mm of water', 'no'),
(4, 'sugarcane', 'image.jpg', '18 months', 'autumn, spring, adsali', 'sandy loam, clay loam', '200 cm + 75 cm rain', 'no'),
(5, 'jute', 'image.jpg', '5 months', 'rainy', 'river basins, loamy', '50 cm water', 'Ammonium Sulphate'),
(6, 'Potato', 'image.jpg', '4 months', 'autumn', 'saline and alkaline soils', '500-700 mm', 'NPK'),
(7, 'Millet', 'image.jpg', '3 months', 'Mid June', 'loamy', 'hardly or not', 'no'),
(8, 'Castor', 'image.jpg', '6 months', 'Kharif', 'moderately fertile, with slightly acidic', '500-700 mm', 'Nitrogenous fertilizer');

-- --------------------------------------------------------

--
-- Table structure for table `govt_scheme`
--

CREATE TABLE `govt_scheme` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `summary` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `launch date` date NOT NULL,
  `government` varchar(30) NOT NULL,
  `image` varchar(20) NOT NULL,
  `link to original website` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `govt_scheme`
--

INSERT INTO `govt_scheme` (`id`, `title`, `summary`, `description`, `launch date`, `government`, `image`, `link to original website`) VALUES
(1, 'E-NAM', 'Short Desc', 'Large Desc', '2019-02-15', 'Central', 'image.jpg', 'https://agricoop.gov.in'),
(2, 'PMKSY', 'Short Desc', 'Large Desc', '2019-02-15', 'Central', 'image.jpg', 'https://agricoop.gov.in'),
(3, 'PKVY', 'Short Desc', 'Large Desc', '2019-02-15', 'Central', 'image.jpg', 'https://agricoop.gov.in'),
(4, 'PMFBY', 'Short Desc', 'Large Desc', '2019-02-15', 'Central', 'image.jpg', 'https://agricoop.gov.in'),
(5, 'Gramin Bhandaran Yojana', 'Short Desc', 'Large Desc', '2019-02-15', 'Central', 'image.jpg', 'https://agricoop.gov.in'),
(6, 'Bio Gas Subsidy', 'Short Desc', 'Large Desc', '2019-02-15', 'State - Gujarat', 'image.jpg', 'https://agri.gujarat.gov.in'),
(7, 'Rajya Krushi Yantrikaran Yojan', 'Short Desc', 'Large Desc', '2019-02-15', 'State - Maharastra', 'image.jpg', 'https://mahadbtmahait.gov.in'),
(8, 'Jay Kishan Fasal Rin Maafi Yoj', 'Short Desc', 'Large Desc', '2019-02-15', 'State - Madhya Pradesh', 'image.jpg', 'https://mpkrishi.mp.gov.in');

-- --------------------------------------------------------

--
-- Table structure for table `loan_details`
--

CREATE TABLE `loan_details` (
  `loanID` int(11) NOT NULL,
  `bankID` int(11) NOT NULL,
  `loanCategoty` int(11) NOT NULL,
  `loanIntrest` int(11) NOT NULL,
  `loanTimePeriod` int(11) NOT NULL,
  `loanMinAmount` int(11) NOT NULL,
  `loanMaximumAmount` int(11) NOT NULL,
  `loanStartingDate` date NOT NULL,
  `lastDateLoan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loan_details`
--

INSERT INTO `loan_details` (`loanID`, `bankID`, `loanCategoty`, `loanIntrest`, `loanTimePeriod`, `loanMinAmount`, `loanMaximumAmount`, `loanStartingDate`, `lastDateLoan`) VALUES
(1, 1, 6, 5, 1, 300000, 1000000, '2020-03-02', '2020-05-05'),
(2, 1, 7, 7, 3, 50000, 500000, '2020-03-02', '2020-05-05'),
(3, 2, 9, 7, 3, 50000, 500000, '2020-03-02', '2020-05-05'),
(4, 2, 8, 8, 2, 50000, 2000000, '2020-03-02', '2020-05-05'),
(5, 3, 9, 7, 3, 10000, 1000000, '2020-03-02', '2020-05-05'),
(6, 3, 7, 7, 3, 100000, 2000000, '2020-03-02', '2020-05-05'),
(7, 3, 7, 8, 4, 110000, 20000000, '2020-03-02', '2020-05-05'),
(8, 1, 8, 9, 3, 40000, 500000, '2020-03-02', '2020-05-05'),
(9, 2, 9, 7, 2, 50000, 1000000, '2020-03-02', '2020-05-05'),
(10, 1, 6, 5, 1, 300000, 5000000, '2020-03-02', '2020-05-05'),
(11, 2, 6, 7, 5, 233300, 4000000, '2020-03-02', '2020-05-05'),
(12, 4, 9, 9, 3, 100000, 20000000, '2020-03-02', '2020-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `newsID` int(11) NOT NULL,
  `newsCategotyID` int(11) NOT NULL,
  `newsTitle` varchar(300) NOT NULL,
  `newsShortDescription` varchar(300) NOT NULL,
  `newsFullContent` varchar(2000) NOT NULL,
  `newsImages` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `newsAuthor` varchar(20) NOT NULL,
  `newsDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`newsID`, `newsCategotyID`, `newsTitle`, `newsShortDescription`, `newsFullContent`, `newsImages`, `newsAuthor`, `newsDate`) VALUES
(1, 10, 'PMKSY', 'It is Pradhan Mantri Khedut Samman Yojana', 'In this scheme the government gives the Rs. 6000 in a year to the Farmer', 'image.png', 'ABC', '0000-00-00'),
(2, 13, 'Rain seson Date', 'Rain season starting in Gujarat', 'Rain season start in gujarat by the 15 June 2020', 'image.png', 'xyz', '0000-00-00'),
(3, 12, 'Rs. 3,795 Crore-Package For Farmers Hit By Heavy Rain In Gujarat', 'Rs. 3,795 Crore-Package For Farmers Hit By Heavy Rain In Gujarat', 'The Gujarat government on Saturday announced a financial package of Rs. 3,795 crore for farmers whose crop was damaged by rains during the 36-day period in the months of October and November. The package will cover over 56 lakh farmers.', 'image.png', 'xyz', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `address1` varchar(50) NOT NULL,
  `address2` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `district` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip` int(6) NOT NULL,
  `phoneNo` bigint(11) NOT NULL,
  `date` date NOT NULL,
  `trackingID` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `userID`, `address1`, `address2`, `city`, `district`, `state`, `zip`, `phoneNo`, `date`, `trackingID`) VALUES
(1, 1, 'Rajkot', 'Rajkot', 'Rajkot', 'Rajkot', 'Gujarat', 360001, 8790876432, '2020-08-05', 182940530),
(2, 1, 'Rajkot', 'Rajkot', 'Rajkot', 'Rajkot', 'Gujarat', 360001, 8790876432, '2020-08-05', 182940531),
(3, 3, 'Ahemdabad', 'Ahemdabad', 'Ahemdabad', 'Ahemdabad', 'Gujarat', 320008, 9807453670, '2020-08-05', 182940532),
(4, 5, 'Vadodra', 'Vadodra', 'Vadodra', 'Vadodra', 'Gujarat', 672003, 8965445609, '2020-08-05', 182940533),
(5, 4, 'Rajkot', 'Rajkot', 'Rajkot', 'Rajkot', 'Gujarat', 360003, 8097512356, '2020-08-05', 182940534),
(6, 7, 'Kuchh', 'Kuchh', 'Kuchh', 'Kuchh', 'Gujarat', 510002, 9900897622, '2020-08-05', 182940535),
(7, 9, 'Junagadh', 'Junagadh', 'Junagadh', 'Junagadh', 'Gujarat', 457004, 7890372810, '2020-08-05', 182940536),
(8, 10, 'Jamnagar', 'Jamnagar', 'Jamnagar', 'Jamnagar', 'Gujarat', 391004, 6744440098, '2020-08-05', 182940537),
(9, 11, 'Patan', 'Patan', 'Patan', 'Patan', 'Gujarat', 264098, 6901947532, '2020-08-05', 182940538),
(10, 3, 'Ahemdabad', 'Ahemdabad', 'Ahemdabad', 'Ahemdabad', 'Gujarat', 320008, 9807453670, '2020-08-05', 182940539),
(11, 6, 'Morbi', 'Morbi', 'Morbi', 'Morbi', 'Gujarat', 690853, 9653690643, '2020-08-05', 182940540),
(12, 8, 'Junagadh', 'Junagadh', 'Junagadh', 'Junagadh', 'Gujarat', 457090, 8901473850, '2020-08-05', 182940541),
(13, 4, 'Rajkot', 'Rajkot', 'Rajkot', 'Rajkot', 'Gujarat', 360003, 8097512356, '2020-08-05', 182940542),
(14, 2, 'Surat', 'Surat', 'Surat', 'Surat', 'Gujarat', 691757, 6789543890, '2020-08-05', 182940543);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `Id` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`Id`, `productID`, `orderID`, `quantity`, `price`) VALUES
(1, 2, 1, 2, 8000),
(2, 3, 2, 4, 900),
(3, 4, 3, 3, 877),
(4, 5, 4, 3, 6578),
(5, 5, 5, 5, 345),
(6, 1, 6, 6, 445),
(7, 9, 7, 4, 432),
(8, 11, 8, 3, 876),
(9, 10, 9, 8, 990),
(10, 5, 10, 7, 675),
(11, 4, 11, 8, 1222),
(12, 7, 12, 8, 1245),
(13, 8, 13, 7, 1455),
(14, 5, 14, 7, 1335);

-- --------------------------------------------------------

--
-- Table structure for table `products_master`
--

CREATE TABLE `products_master` (
  `productID` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productShortDesc` varchar(200) NOT NULL,
  `productDesc` varchar(500) NOT NULL,
  `productCategoryID` int(11) NOT NULL,
  `companyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_master`
--

INSERT INTO `products_master` (`productID`, `productName`, `productShortDesc`, `productDesc`, `productCategoryID`, `companyID`) VALUES
(1, 'Ampligo Insecticide', 'Ampligo 150 ZC', 'It is encapsulated in tiny ZENO capsules, Acts fater and quick results are available', 6, 2),
(2, 'Bayer Agenda', 'Deluxe pest control - Bayer Agenda 500 ml', 'Non-repellent termiticide, hence termites cannot recognize  the gaps present in the chemical barrier', 6, 1),
(3, 'Annexr Chem urea', 'Annexr Chem urea', 'Annexr Chem urea', 5, 3),
(4, 'Eagle Powder Organic Fertilizer', 'Eagle Powder Organic Fertilizer', 'Eagle Powder Organic Fertilizer', 7, 4),
(5, 'Avni 522 Wheat Seeds', 'Seeds for Wheat', 'Seeds for Wheat', 8, 5),
(6, 'Atom Bomb', 'It is widely used in cotton, paddy, careals, vegetables and food crops to kill pest', 'It is widely used in cotton, paddy, careals, vegetables and food crops to kill pest', 6, 7),
(7, 'Neem Urea', 'Useful for variety of crops', 'Useful for variety of crops', 5, 6),
(8, 'Redox Remino gold organic fertilizer', 'Agriculture fertilizers for all crops', 'Agriculture fertilizers for all crops', 7, 8),
(9, 'Milan 51 Guar seeds', 'Researched hybrid seeds', 'Researched hybrid seeds', 8, 9),
(10, 'Radish Seeds', 'Researched hybrid seeds', 'Researched hybrid seeds', 8, 9),
(11, 'Avani 11+', 'Resistance to wilt and root rot', 'Resistance to wilt and root rot', 8, 5),
(12, 'Vinayak organic cotton seeds', 'Cotton seeds', 'Cotton seeds', 8, 10);

-- --------------------------------------------------------

--
-- Table structure for table `product_purchase_table`
--

CREATE TABLE `product_purchase_table` (
  `id` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `noOfStocks` int(11) NOT NULL,
  `purchaseDate` date NOT NULL,
  `companyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_purchase_table`
--

INSERT INTO `product_purchase_table` (`id`, `productID`, `noOfStocks`, `purchaseDate`, `companyID`) VALUES
(1, 1, 23, '2020-07-06', 2),
(2, 2, 43, '2020-07-06', 1),
(3, 3, 41, '2020-07-06', 3),
(4, 4, 45, '2020-07-06', 4),
(5, 5, 65, '2020-07-06', 5),
(6, 6, 23, '2020-07-06', 7),
(7, 7, 90, '2020-07-06', 6),
(8, 8, 89, '2020-07-06', 8),
(9, 9, 10, '2020-07-06', 9),
(10, 10, 23, '2020-07-06', 9),
(11, 11, 43, '2020-07-06', 5),
(12, 12, 55, '2020-07-06', 10);

-- --------------------------------------------------------

--
-- Table structure for table `solution`
--

CREATE TABLE `solution` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `images` varchar(20) DEFAULT NULL,
  `question` varchar(200) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `solution`
--

INSERT INTO `solution` (`id`, `userID`, `images`, `question`, `time`, `date`) VALUES
(1, 1, 'img1.jpg', 'What disease in my crop?', '00:00:00', '2019-12-12'),
(2, 2, 'img2.jpg', 'What is best fertilizer for potato?', '00:00:00', '2019-12-12'),
(3, 5, 'img3.png', 'what most profitable crop in Gujarat?', '00:00:00', '2019-12-12'),
(4, 3, 'img4.png', 'How many times we need to give water for Rice?', '00:00:00', '2019-12-12'),
(5, 9, '', 'Which crop combination is best ?', '00:00:00', '2019-12-12'),
(6, 8, '', 'After taking 2 times cotton which crop is take ?', '00:00:00', '2019-12-12'),
(7, 6, '', 'Best soil for wheat', '00:00:00', '2019-12-12'),
(8, 7, 'img.png', 'Pesticide for this crop desease ?', '00:00:00', '2019-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `userEmail` varchar(30) NOT NULL,
  `userPassword` varchar(20) NOT NULL,
  `userFirstName` varchar(15) NOT NULL,
  `userLastName` varchar(15) NOT NULL,
  `userAddress` varchar(200) NOT NULL,
  `userState` varchar(15) NOT NULL,
  `userPhone` bigint(10) NOT NULL,
  `userRegistrationDate` date NOT NULL,
  `userCatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `userEmail`, `userPassword`, `userFirstName`, `userLastName`, `userAddress`, `userState`, `userPhone`, `userRegistrationDate`, `userCatID`) VALUES
(1, 'manish@gmail.com', 'manish', 'Manish', 'Shah', 'Rajkot', 'Gujarat', 8790876432, '2020-02-02', 20),
(2, 'ajay@gmail.com', 'ajay', 'Ajay', 'Verma', 'Surat', 'Gujarat', 6789543890, '2020-02-02', 20),
(3, 'ankita@gmail.com', 'ankita', 'Ankita ', 'Parmar', 'Ahemdabad', 'Gujarat', 9807453670, '2020-02-02', 20),
(4, 'vijay@gmail.com', 'vijay', 'Vijay', 'Yadav', 'Rajkot', 'Gujarat', 8097512356, '2020-02-02', 21),
(5, 'rakesh@gmail.com', 'rakesh', 'rakesh', 'Pansuriya', 'Vadodra', 'Gujarat', 8965445609, '2020-02-02', 22),
(6, 'hasmukh@gmail.com', 'hasmukh', 'hasmukh', 'Kumar', 'Morbi', 'Gujarat', 9653690643, '2020-02-02', 22),
(7, 'hari@gmail.com', 'hari', 'hari', 'Makwana', 'Kuchh', 'Gujarat', 9900897622, '2020-02-02', 21),
(8, 'dev@gmail.com', 'dev', 'dev', 'Vaghela', 'Junagadh', 'Gujarat', 8901473850, '2020-02-02', 21),
(9, 'gopal@gmail.com', 'gopal', 'gopal', 'Ghetia', 'Junagadh', 'Gujarat', 7890372810, '2020-02-02', 20),
(10, 'chandres@gmail.com', 'chandres', 'chandres', 'Chavda', 'Jamnagar', 'Gujarat', 6744440098, '2020-02-02', 21),
(11, 'chandan@gmail.com', 'chandan', 'chandan', 'Prabhakar', 'Patan', 'Gujarat', 6901947532, '2020-02-02', 20),
(12, 'bharat@gmail.com', 'bharat', 'bharat', 'Shah', 'Dang', 'Gujarat', 6647393908, '2020-02-02', 20),
(13, 'vinay@gmail.com', 'vinay', 'vinay', 'Yadav', 'Surat', 'Gujarat', 8903737373, '2020-02-02', 21);

-- --------------------------------------------------------

--
-- Table structure for table `yard`
--

CREATE TABLE `yard` (
  `yardID` int(11) NOT NULL,
  `yardName` varchar(100) NOT NULL,
  `yardAdress` varchar(200) NOT NULL,
  `yardTaluka` varchar(15) NOT NULL,
  `yardDistrict` varchar(15) NOT NULL,
  `yardState` varchar(15) NOT NULL,
  `yardPhone` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `yard`
--

INSERT INTO `yard` (`yardID`, `yardName`, `yardAdress`, `yardTaluka`, `yardDistrict`, `yardState`, `yardPhone`) VALUES
(1, 'Sardar Vallabhbhai patel Old Market Yard', 'Rajkot', 'Rajkot', 'Rajkot', 'Gujarat', 8907483910),
(2, 'APMC Market Yard', 'Rajkot', 'Rajkot', 'Rajkot', 'Gujarat', 8084361721),
(3, 'Marketing Yard', 'Gondal', 'Gondal', 'Rajkot', 'Gujarat', 9076438402),
(4, 'APMC Vadodra', 'vadodra', 'vadodra', 'vadodra', 'Gujarat', 8304836109),
(5, 'APMC Unja', 'unja', 'unja', 'Mehsana', 'Gujarat', 9086479014),
(6, 'APMC Market Yard ', 'Bhavnagar', 'Bhavnagar', 'Bhavnagar', 'Gujarat', 2782445566),
(7, 'Chitra Vegetable Market Yard', 'Bhavnagar', 'Bhavnagar', 'Bhavnagar', 'Gujarat', 7572998951),
(8, 'Morbi Marketing Yard', 'Morbi', 'Morbi ', 'Morbi', 'Gujarat', 2822230240),
(9, 'Palanpur Marketing Yard', 'Palanpur ', 'Palanpur ', 'Palanpur ', 'Gujarat', 7698769069),
(10, 'APMC Deesa', 'Deesa', 'Patan', 'Patan', 'Gujarat', 2744223067);

-- --------------------------------------------------------

--
-- Table structure for table `yard_appoinment`
--

CREATE TABLE `yard_appoinment` (
  `userID` int(11) NOT NULL,
  `yardID` int(11) NOT NULL,
  `cropID` int(11) NOT NULL,
  `cropQuantity` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `yard_appoinment`
--

INSERT INTO `yard_appoinment` (`userID`, `yardID`, `cropID`, `cropQuantity`, `date`) VALUES
(1, 3, 2, 900, '2020-08-05'),
(2, 2, 12, 708, '2020-08-05'),
(3, 4, 10, 688, '2020-08-05'),
(4, 7, 5, 564, '2020-08-05'),
(5, 6, 4, 876, '2020-08-05'),
(6, 6, 4, 443, '2020-08-05'),
(7, 8, 6, 1234, '2020-08-05'),
(8, 8, 7, 896, '2020-08-05'),
(9, 9, 3, 567, '2020-08-05'),
(10, 1, 4, 2930, '2020-08-05'),
(11, 3, 7, 584, '2020-08-05'),
(12, 2, 1, 908, '2020-08-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`bankID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `company_name`
--
ALTER TABLE `company_name`
  ADD PRIMARY KEY (`companyID`);

--
-- Indexes for table `crop_details`
--
ALTER TABLE `crop_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `govt_scheme`
--
ALTER TABLE `govt_scheme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_details`
--
ALTER TABLE `loan_details`
  ADD PRIMARY KEY (`loanID`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`newsID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `products_master`
--
ALTER TABLE `products_master`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `product_purchase_table`
--
ALTER TABLE `product_purchase_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `solution`
--
ALTER TABLE `solution`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `yard`
--
ALTER TABLE `yard`
  ADD PRIMARY KEY (`yardID`);

--
-- Indexes for table `yard_appoinment`
--
ALTER TABLE `yard_appoinment`
  ADD PRIMARY KEY (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
