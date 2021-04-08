-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2021 at 01:36 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `reciver_id` int(11) NOT NULL,
  `gst_rate` int(11) NOT NULL,
  `item_name` varchar(75) NOT NULL,
  `item_price` float NOT NULL,
  `item_qty` int(11) NOT NULL,
  `total` bigint(30) NOT NULL,
  `freight charges` float NOT NULL,
  `invoice_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `invoice_no`, `reciver_id`, `gst_rate`, `item_name`, `item_price`, `item_qty`, `total`, `freight charges`, `invoice_date`) VALUES
(11, 4, 1, 18, '2', 100, 10, 1000, 150, '2021-02-23'),
(12, 5, 3, 17, '1', 40, 70, 2800, 0, '2023-01-01'),
(13, 6, 2, 18, '2', 100, 2515, 251500, 0, '2021-01-01'),
(14, 7, 2, 18, '2', 3200, 100, 320000, 500, '2021-04-08'),
(15, 7, 2, 18, '3', 3300, 120, 396000, 500, '2021-04-08');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `brand_name` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brand_name`) VALUES
(1, 'TULIP'),
(2, 'JLOIE'),
(3, 'BIG ELEPHANT');

-- --------------------------------------------------------

--
-- Table structure for table `chalan`
--

CREATE TABLE `chalan` (
  `id` int(11) NOT NULL,
  `qty` varchar(100) NOT NULL,
  `short_desc` varchar(100) NOT NULL,
  `packet_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chalan`
--

INSERT INTO `chalan` (`id`, `qty`, `short_desc`, `packet_desc`) VALUES
(1, '8 Gm', 'Ultra Marine Blue Packed in Pouch As Per Your Requirement  ', '50 * 20 = 1000 Pouches in one Master Cart'),
(2, '5 Kg', 'Ultra Marine Blue Packed in 5Kg Bag As Per Your Requirement  ', '5Kg * 5Kg= 25Kg  per Bag'),
(3, '30 Gm', 'Ultra Marine Blue Packed in Pouch As Per Your Requirement  ', '288 Pouches in one Master Carton');

-- --------------------------------------------------------

--
-- Table structure for table `chalan_bill`
--

CREATE TABLE `chalan_bill` (
  `id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `chalan_id` int(11) NOT NULL,
  `tr` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `transport_charge` varchar(50) NOT NULL,
  `other_charge` varchar(20) NOT NULL,
  `total` int(11) NOT NULL,
  `container_no` varchar(100) NOT NULL,
  `empty_brand_id` int(11) NOT NULL,
  `empty_brand_qty` int(11) NOT NULL,
  `chalan_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chalan_bill`
--

INSERT INTO `chalan_bill` (`id`, `invoice_no`, `brand_id`, `chalan_id`, `tr`, `quantity`, `price`, `transport_charge`, `other_charge`, `total`, `container_no`, `empty_brand_id`, `empty_brand_qty`, `chalan_date`) VALUES
(1, 1, 1, 1, '1', 1, 12, '1', '1', 1, '', 0, 0, '2021-03-18'),
(2, 2, 1, 1, '1144/KMPL', 25, 40, '1000', '500', 1000, '', 0, 0, '2021-03-19'),
(3, 2, 3, 2, '1144/KMPL', 45, 20, '1000', '500', 900, '', 0, 0, '2021-03-19'),
(4, 3, 1, 1, '1145/KMPL', 10, 10, '1000', '500', 100, '', 0, 0, '2021-02-01'),
(5, 3, 1, 3, '1145/KMPL', 22, 21, '1000', '500', 462, '', 0, 0, '2021-02-01'),
(6, 4, 1, 2, '1144/KMPL', 25, 40, '0', '12', 1000, 'SUDU7941086', 0, 0, '2021-02-01'),
(7, 4, 2, 1, '1144/KMPL', 22, 5, '0', '12', 110, 'SUDU7941086', 0, 0, '2021-02-01'),
(8, 5, 3, 1, '1144/KMPL', 36, 36, '24', '24', 1296, '404024', 3, 50, '2021-03-18'),
(9, 5, 1, 2, '1144/KMPL', 38, 38, '24', '24', 1444, '404024', 3, 50, '2021-03-18'),
(11, 6, 2, 2, 'a', 11, 25, '11', '11', 275, '25', 2, 20, '2021-02-01'),
(12, 6, 3, 3, 'a', 66, 450, '11', '11', 29700, '25', 2, 20, '2021-02-01'),
(13, 7, 2, 1, '144', 11, 11, '11', '11', 121, '111', 2, 0, '2020-01-01'),
(15, 8, 1, 1, '122', 15, 55, '1', '11', 825, '1555', 1, 15, '2201-01-01'),
(16, 9, 1, 1, '114', 11, 11, '11', '11', 121, '11', 1, 11, '2222-01-01'),
(17, 9, 1, 1, '114', 11, 525, '11', '11', 5775, '11', 1, 11, '2222-01-01'),
(19, 10, 2, 2, '1212', 200, 100, '500', '', 20000, '', 0, 0, '2021-04-08');

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `amount` float NOT NULL,
  `gst` varchar(100) NOT NULL,
  `freight charges` int(11) NOT NULL,
  `total` bigint(20) NOT NULL,
  `invoice_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id`, `invoice_no`, `amount`, `gst`, `freight charges`, `total`, `invoice_date`) VALUES
(7, 4, 1000, '207', 150, 1357, '2021-02-23'),
(8, 5, 2800, '476', 0, 3276, '2023-01-01'),
(9, 6, 251500, '45270', 0, 296770, '2021-01-01'),
(10, 7, 396000, '71370', 500, 467870, '2021-04-08');

-- --------------------------------------------------------

--
-- Table structure for table `other_details`
--

CREATE TABLE `other_details` (
  `id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `delivery_note` varchar(100) NOT NULL,
  `mode_of_payment` varchar(100) NOT NULL,
  `suppliers_ref` varchar(100) NOT NULL,
  `other_references` varchar(100) NOT NULL,
  `buyers_order_no` varchar(100) NOT NULL,
  `dated` date NOT NULL,
  `dispatch_document_no` varchar(100) NOT NULL,
  `delivery_date_note` varchar(100) NOT NULL,
  `dispatch_through` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `bill` varchar(100) NOT NULL,
  `vehicle_no` varchar(100) NOT NULL,
  `terms_of_delivery` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `other_details`
--

INSERT INTO `other_details` (`id`, `invoice_no`, `delivery_note`, `mode_of_payment`, `suppliers_ref`, `other_references`, `buyers_order_no`, `dated`, `dispatch_document_no`, `delivery_date_note`, `dispatch_through`, `destination`, `bill`, `vehicle_no`, `terms_of_delivery`) VALUES
(1, 4, '', '', '', '', '', '2021-03-01', '', '', '', '', '', ' ', ''),
(2, 5, '', '', '', '', '', '2023-01-09', '', '', '', '', '', ' ', ''),
(3, 6, '', '', '', '', '', '2021-03-17', '', '', '', '', '', ' ', ''),
(4, 7, '-', '-', '0', '-', '-', '2021-04-08', '', '-', '-', 'Karjan', '-', 'GJ06PK1201 ', '-');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_qty` varchar(20) NOT NULL,
  `product_description` varchar(100) NOT NULL,
  `identification` varchar(100) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `product_qty`, `product_description`, `identification`, `added_on`) VALUES
(1, 'Detergent Powder', '10kg', '', 'loose', '2021-02-23 11:23:06'),
(2, 'Detergent Powder', '10kg', '125gm*80Packets', '125gm*80Packets', '2021-02-23 11:24:04'),
(3, 'Detergent Powder', '10kg', '100gm*100Packets', '100gm*100Packets', '2021-02-23 11:24:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `shop` varchar(75) NOT NULL,
  `area` varchar(75) NOT NULL,
  `state` varchar(25) NOT NULL,
  `code` varchar(2) NOT NULL,
  `city` varchar(30) NOT NULL,
  `pin` int(11) NOT NULL,
  `gst` varchar(20) NOT NULL,
  `email` varchar(75) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chalan`
--
ALTER TABLE `chalan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chalan_bill`
--
ALTER TABLE `chalan_bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_details`
--
ALTER TABLE `other_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chalan`
--
ALTER TABLE `chalan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chalan_bill`
--
ALTER TABLE `chalan_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `other_details`
--
ALTER TABLE `other_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
