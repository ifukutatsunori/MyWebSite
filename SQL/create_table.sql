CREATE TABLE `m_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `price` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `sale` int(11),
  `trend` int(11),
  `file_name` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
