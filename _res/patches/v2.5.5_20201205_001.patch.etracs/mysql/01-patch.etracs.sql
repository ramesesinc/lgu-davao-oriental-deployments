CREATE TABLE `syncdata` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `reftype` varchar(50) NOT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `orgid` varchar(50) DEFAULT NULL,
  `remote_orgid` varchar(50) DEFAULT NULL,
  `remote_orgcode` varchar(20) DEFAULT NULL,
  `remote_orgclass` varchar(20) DEFAULT NULL,
  `sender_objid` varchar(50) DEFAULT NULL,
  `sender_name` varchar(150) DEFAULT NULL,
  `fileid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_reftype` (`reftype`),
  KEY `ix_refno` (`refno`),
  KEY `ix_orgid` (`orgid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_fileid` (`fileid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

CREATE TABLE `syncdata_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `reftype` varchar(255) NOT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `error` text,
  `idx` int(255) NOT NULL,
  `info` text,
  `async` int(11) DEFAULT '0',
  `dependedaction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_syncdataitem_syncdata` FOREIGN KEY (`parentid`) REFERENCES `syncdata` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

CREATE TABLE `syncdata_pending` (
  `objid` varchar(50) NOT NULL,
  `error` text,
  `expirydate` datetime DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_expirydate` (`expirydate`),
  CONSTRAINT `fk_syncdata_pending_syncdata` FOREIGN KEY (`objid`) REFERENCES `syncdata` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

CREATE TABLE `syncdata_forprocess` (
  `objid` varchar(50) NOT NULL,
  `processed` int(11) DEFAULT '0',
  PRIMARY KEY (`objid`),
  CONSTRAINT `fk_forprocess_syncdata_item` FOREIGN KEY (`objid`) REFERENCES `syncdata_item` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

CREATE TABLE `syncdata_forsync` (
  `objid` varchar(50) NOT NULL,
  `reftype` varchar(100) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `action` varchar(100) NOT NULL,
  `orgid` varchar(25) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `createdby_title` varchar(100) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`objid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_createdbyid` (`createdby_objid`),
  KEY `ix_reftype` (`reftype`),
  KEY `ix_refno` (`refno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

CREATE TABLE `syncdata_org` (
  `orgid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `errorcount` int(11) DEFAULT '0',
  PRIMARY KEY (`orgid`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

