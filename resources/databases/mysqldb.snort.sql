-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Vert: localhost
-- Generert den: 29. Okt, 2013 19:41 PM
-- Tjenerversjon: 5.5.34
-- PHP-Versjon: 5.3.10-1ubuntu3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `snort`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `data`
--

CREATE TABLE IF NOT EXISTS `data` (
  `sid` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `data_payload` text,
  PRIMARY KEY (`sid`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `detail`
--

CREATE TABLE IF NOT EXISTS `detail` (
  `detail_type` tinyint(3) unsigned NOT NULL,
  `detail_text` text NOT NULL,
  PRIMARY KEY (`detail_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `detail`
--

INSERT INTO `detail` (`detail_type`, `detail_text`) VALUES
(0, 'fast'),
(1, 'full');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `encoding`
--

CREATE TABLE IF NOT EXISTS `encoding` (
  `encoding_type` tinyint(3) unsigned NOT NULL,
  `encoding_text` text NOT NULL,
  PRIMARY KEY (`encoding_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `encoding`
--

INSERT INTO `encoding` (`encoding_type`, `encoding_text`) VALUES
(0, 'hex'),
(1, 'base64'),
(2, 'ascii');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `sid` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `signature` int(10) unsigned NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`sid`,`cid`),
  KEY `sig` (`signature`),
  KEY `time` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `icmphdr`
--

CREATE TABLE IF NOT EXISTS `icmphdr` (
  `sid` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `icmp_type` tinyint(3) unsigned NOT NULL,
  `icmp_code` tinyint(3) unsigned NOT NULL,
  `icmp_csum` smallint(5) unsigned DEFAULT NULL,
  `icmp_id` smallint(5) unsigned DEFAULT NULL,
  `icmp_seq` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`sid`,`cid`),
  KEY `icmp_type` (`icmp_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `iphdr`
--

CREATE TABLE IF NOT EXISTS `iphdr` (
  `sid` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `ip_src` int(10) unsigned NOT NULL,
  `ip_dst` int(10) unsigned NOT NULL,
  `ip_ver` tinyint(3) unsigned DEFAULT NULL,
  `ip_hlen` tinyint(3) unsigned DEFAULT NULL,
  `ip_tos` tinyint(3) unsigned DEFAULT NULL,
  `ip_len` smallint(5) unsigned DEFAULT NULL,
  `ip_id` smallint(5) unsigned DEFAULT NULL,
  `ip_flags` tinyint(3) unsigned DEFAULT NULL,
  `ip_off` smallint(5) unsigned DEFAULT NULL,
  `ip_ttl` tinyint(3) unsigned DEFAULT NULL,
  `ip_proto` tinyint(3) unsigned NOT NULL,
  `ip_csum` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`sid`,`cid`),
  KEY `ip_src` (`ip_src`),
  KEY `ip_dst` (`ip_dst`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `opt`
--

CREATE TABLE IF NOT EXISTS `opt` (
  `sid` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `optid` int(10) unsigned NOT NULL,
  `opt_proto` tinyint(3) unsigned NOT NULL,
  `opt_code` tinyint(3) unsigned NOT NULL,
  `opt_len` smallint(6) DEFAULT NULL,
  `opt_data` text,
  PRIMARY KEY (`sid`,`cid`,`optid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `reference`
--

CREATE TABLE IF NOT EXISTS `reference` (
  `ref_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ref_system_id` int(10) unsigned NOT NULL,
  `ref_tag` text NOT NULL,
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `reference_system`
--

CREATE TABLE IF NOT EXISTS `reference_system` (
  `ref_system_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ref_system_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ref_system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `schema`
--

CREATE TABLE IF NOT EXISTS `schema` (
  `vseq` int(10) unsigned NOT NULL,
  `ctime` datetime NOT NULL,
  PRIMARY KEY (`vseq`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `schema`
--

INSERT INTO `schema` (`vseq`, `ctime`) VALUES
(107, '2013-10-29 19:29:40');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `sensor`
--

CREATE TABLE IF NOT EXISTS `sensor` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostname` text,
  `interface` text,
  `filter` text,
  `detail` tinyint(4) DEFAULT NULL,
  `encoding` tinyint(4) DEFAULT NULL,
  `last_cid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `signature`
--

CREATE TABLE IF NOT EXISTS `signature` (
  `sig_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sig_name` varchar(255) NOT NULL,
  `sig_class_id` int(10) unsigned NOT NULL,
  `sig_priority` int(10) unsigned DEFAULT NULL,
  `sig_rev` int(10) unsigned DEFAULT NULL,
  `sig_sid` int(10) unsigned DEFAULT NULL,
  `sig_gid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`sig_id`),
  KEY `sign_idx` (`sig_name`(20)),
  KEY `sig_class_id_idx` (`sig_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `sig_class`
--

CREATE TABLE IF NOT EXISTS `sig_class` (
  `sig_class_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sig_class_name` varchar(60) NOT NULL,
  PRIMARY KEY (`sig_class_id`),
  KEY `sig_class_id` (`sig_class_id`),
  KEY `sig_class_name` (`sig_class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `sig_reference`
--

CREATE TABLE IF NOT EXISTS `sig_reference` (
  `sig_id` int(10) unsigned NOT NULL,
  `ref_seq` int(10) unsigned NOT NULL,
  `ref_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sig_id`,`ref_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `tcphdr`
--

CREATE TABLE IF NOT EXISTS `tcphdr` (
  `sid` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `tcp_sport` smallint(5) unsigned NOT NULL,
  `tcp_dport` smallint(5) unsigned NOT NULL,
  `tcp_seq` int(10) unsigned DEFAULT NULL,
  `tcp_ack` int(10) unsigned DEFAULT NULL,
  `tcp_off` tinyint(3) unsigned DEFAULT NULL,
  `tcp_res` tinyint(3) unsigned DEFAULT NULL,
  `tcp_flags` tinyint(3) unsigned NOT NULL,
  `tcp_win` smallint(5) unsigned DEFAULT NULL,
  `tcp_csum` smallint(5) unsigned DEFAULT NULL,
  `tcp_urp` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`sid`,`cid`),
  KEY `tcp_sport` (`tcp_sport`),
  KEY `tcp_dport` (`tcp_dport`),
  KEY `tcp_flags` (`tcp_flags`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `udphdr`
--

CREATE TABLE IF NOT EXISTS `udphdr` (
  `sid` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `udp_sport` smallint(5) unsigned NOT NULL,
  `udp_dport` smallint(5) unsigned NOT NULL,
  `udp_len` smallint(5) unsigned DEFAULT NULL,
  `udp_csum` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`sid`,`cid`),
  KEY `udp_sport` (`udp_sport`),
  KEY `udp_dport` (`udp_dport`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
