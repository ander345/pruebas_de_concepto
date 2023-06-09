
CREATE TABLE IF NOT EXISTS `graduate` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `year` INT NOT NULL,
  `sex` VARCHAR(10) NOT NULL,
  `type_of_course` VARCHAR(100) NOT NULL,
  `no_of_graduates` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10001;

INSERT IGNORE INTO `graduate`  VALUES
(1, 1993, 'Males', 'Education', null),
(2, 1993, 'Males', 'Applied Arts', null),
(3, 1993, 'Males', 'Humanities & Social Sciences', 481),
(4, 1993, 'Males', 'Mass Communication', null),
(5, 1993, 'Males', 'Accountancy', 295),
(6, 1993, 'Males', 'Business & Administration', 282),
(7, 1993, 'Males', 'Law', 92),
(8, 1993, 'Males', 'Natural, Physical & Mathematical Sciences', 404),
(9, 1993, 'Males', 'Medicine', 95),
(10, 1993, 'Males', 'Dentistry', 14),
(11, 1993, 'Males', 'Health Sciences', 10),
(12, 1993, 'Males', 'Information Technology', 264),
(13, 1993, 'Males', 'Architecture & Building', 132),
(14, 1993, 'Males', 'Engineering Sciences', 1496),
(15, 1993, 'Males', 'Services', null),
(16, 1993, 'Females', 'Education', null),
(17, 1993, 'Females', 'Applied Arts', null),
(18, 1993, 'Females', 'Humanities & Social Sciences', 1173),
(19, 1993, 'Females', 'Mass Communication', null),
(20, 1993, 'Females', 'Accountancy', 396),
(21, 1993, 'Females', 'Business & Administration', 708),
(22, 1993, 'Females', 'Law', 93),
(23, 1993, 'Females', 'Natural, Physical & Mathematical Sciences', 588),
(24, 1993, 'Females', 'Medicine', 61),
(25, 1993, 'Females', 'Dentistry', 11),
(26, 1993, 'Females', 'Health Sciences', 40),
(27, 1993, 'Females', 'Information Technology', 215),
(28, 1993, 'Females', 'Architecture & Building', 144),
(29, 1993, 'Females', 'Engineering Sciences', 254),
(30, 1993, 'Females', 'Services', null),
(31, 1994, 'Males', 'Education', null),
(32, 1994, 'Males', 'Applied Arts', null),
(33, 1994, 'Males', 'Humanities & Social Sciences', 512),
(34, 1994, 'Males', 'Mass Communication', null),
(35, 1994, 'Males', 'Accountancy', 271),
(36, 1994, 'Males', 'Business & Administration', 413),
(37, 1994, 'Males', 'Law', 87),
(38, 1994, 'Males', 'Natural, Physical & Mathematical Sciences', 374),
(39, 1994, 'Males', 'Medicine', 99),
(40, 1994, 'Males', 'Dentistry', 23),
(41, 1994, 'Males', 'Health Sciences', 14),
(42, 1994, 'Males', 'Information Technology', 294),
(43, 1994, 'Males', 'Architecture & Building', 136),
(44, 1994, 'Males', 'Engineering Sciences', 1666),
(45, 1994, 'Males', 'Services', null),
(46, 1994, 'Females', 'Education', null),
(47, 1994, 'Females', 'Applied Arts', null),
(48, 1994, 'Females', 'Humanities & Social Sciences', 1133),
(49, 1994, 'Females', 'Mass Communication', null),
(50, 1994, 'Females', 'Accountancy', 378),
(51, 1994, 'Females', 'Business & Administration', 733),
(52, 1994, 'Females', 'Law', 99),
(53, 1994, 'Females', 'Natural, Physical & Mathematical Sciences', 566),
(54, 1994, 'Females', 'Medicine', 66),
(55, 1994, 'Females', 'Dentistry', 6),
(56, 1994, 'Females', 'Health Sciences', 39),
(57, 1994, 'Females', 'Information Technology', 196),
(58, 1994, 'Females', 'Architecture & Building', 182),
(59, 1994, 'Females', 'Engineering Sciences', 227),
(60, 1994, 'Females', 'Services', null),
(61, 1995, 'Males', 'Education', 12),
(62, 1995, 'Males', 'Applied Arts', null),
(63, 1995, 'Males', 'Humanities & Social Sciences', 497),
(64, 1995, 'Males', 'Mass Communication', null),
(65, 1995, 'Males', 'Accountancy', 289),
(66, 1995, 'Males', 'Business & Administration', 365),
(67, 1995, 'Males', 'Law', 94),
(68, 1995, 'Males', 'Natural, Physical & Mathematical Sciences', 460),
(69, 1995, 'Males', 'Medicine', 93),
(70, 1995, 'Males', 'Dentistry', 20),
(71, 1995, 'Males', 'Health Sciences', 12),
(72, 1995, 'Males', 'Information Technology', 306),
(73, 1995, 'Males', 'Architecture & Building', 140),
(74, 1995, 'Males', 'Engineering Sciences', 1715),
(75, 1995, 'Males', 'Services', null),
(76, 1995, 'Females', 'Education', 101),
(77, 1995, 'Females', 'Applied Arts', null),
(78, 1995, 'Females', 'Humanities & Social Sciences', 1240),
(79, 1995, 'Females', 'Mass Communication', null),
(80, 1995, 'Females', 'Accountancy', 395),
(81, 1995, 'Females', 'Business & Administration', 788),
(82, 1995, 'Females', 'Law', 100),
(83, 1995, 'Females', 'Natural, Physical & Mathematical Sciences', 572),
(84, 1995, 'Females', 'Medicine', 48),
(85, 1995, 'Females', 'Dentistry', 8),
(86, 1995, 'Females', 'Health Sciences', 46),
(87, 1995, 'Females', 'Information Technology', 193),
(88, 1995, 'Females', 'Architecture & Building', 156),
(89, 1995, 'Females', 'Engineering Sciences', 276),
(90, 1995, 'Females', 'Services', null),
(91, 1996, 'Males', 'Education', 46),
(92, 1996, 'Males', 'Applied Arts', null),
(93, 1996, 'Males', 'Humanities & Social Sciences', 497),
(94, 1996, 'Males', 'Mass Communication', null),
(95, 1996, 'Males', 'Accountancy', 262),
(96, 1996, 'Males', 'Business & Administration', 358),
(97, 1996, 'Males', 'Law', 75),
(98, 1996, 'Males', 'Natural, Physical & Mathematical Sciences', 449),
(99, 1996, 'Males', 'Medicine', 97),
(100, 1996, 'Males', 'Dentistry', 24),
(101, 1996, 'Males', 'Health Sciences', 9),
(102, 1996, 'Males', 'Information Technology', 362),
(103, 1996, 'Males', 'Architecture & Building', 142),
(104, 1996, 'Males', 'Engineering Sciences', 1701),
(105, 1996, 'Males', 'Services', null),
(106, 1996, 'Females', 'Education', 199),
(107, 1996, 'Females', 'Applied Arts', null),
(108, 1996, 'Females', 'Humanities & Social Sciences', 1364),
(109, 1996, 'Females', 'Mass Communication', null),
(110, 1996, 'Females', 'Accountancy', 433),
(111, 1996, 'Females', 'Business & Administration', 848),
(112, 1996, 'Females', 'Law', 106),
(113, 1996, 'Females', 'Natural, Physical & Mathematical Sciences', 541),
(114, 1996, 'Females', 'Medicine', 53),
(115, 1996, 'Females', 'Dentistry', 13),
(116, 1996, 'Females', 'Health Sciences', 59),
(117, 1996, 'Females', 'Information Technology', 194),
(118, 1996, 'Females', 'Architecture & Building', 136),
(119, 1996, 'Females', 'Engineering Sciences', 250),
(120, 1996, 'Females', 'Services', null),
(121, 1997, 'Males', 'Education', 45),
(122, 1997, 'Males', 'Applied Arts', null),
(123, 1997, 'Males', 'Humanities & Social Sciences', 554),
(124, 1997, 'Males', 'Mass Communication', 28),
(125, 1997, 'Males', 'Accountancy', 227),
(126, 1997, 'Males', 'Business & Administration', 448),
(127, 1997, 'Males', 'Law', 90),
(128, 1997, 'Males', 'Natural, Physical & Mathematical Sciences', 437),
(129, 1997, 'Males', 'Medicine', 107),
(130, 1997, 'Males', 'Dentistry', 20),
(131, 1997, 'Males', 'Health Sciences', 9),
(132, 1997, 'Males', 'Information Technology', 370),
(133, 1997, 'Males', 'Architecture & Building', 135),
(134, 1997, 'Males', 'Engineering Sciences', 1806),
(135, 1997, 'Males', 'Services', null),
(136, 1997, 'Females', 'Education', 187),
(137, 1997, 'Females', 'Applied Arts', null),
(138, 1997, 'Females', 'Humanities & Social Sciences', 1367),
(139, 1997, 'Females', 'Mass Communication', 67),
(140, 1997, 'Females', 'Accountancy', 453),
(141, 1997, 'Females', 'Business & Administration', 808),
(142, 1997, 'Females', 'Law', 97),
(143, 1997, 'Females', 'Natural, Physical & Mathematical Sciences', 600),
(144, 1997, 'Females', 'Medicine', 40),
(145, 1997, 'Females', 'Dentistry', 10),
(146, 1997, 'Females', 'Health Sciences', 60),
(147, 1997, 'Females', 'Information Technology', 218),
(148, 1997, 'Females', 'Architecture & Building', 163),
(149, 1997, 'Females', 'Engineering Sciences', 333),
(150, 1997, 'Females', 'Services', null),
(151, 1998, 'Males', 'Education', 56),
(152, 1998, 'Males', 'Applied Arts', null),
(153, 1998, 'Males', 'Humanities & Social Sciences', 547),
(154, 1998, 'Males', 'Mass Communication', 27),
(155, 1998, 'Males', 'Accountancy', 264),
(156, 1998, 'Males', 'Business & Administration', 461),
(157, 1998, 'Males', 'Law', 70),
(158, 1998, 'Males', 'Natural, Physical & Mathematical Sciences', 422),
(159, 1998, 'Males', 'Medicine', 106),
(160, 1998, 'Males', 'Dentistry', 24),
(161, 1998, 'Males', 'Health Sciences', 8),
(162, 1998, 'Males', 'Information Technology', 377),
(163, 1998, 'Males', 'Architecture & Building', 141),
(164, 1998, 'Males', 'Engineering Sciences', 1952),
(165, 1998, 'Males', 'Services', null),
(166, 1998, 'Females', 'Education', 133),
(167, 1998, 'Females', 'Applied Arts', null),
(168, 1998, 'Females', 'Humanities & Social Sciences', 1547),
(169, 1998, 'Females', 'Mass Communication', 74),
(170, 1998, 'Females', 'Accountancy', 487),
(171, 1998, 'Females', 'Business & Administration', 869),
(172, 1998, 'Females', 'Law', 103),
(173, 1998, 'Females', 'Natural, Physical & Mathematical Sciences', 678),
(174, 1998, 'Females', 'Medicine', 42),
(175, 1998, 'Females', 'Dentistry', 12),
(176, 1998, 'Females', 'Health Sciences', 69),
(177, 1998, 'Females', 'Information Technology', 296),
(178, 1998, 'Females', 'Architecture & Building', 153),
(179, 1998, 'Females', 'Engineering Sciences', 413),
(180, 1998, 'Females', 'Services', null),
(181, 1999, 'Males', 'Education', 44),
(182, 1999, 'Males', 'Applied Arts', null),
(183, 1999, 'Males', 'Humanities & Social Sciences', 576),
(184, 1999, 'Males', 'Mass Communication', 19),
(185, 1999, 'Males', 'Accountancy', 297),
(186, 1999, 'Males', 'Business & Administration', 349),
(187, 1999, 'Males', 'Law', 92),
(188, 1999, 'Males', 'Natural, Physical & Mathematical Sciences', 401),
(189, 1999, 'Males', 'Medicine', 104),
(190, 1999, 'Males', 'Dentistry', 18),
(191, 1999, 'Males', 'Health Sciences', 14),
(192, 1999, 'Males', 'Information Technology', 355),
(193, 1999, 'Males', 'Architecture & Building', 104),
(194, 1999, 'Males', 'Engineering Sciences', 2200),
(195, 1999, 'Males', 'Services', null),
(196, 1999, 'Females', 'Education', 158),
(197, 1999, 'Females', 'Applied Arts', null),
(198, 1999, 'Females', 'Humanities & Social Sciences', 1492),
(199, 1999, 'Females', 'Mass Communication', 93),
(200, 1999, 'Females', 'Accountancy', 482),
(201, 1999, 'Females', 'Business & Administration', 905),
(202, 1999, 'Females', 'Law', 77),
(203, 1999, 'Females', 'Natural, Physical & Mathematical Sciences', 674),
(204, 1999, 'Females', 'Medicine', 41),
(205, 1999, 'Females', 'Dentistry', 14),
(206, 1999, 'Females', 'Health Sciences', 77),
(207, 1999, 'Females', 'Information Technology', 218),
(208, 1999, 'Females', 'Architecture & Building', 167),
(209, 1999, 'Females', 'Engineering Sciences', 492),
(210, 1999, 'Females', 'Services', null),
(211, 2000, 'Males', 'Education', 35),
(212, 2000, 'Males', 'Applied Arts', null),
(213, 2000, 'Males', 'Humanities & Social Sciences', 574),
(214, 2000, 'Males', 'Mass Communication', 34),
(215, 2000, 'Males', 'Accountancy', 250),
(216, 2000, 'Males', 'Business & Administration', 328),
(217, 2000, 'Males', 'Law', 74),
(218, 2000, 'Males', 'Natural, Physical & Mathematical Sciences', 378),
(219, 2000, 'Males', 'Medicine', 119),
(220, 2000, 'Males', 'Dentistry', 17),
(221, 2000, 'Males', 'Health Sciences', 11),
(222, 2000, 'Males', 'Information Technology', 348),
(223, 2000, 'Males', 'Architecture & Building', 101),
(224, 2000, 'Males', 'Engineering Sciences', 2267),
(225, 2000, 'Males', 'Services', null),
(226, 2000, 'Females', 'Education', 115),
(227, 2000, 'Females', 'Applied Arts', null),
(228, 2000, 'Females', 'Humanities & Social Sciences', 1452),
(229, 2000, 'Females', 'Mass Communication', 80),
(230, 2000, 'Females', 'Accountancy', 495),
(231, 2000, 'Females', 'Business & Administration', 851),
(232, 2000, 'Females', 'Law', 79),
(233, 2000, 'Females', 'Natural, Physical & Mathematical Sciences', 655),
(234, 2000, 'Females', 'Medicine', 37),
(235, 2000, 'Females', 'Dentistry', 15),
(236, 2000, 'Females', 'Health Sciences', 30),
(237, 2000, 'Females', 'Information Technology', 187),
(238, 2000, 'Females', 'Architecture & Building', 192),
(239, 2000, 'Females', 'Engineering Sciences', 682),
(240, 2000, 'Females', 'Services', null),
(241, 2001, 'Males', 'Education', 63),
(242, 2001, 'Males', 'Applied Arts', null),
(243, 2001, 'Males', 'Humanities & Social Sciences', 534),
(244, 2001, 'Males', 'Mass Communication', 39),
(245, 2001, 'Males', 'Accountancy', 257),
(246, 2001, 'Males', 'Business & Administration', 403),
(247, 2001, 'Males', 'Law', 58),
(248, 2001, 'Males', 'Natural, Physical & Mathematical Sciences', 358),
(249, 2001, 'Males', 'Medicine', 97),
(250, 2001, 'Males', 'Dentistry', 19),
(251, 2001, 'Males', 'Health Sciences', 17),
(252, 2001, 'Males', 'Information Technology', 249),
(253, 2001, 'Males', 'Architecture & Building', 124),
(254, 2001, 'Males', 'Engineering Sciences', 2517),
(255, 2001, 'Males', 'Services', null),
(256, 2001, 'Females', 'Education', 147),
(257, 2001, 'Females', 'Applied Arts', null),
(258, 2001, 'Females', 'Humanities & Social Sciences', 1520),
(259, 2001, 'Females', 'Mass Communication', 77),
(260, 2001, 'Females', 'Accountancy', 484),
(261, 2001, 'Females', 'Business & Administration', 807),
(262, 2001, 'Females', 'Law', 96),
(263, 2001, 'Females', 'Natural, Physical & Mathematical Sciences', 754),
(264, 2001, 'Females', 'Medicine', 42),
(265, 2001, 'Females', 'Dentistry', 16),
(266, 2001, 'Females', 'Health Sciences', 46),
(267, 2001, 'Females', 'Information Technology', 133),
(268, 2001, 'Females', 'Architecture & Building', 199),
(269, 2001, 'Females', 'Engineering Sciences', 803),
(270, 2001, 'Females', 'Services', null),
(271, 2002, 'Males', 'Education', 63),
(272, 2002, 'Males', 'Applied Arts', null),
(273, 2002, 'Males', 'Humanities & Social Sciences', 591),
(274, 2002, 'Males', 'Mass Communication', 30),
(275, 2002, 'Males', 'Accountancy', 226),
(276, 2002, 'Males', 'Business & Administration', 318),
(277, 2002, 'Males', 'Law', 73),
(278, 2002, 'Males', 'Natural, Physical & Mathematical Sciences', 276),
(279, 2002, 'Males', 'Medicine', 122),
(280, 2002, 'Males', 'Dentistry', 23),
(281, 2002, 'Males', 'Health Sciences', 20),
(282, 2002, 'Males', 'Information Technology', 365),
(283, 2002, 'Males', 'Architecture & Building', 134),
(284, 2002, 'Males', 'Engineering Sciences', 2617),
(285, 2002, 'Males', 'Services', null),
(286, 2002, 'Females', 'Education', 163),
(287, 2002, 'Females', 'Applied Arts', null),
(288, 2002, 'Females', 'Humanities & Social Sciences', 1609),
(289, 2002, 'Females', 'Mass Communication', 91),
(290, 2002, 'Females', 'Accountancy', 541),
(291, 2002, 'Females', 'Business & Administration', 751),
(292, 2002, 'Females', 'Law', 77),
(293, 2002, 'Females', 'Natural, Physical & Mathematical Sciences', 699),
(294, 2002, 'Females', 'Medicine', 60),
(295, 2002, 'Females', 'Dentistry', 11),
(296, 2002, 'Females', 'Health Sciences', 49),
(297, 2002, 'Females', 'Information Technology', 199),
(298, 2002, 'Females', 'Architecture & Building', 224),
(299, 2002, 'Females', 'Engineering Sciences', 880),
(300, 2002, 'Females', 'Services', null),
(301, 2003, 'Males', 'Education', 97),
(302, 2003, 'Males', 'Applied Arts', 11),
(303, 2003, 'Males', 'Humanities & Social Sciences', 456),
(304, 2003, 'Males', 'Mass Communication', 33),
(305, 2003, 'Males', 'Accountancy', 222),
(306, 2003, 'Males', 'Business & Administration', 284),
(307, 2003, 'Males', 'Law', 59),
(308, 2003, 'Males', 'Natural, Physical & Mathematical Sciences', 371),
(309, 2003, 'Males', 'Medicine', 128),
(310, 2003, 'Males', 'Dentistry', 21),
(311, 2003, 'Males', 'Health Sciences', 15),
(312, 2003, 'Males', 'Information Technology', 377),
(313, 2003, 'Males', 'Architecture & Building', 175),
(314, 2003, 'Males', 'Engineering Sciences', 2948),
(315, 2003, 'Males', 'Services', null),
(316, 2003, 'Females', 'Education', 264),
(317, 2003, 'Females', 'Applied Arts', 10),
(318, 2003, 'Females', 'Humanities & Social Sciences', 1152),
(319, 2003, 'Females', 'Mass Communication', 82),
(320, 2003, 'Females', 'Accountancy', 524),
(321, 2003, 'Females', 'Business & Administration', 693),
(322, 2003, 'Females', 'Law', 81),
(323, 2003, 'Females', 'Natural, Physical & Mathematical Sciences', 742),
(324, 2003, 'Females', 'Medicine', 66),
(325, 2003, 'Females', 'Dentistry', 11),
(326, 2003, 'Females', 'Health Sciences', 48),
(327, 2003, 'Females', 'Information Technology', 242),
(328, 2003, 'Females', 'Architecture & Building', 235),
(329, 2003, 'Females', 'Engineering Sciences', 1016),
(330, 2003, 'Females', 'Services', null),
(331, 2004, 'Males', 'Education', 76),
(332, 2004, 'Males', 'Applied Arts', 11),
(333, 2004, 'Males', 'Humanities & Social Sciences', 383),
(334, 2004, 'Males', 'Mass Communication', 34),
(335, 2004, 'Males', 'Accountancy', 234),
(336, 2004, 'Males', 'Business & Administration', 325),
(337, 2004, 'Males', 'Law', 56),
(338, 2004, 'Males', 'Natural, Physical & Mathematical Sciences', 409),
(339, 2004, 'Males', 'Medicine', 122),
(340, 2004, 'Males', 'Dentistry', 14),
(341, 2004, 'Males', 'Health Sciences', 11),
(342, 2004, 'Males', 'Information Technology', 412),
(343, 2004, 'Males', 'Architecture & Building', 137),
(344, 2004, 'Males', 'Engineering Sciences', 3022),
(345, 2004, 'Males', 'Services', null),
(346, 2004, 'Females', 'Education', 336),
(347, 2004, 'Females', 'Applied Arts', 14),
(348, 2004, 'Females', 'Humanities & Social Sciences', 993),
(349, 2004, 'Females', 'Mass Communication', 109),
(350, 2004, 'Females', 'Accountancy', 387),
(351, 2004, 'Females', 'Business & Administration', 742),
(352, 2004, 'Females', 'Law', 91),
(353, 2004, 'Females', 'Natural, Physical & Mathematical Sciences', 781),
(354, 2004, 'Females', 'Medicine', 77),
(355, 2004, 'Females', 'Dentistry', 18),
(356, 2004, 'Females', 'Health Sciences', 78),
(357, 2004, 'Females', 'Information Technology', 309),
(358, 2004, 'Females', 'Architecture & Building', 185),
(359, 2004, 'Females', 'Engineering Sciences', 1179),
(360, 2004, 'Females', 'Services', null),
(361, 2005, 'Males', 'Education', 86),
(362, 2005, 'Males', 'Applied Arts', 11),
(363, 2005, 'Males', 'Humanities & Social Sciences', 351),
(364, 2005, 'Males', 'Mass Communication', 36),
(365, 2005, 'Males', 'Accountancy', 211),
(366, 2005, 'Males', 'Business & Administration', 322),
(367, 2005, 'Males', 'Law', 62),
(368, 2005, 'Males', 'Natural, Physical & Mathematical Sciences', 321),
(369, 2005, 'Males', 'Medicine', 123),
(370, 2005, 'Males', 'Dentistry', 22),
(371, 2005, 'Males', 'Health Sciences', 16),
(372, 2005, 'Males', 'Information Technology', 363),
(373, 2005, 'Males', 'Architecture & Building', 138),
(374, 2005, 'Males', 'Engineering Sciences', 2887),
(375, 2005, 'Males', 'Services', null),
(376, 2005, 'Females', 'Education', 278),
(377, 2005, 'Females', 'Applied Arts', 11),
(378, 2005, 'Females', 'Humanities & Social Sciences', 1027),
(379, 2005, 'Females', 'Mass Communication', 110),
(380, 2005, 'Females', 'Accountancy', 495),
(381, 2005, 'Females', 'Business & Administration', 799),
(382, 2005, 'Females', 'Law', 125),
(383, 2005, 'Females', 'Natural, Physical & Mathematical Sciences', 674),
(384, 2005, 'Females', 'Medicine', 86),
(385, 2005, 'Females', 'Dentistry', 12),
(386, 2005, 'Females', 'Health Sciences', 69),
(387, 2005, 'Females', 'Information Technology', 199),
(388, 2005, 'Females', 'Architecture & Building', 234),
(389, 2005, 'Females', 'Engineering Sciences', 1241),
(390, 2005, 'Females', 'Services', null),
(391, 2006, 'Males', 'Education', 89),
(392, 2006, 'Males', 'Applied Arts', 11),
(393, 2006, 'Males', 'Humanities & Social Sciences', 412),
(394, 2006, 'Males', 'Mass Communication', 33),
(395, 2006, 'Males', 'Accountancy', 176),
(396, 2006, 'Males', 'Business & Administration', 432),
(397, 2006, 'Males', 'Law', 70),
(398, 2006, 'Males', 'Natural, Physical & Mathematical Sciences', 388),
(399, 2006, 'Males', 'Medicine', 135),
(400, 2006, 'Males', 'Dentistry', 18),
(401, 2006, 'Males', 'Health Sciences', 24),
(402, 2006, 'Males', 'Information Technology', 319),
(403, 2006, 'Males', 'Architecture & Building', 166),
(404, 2006, 'Males', 'Engineering Sciences', 2934),
(405, 2006, 'Males', 'Services', null),
(406, 2006, 'Females', 'Education', 302),
(407, 2006, 'Females', 'Applied Arts', 13),
(408, 2006, 'Females', 'Humanities & Social Sciences', 1071),
(409, 2006, 'Females', 'Mass Communication', 108),
(410, 2006, 'Females', 'Accountancy', 468),
(411, 2006, 'Females', 'Business & Administration', 819),
(412, 2006, 'Females', 'Law', 134),
(413, 2006, 'Females', 'Natural, Physical & Mathematical Sciences', 880),
(414, 2006, 'Females', 'Medicine', 94),
(415, 2006, 'Females', 'Dentistry', 14),
(416, 2006, 'Females', 'Health Sciences', 57),
(417, 2006, 'Females', 'Information Technology', 130),
(418, 2006, 'Females', 'Architecture & Building', 214),
(419, 2006, 'Females', 'Engineering Sciences', 1199),
(420, 2006, 'Females', 'Services', null),
(421, 2007, 'Males', 'Education', 73),
(422, 2007, 'Males', 'Applied Arts', 28),
(423, 2007, 'Males', 'Humanities & Social Sciences', 441),
(424, 2007, 'Males', 'Mass Communication', 28),
(425, 2007, 'Males', 'Accountancy', 260),
(426, 2007, 'Males', 'Business & Administration', 493),
(427, 2007, 'Males', 'Law', 84),
(428, 2007, 'Males', 'Natural, Physical & Mathematical Sciences', 427),
(429, 2007, 'Males', 'Medicine', 144),
(430, 2007, 'Males', 'Dentistry', 21),
(431, 2007, 'Males', 'Health Sciences', 19),
(432, 2007, 'Males', 'Information Technology', 303),
(433, 2007, 'Males', 'Architecture & Building', 131),
(434, 2007, 'Males', 'Engineering Sciences', 3371),
(435, 2007, 'Males', 'Services', 0),
(436, 2007, 'Females', 'Education', 189),
(437, 2007, 'Females', 'Applied Arts', 41),
(438, 2007, 'Females', 'Humanities & Social Sciences', 980),
(439, 2007, 'Females', 'Mass Communication', 141),
(440, 2007, 'Females', 'Accountancy', 575),
(441, 2007, 'Females', 'Business & Administration', 894),
(442, 2007, 'Females', 'Law', 123),
(443, 2007, 'Females', 'Natural, Physical & Mathematical Sciences', 827),
(444, 2007, 'Females', 'Medicine', 83),
(445, 2007, 'Females', 'Dentistry', 15),
(446, 2007, 'Females', 'Health Sciences', 67),
(447, 2007, 'Females', 'Information Technology', 190),
(448, 2007, 'Females', 'Architecture & Building', 208),
(449, 2007, 'Females', 'Engineering Sciences', 1337),
(450, 2007, 'Females', 'Services', 0),
(451, 2008, 'Males', 'Education', 53),
(452, 2008, 'Males', 'Applied Arts', 31),
(453, 2008, 'Males', 'Humanities & Social Sciences', 478),
(454, 2008, 'Males', 'Mass Communication', 32),
(455, 2008, 'Males', 'Accountancy', 295),
(456, 2008, 'Males', 'Business & Administration', 505),
(457, 2008, 'Males', 'Law', 94),
(458, 2008, 'Males', 'Natural, Physical & Mathematical Sciences', 469),
(459, 2008, 'Males', 'Medicine', 131),
(460, 2008, 'Males', 'Dentistry', 18),
(461, 2008, 'Males', 'Health Sciences', 10),
(462, 2008, 'Males', 'Information Technology', 308),
(463, 2008, 'Males', 'Architecture & Building', 148),
(464, 2008, 'Males', 'Engineering Sciences', 3150),
(465, 2008, 'Males', 'Services', 14),
(466, 2008, 'Females', 'Education', 172),
(467, 2008, 'Females', 'Applied Arts', 50),
(468, 2008, 'Females', 'Humanities & Social Sciences', 1203),
(469, 2008, 'Females', 'Mass Communication', 132),
(470, 2008, 'Females', 'Accountancy', 536),
(471, 2008, 'Females', 'Business & Administration', 960),
(472, 2008, 'Females', 'Law', 115),
(473, 2008, 'Females', 'Natural, Physical & Mathematical Sciences', 796),
(474, 2008, 'Females', 'Medicine', 96),
(475, 2008, 'Females', 'Dentistry', 17),
(476, 2008, 'Females', 'Health Sciences', 77),
(477, 2008, 'Females', 'Information Technology', 210),
(478, 2008, 'Females', 'Architecture & Building', 243),
(479, 2008, 'Females', 'Engineering Sciences', 1386),
(480, 2008, 'Females', 'Services', 43),
(481, 2009, 'Males', 'Education', 67),
(482, 2009, 'Males', 'Applied Arts', 47),
(483, 2009, 'Males', 'Humanities & Social Sciences', 547),
(484, 2009, 'Males', 'Mass Communication', 36),
(485, 2009, 'Males', 'Accountancy', 346),
(486, 2009, 'Males', 'Business & Administration', 630),
(487, 2009, 'Males', 'Law', 92),
(488, 2009, 'Males', 'Natural, Physical & Mathematical Sciences', 574),
(489, 2009, 'Males', 'Medicine', 122),
(490, 2009, 'Males', 'Dentistry', 12),
(491, 2009, 'Males', 'Health Sciences', 22),
(492, 2009, 'Males', 'Information Technology', 370),
(493, 2009, 'Males', 'Architecture & Building', 135),
(494, 2009, 'Males', 'Engineering Sciences', 2991),
(495, 2009, 'Males', 'Services', 13),
(496, 2009, 'Females', 'Education', 281),
(497, 2009, 'Females', 'Applied Arts', 88),
(498, 2009, 'Females', 'Humanities & Social Sciences', 1423),
(499, 2009, 'Females', 'Mass Communication', 128),
(500, 2009, 'Females', 'Accountancy', 596),
(501, 2009, 'Females', 'Business & Administration', 857),
(502, 2009, 'Females', 'Law', 118),
(503, 2009, 'Females', 'Natural, Physical & Mathematical Sciences', 946),
(504, 2009, 'Females', 'Medicine', 97),
(505, 2009, 'Females', 'Dentistry', 19),
(506, 2009, 'Females', 'Health Sciences', 107),
(507, 2009, 'Females', 'Information Technology', 162),
(508, 2009, 'Females', 'Architecture & Building', 179),
(509, 2009, 'Females', 'Engineering Sciences', 1217),
(510, 2009, 'Females', 'Services', 36),
(511, 2010, 'Males', 'Education', 67),
(512, 2010, 'Males', 'Applied Arts', 84),
(513, 2010, 'Males', 'Humanities & Social Sciences', 703),
(514, 2010, 'Males', 'Mass Communication', 30),
(515, 2010, 'Males', 'Accountancy', 380),
(516, 2010, 'Males', 'Business & Administration', 674),
(517, 2010, 'Males', 'Law', 139),
(518, 2010, 'Males', 'Natural, Physical & Mathematical Sciences', 568),
(519, 2010, 'Males', 'Medicine', 134),
(520, 2010, 'Males', 'Dentistry', 16),
(521, 2010, 'Males', 'Health Sciences', 39),
(522, 2010, 'Males', 'Information Technology', 419),
(523, 2010, 'Males', 'Architecture & Building', 97),
(524, 2010, 'Males', 'Engineering Sciences', 3117),
(525, 2010, 'Males', 'Services', 29),
(526, 2010, 'Females', 'Education', 262),
(527, 2010, 'Females', 'Applied Arts', 121),
(528, 2010, 'Females', 'Humanities & Social Sciences', 1474),
(529, 2010, 'Females', 'Mass Communication', 147),
(530, 2010, 'Females', 'Accountancy', 554),
(531, 2010, 'Females', 'Business & Administration', 859),
(532, 2010, 'Females', 'Law', 90),
(533, 2010, 'Females', 'Natural, Physical & Mathematical Sciences', 1091),
(534, 2010, 'Females', 'Medicine', 94),
(535, 2010, 'Females', 'Dentistry', 25),
(536, 2010, 'Females', 'Health Sciences', 196),
(537, 2010, 'Females', 'Information Technology', 154),
(538, 2010, 'Females', 'Architecture & Building', 178),
(539, 2010, 'Females', 'Engineering Sciences', 1020),
(540, 2010, 'Females', 'Services', 35),
(541, 2011, 'Males', 'Education', 103),
(542, 2011, 'Males', 'Applied Arts', 84),
(543, 2011, 'Males', 'Humanities & Social Sciences', 708),
(544, 2011, 'Males', 'Mass Communication', 41),
(545, 2011, 'Males', 'Accountancy', 332),
(546, 2011, 'Males', 'Business & Administration', 633),
(547, 2011, 'Males', 'Law', 121),
(548, 2011, 'Males', 'Natural, Physical & Mathematical Sciences', 619),
(549, 2011, 'Males', 'Medicine', 136),
(550, 2011, 'Males', 'Dentistry', 16),
(551, 2011, 'Males', 'Health Sciences', 42),
(552, 2011, 'Males', 'Information Technology', 388),
(553, 2011, 'Males', 'Architecture & Building', 121),
(554, 2011, 'Males', 'Engineering Sciences', 3060),
(555, 2011, 'Males', 'Services', 24),
(556, 2011, 'Females', 'Education', 303),
(557, 2011, 'Females', 'Applied Arts', 132),
(558, 2011, 'Females', 'Humanities & Social Sciences', 1772),
(559, 2011, 'Females', 'Mass Communication', 133),
(560, 2011, 'Females', 'Accountancy', 507),
(561, 2011, 'Females', 'Business & Administration', 944),
(562, 2011, 'Females', 'Law', 208),
(563, 2011, 'Females', 'Natural, Physical & Mathematical Sciences', 1217),
(564, 2011, 'Females', 'Medicine', 119),
(565, 2011, 'Females', 'Dentistry', 26),
(566, 2011, 'Females', 'Health Sciences', 213),
(567, 2011, 'Females', 'Information Technology', 195),
(568, 2011, 'Females', 'Architecture & Building', 247),
(569, 2011, 'Females', 'Engineering Sciences', 1215),
(570, 2011, 'Females', 'Services', 50),
(571, 2012, 'Males', 'Education', 116),
(572, 2012, 'Males', 'Applied Arts', 102),
(573, 2012, 'Males', 'Humanities & Social Sciences', 737),
(574, 2012, 'Males', 'Mass Communication', 37),
(575, 2012, 'Males', 'Accountancy', 447),
(576, 2012, 'Males', 'Business & Administration', 572),
(577, 2012, 'Males', 'Law', 140),
(578, 2012, 'Males', 'Natural, Physical & Mathematical Sciences', 837),
(579, 2012, 'Males', 'Medicine', 129),
(580, 2012, 'Males', 'Dentistry', 21),
(581, 2012, 'Males', 'Health Sciences', 61),
(582, 2012, 'Males', 'Information Technology', 484),
(583, 2012, 'Males', 'Architecture & Building', 155),
(584, 2012, 'Males', 'Engineering Sciences', 2870),
(585, 2012, 'Males', 'Services', 28),
(586, 2012, 'Females', 'Education', 526),
(587, 2012, 'Females', 'Applied Arts', 139),
(588, 2012, 'Females', 'Humanities & Social Sciences', 1494),
(589, 2012, 'Females', 'Mass Communication', 133),
(590, 2012, 'Females', 'Accountancy', 589),
(591, 2012, 'Females', 'Business & Administration', 825),
(592, 2012, 'Females', 'Law', 207),
(593, 2012, 'Females', 'Natural, Physical & Mathematical Sciences', 1074),
(594, 2012, 'Females', 'Medicine', 123),
(595, 2012, 'Females', 'Dentistry', 21),
(596, 2012, 'Females', 'Health Sciences', 218),
(597, 2012, 'Females', 'Information Technology', 280),
(598, 2012, 'Females', 'Architecture & Building', 241),
(599, 2012, 'Females', 'Engineering Sciences', 1210),
(600, 2012, 'Females', 'Services', 34),
(601, 2013, 'Males', 'Education', 167),
(602, 2013, 'Males', 'Applied Arts', 172),
(603, 2013, 'Males', 'Humanities & Social Sciences', 818),
(604, 2013, 'Males', 'Mass Communication', 62),
(605, 2013, 'Males', 'Accountancy', 399),
(606, 2013, 'Males', 'Business & Administration', 693),
(607, 2013, 'Males', 'Law', 189),
(608, 2013, 'Males', 'Natural, Physical & Mathematical Sciences', 870),
(609, 2013, 'Males', 'Medicine', 134),
(610, 2013, 'Males', 'Dentistry', 21),
(611, 2013, 'Males', 'Health Sciences', 95),
(612, 2013, 'Males', 'Information Technology', 542),
(613, 2013, 'Males', 'Architecture & Building', 143),
(614, 2013, 'Males', 'Engineering Sciences', 3346),
(615, 2013, 'Males', 'Services', 134),
(616, 2013, 'Females', 'Education', 422),
(617, 2013, 'Females', 'Applied Arts', 164),
(618, 2013, 'Females', 'Humanities & Social Sciences', 1766),
(619, 2013, 'Females', 'Mass Communication', 100),
(620, 2013, 'Females', 'Accountancy', 688),
(621, 2013, 'Females', 'Business & Administration', 897),
(622, 2013, 'Females', 'Law', 179),
(623, 2013, 'Females', 'Natural, Physical & Mathematical Sciences', 1257),
(624, 2013, 'Females', 'Medicine', 124),
(625, 2013, 'Females', 'Dentistry', 27),
(626, 2013, 'Females', 'Health Sciences', 296),
(627, 2013, 'Females', 'Information Technology', 250),
(628, 2013, 'Females', 'Architecture & Building', 258),
(629, 2013, 'Females', 'Engineering Sciences', 1344),
(630, 2013, 'Females', 'Services', 398),
(631, 2014, 'Males', 'Education', 124),
(632, 2014, 'Males', 'Applied Arts', 165),
(633, 2014, 'Males', 'Humanities & Social Sciences', 803),
(634, 2014, 'Males', 'Mass Communication', 44),
(635, 2014, 'Males', 'Accountancy', 473),
(636, 2014, 'Males', 'Business & Administration', 631),
(637, 2014, 'Males', 'Law', 180),
(638, 2014, 'Males', 'Natural, Physical & Mathematical Sciences', 786),
(639, 2014, 'Males', 'Medicine', 134),
(640, 2014, 'Males', 'Dentistry', 15),
(641, 2014, 'Males', 'Health Sciences', 124),
(642, 2014, 'Males', 'Information Technology', 708),
(643, 2014, 'Males', 'Architecture & Building', 146),
(644, 2014, 'Males', 'Engineering Sciences', 3288),
(645, 2014, 'Males', 'Services', 135),
(646, 2014, 'Females', 'Education', 401),
(647, 2014, 'Females', 'Applied Arts', 229),
(648, 2014, 'Females', 'Humanities & Social Sciences', 1619),
(649, 2014, 'Females', 'Mass Communication', 114),
(650, 2014, 'Females', 'Accountancy', 649),
(651, 2014, 'Females', 'Business & Administration', 846),
(652, 2014, 'Females', 'Law', 176),
(653, 2014, 'Females', 'Natural, Physical & Mathematical Sciences', 1103),
(654, 2014, 'Females', 'Medicine', 127),
(655, 2014, 'Females', 'Dentistry', 30),
(656, 2014, 'Females', 'Health Sciences', 309),
(657, 2014, 'Females', 'Information Technology', 289),
(658, 2014, 'Females', 'Architecture & Building', 258),
(659, 2014, 'Females', 'Engineering Sciences', 1251),
(660, 2014, 'Females', 'Services', 219);
