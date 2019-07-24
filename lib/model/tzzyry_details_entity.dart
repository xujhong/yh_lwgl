

class TzzyryDetailsData {
	String tzzyNl;
	dynamic zwId;
	dynamic modifiedTime;
	String tzzyFzrq;
	dynamic createdStaffid;
	dynamic sfzUpfiles;
	dynamic endDate;
	dynamic modifiedStaffid;
	String txFjwjFwdz;
	dynamic zwName;
	String tzzyGzbz;
	String tzzyFsrq;
	dynamic tableName;
	dynamic zsCount;
	List<TzzyryDetailsDataZslist> zsList;
	dynamic tzzyTcrq;
	List<TzzyryDetailsDataSfzlist> sfzList;
	dynamic txCount;
	dynamic createdTime;
	String tzzyBz;
	dynamic zsUpfiles;
	String tzzyJcrq;
	int tzzyId;
	String tzzyGzdd;
	int tzzyRyzt;
	String tzzySfzh;
	dynamic keyName;
	dynamic tzzyRyztQuery;
	dynamic tzzyTcrqAfter;
	dynamic tzzyJszc;
	String tzzyXb;
	String txFjwjYwjm;
	String organName;
	String tzzyAqzs;
	int deletedFlag;
	dynamic txUpfiles;
	String tzzyXm;
	int organId;
	String tzzyGz;
	dynamic tzzyRygzQuery;
	String tzzyFzbm;
	dynamic sfzCount;
	dynamic startDate;

	TzzyryDetailsData({this.tzzyNl, this.zwId, this.modifiedTime, this.tzzyFzrq, this.createdStaffid, this.sfzUpfiles, this.endDate, this.modifiedStaffid, this.txFjwjFwdz, this.zwName, this.tzzyGzbz, this.tzzyFsrq, this.tableName, this.zsCount, this.zsList, this.tzzyTcrq, this.sfzList, this.txCount, this.createdTime, this.tzzyBz, this.zsUpfiles, this.tzzyJcrq, this.tzzyId, this.tzzyGzdd, this.tzzyRyzt, this.tzzySfzh, this.keyName, this.tzzyRyztQuery, this.tzzyTcrqAfter, this.tzzyJszc, this.tzzyXb, this.txFjwjYwjm, this.organName, this.tzzyAqzs, this.deletedFlag, this.txUpfiles, this.tzzyXm, this.organId, this.tzzyGz, this.tzzyRygzQuery, this.tzzyFzbm, this.sfzCount, this.startDate});

	TzzyryDetailsData.fromJson(Map<String, dynamic> json) {
		tzzyNl = json['tzzyNl'];
		zwId = json['zwId'];
		modifiedTime = json['modifiedTime'];
		tzzyFzrq = json['tzzyFzrq'];
		createdStaffid = json['createdStaffid'];
		sfzUpfiles = json['sfzUpfiles'];
		endDate = json['endDate'];
		modifiedStaffid = json['modifiedStaffid'];
		txFjwjFwdz = json['txFjwjFwdz'];
		zwName = json['zwName'];
		tzzyGzbz = json['tzzyGzbz'];
		tzzyFsrq = json['tzzyFsrq'];
		tableName = json['tableName'];
		zsCount = json['zsCount'];
		if (json['zsList'] != null) {
			zsList = new List<TzzyryDetailsDataZslist>();(json['zsList'] as List).forEach((v) { zsList.add(new TzzyryDetailsDataZslist.fromJson(v)); });
		}
		tzzyTcrq = json['tzzyTcrq'];
		if (json['sfzList'] != null) {
			sfzList = new List<TzzyryDetailsDataSfzlist>();(json['sfzList'] as List).forEach((v) { sfzList.add(new TzzyryDetailsDataSfzlist.fromJson(v)); });
		}
		txCount = json['txCount'];
		createdTime = json['createdTime'];
		tzzyBz = json['tzzyBz'];
		zsUpfiles = json['zsUpfiles'];
		tzzyJcrq = json['tzzyJcrq'];
		tzzyId = json['tzzyId'];
		tzzyGzdd = json['tzzyGzdd'];
		tzzyRyzt = json['tzzyRyzt'];
		tzzySfzh = json['tzzySfzh'];
		keyName = json['keyName'];
		tzzyRyztQuery = json['tzzyRyztQuery'];
		tzzyTcrqAfter = json['tzzyTcrqAfter'];
		tzzyJszc = json['tzzyJszc'];
		tzzyXb = json['tzzyXb'];
		txFjwjYwjm = json['txFjwjYwjm'];
		organName = json['organName'];
		tzzyAqzs = json['tzzyAqzs'];
		deletedFlag = json['deletedFlag'];
		txUpfiles = json['txUpfiles'];
		tzzyXm = json['tzzyXm'];
		organId = json['organId'];
		tzzyGz = json['tzzyGz'];
		tzzyRygzQuery = json['tzzyRygzQuery'];
		tzzyFzbm = json['tzzyFzbm'];
		sfzCount = json['sfzCount'];
		startDate = json['startDate'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['tzzyNl'] = this.tzzyNl;
		data['zwId'] = this.zwId;
		data['modifiedTime'] = this.modifiedTime;
		data['tzzyFzrq'] = this.tzzyFzrq;
		data['createdStaffid'] = this.createdStaffid;
		data['sfzUpfiles'] = this.sfzUpfiles;
		data['endDate'] = this.endDate;
		data['modifiedStaffid'] = this.modifiedStaffid;
		data['txFjwjFwdz'] = this.txFjwjFwdz;
		data['zwName'] = this.zwName;
		data['tzzyGzbz'] = this.tzzyGzbz;
		data['tzzyFsrq'] = this.tzzyFsrq;
		data['tableName'] = this.tableName;
		data['zsCount'] = this.zsCount;
		if (this.zsList != null) {
      data['zsList'] =  this.zsList.map((v) => v.toJson()).toList();
    }
		data['tzzyTcrq'] = this.tzzyTcrq;
		if (this.sfzList != null) {
      data['sfzList'] =  this.sfzList.map((v) => v.toJson()).toList();
    }
		data['txCount'] = this.txCount;
		data['createdTime'] = this.createdTime;
		data['tzzyBz'] = this.tzzyBz;
		data['zsUpfiles'] = this.zsUpfiles;
		data['tzzyJcrq'] = this.tzzyJcrq;
		data['tzzyId'] = this.tzzyId;
		data['tzzyGzdd'] = this.tzzyGzdd;
		data['tzzyRyzt'] = this.tzzyRyzt;
		data['tzzySfzh'] = this.tzzySfzh;
		data['keyName'] = this.keyName;
		data['tzzyRyztQuery'] = this.tzzyRyztQuery;
		data['tzzyTcrqAfter'] = this.tzzyTcrqAfter;
		data['tzzyJszc'] = this.tzzyJszc;
		data['tzzyXb'] = this.tzzyXb;
		data['txFjwjYwjm'] = this.txFjwjYwjm;
		data['organName'] = this.organName;
		data['tzzyAqzs'] = this.tzzyAqzs;
		data['deletedFlag'] = this.deletedFlag;
		data['txUpfiles'] = this.txUpfiles;
		data['tzzyXm'] = this.tzzyXm;
		data['organId'] = this.organId;
		data['tzzyGz'] = this.tzzyGz;
		data['tzzyRygzQuery'] = this.tzzyRygzQuery;
		data['tzzyFzbm'] = this.tzzyFzbm;
		data['sfzCount'] = this.sfzCount;
		data['startDate'] = this.startDate;
		return data;
	}
}

class TzzyryDetailsDataZslist {
	dynamic modifiedTime;
	dynamic modifiedStaffName;
	dynamic createdStaffId;
	String fjwjYwjm;
	dynamic modifiedStaffId;
	dynamic organNo;
	int fjwjId;
	dynamic fjwjBms;
	String fjwjFwdz;
	dynamic fjwjWjms;
	int fjwjBmid;
	dynamic fjwjFwdzs;
	dynamic createdStaffName;
	dynamic currentUserId;
	int deletedFlag;
	String fjwjWjm;
	dynamic createdTime;
	String fjwjBm;
	dynamic fjwjIds;
	dynamic realPath;
	dynamic projectName;
	dynamic enterpriseName;
	dynamic staffId;
	dynamic fjwjYwjms;

	TzzyryDetailsDataZslist({this.modifiedTime, this.modifiedStaffName, this.createdStaffId, this.fjwjYwjm, this.modifiedStaffId, this.organNo, this.fjwjId, this.fjwjBms, this.fjwjFwdz, this.fjwjWjms, this.fjwjBmid, this.fjwjFwdzs, this.createdStaffName, this.currentUserId, this.deletedFlag, this.fjwjWjm, this.createdTime, this.fjwjBm, this.fjwjIds, this.realPath, this.projectName, this.enterpriseName, this.staffId, this.fjwjYwjms});

	TzzyryDetailsDataZslist.fromJson(Map<String, dynamic> json) {
		modifiedTime = json['modifiedTime'];
		modifiedStaffName = json['modifiedStaffName'];
		createdStaffId = json['createdStaffId'];
		fjwjYwjm = json['fjwjYwjm'];
		modifiedStaffId = json['modifiedStaffId'];
		organNo = json['organNo'];
		fjwjId = json['fjwjId'];
		fjwjBms = json['fjwjBms'];
		fjwjFwdz = json['fjwjFwdz'];
		fjwjWjms = json['fjwjWjms'];
		fjwjBmid = json['fjwjBmid'];
		fjwjFwdzs = json['fjwjFwdzs'];
		createdStaffName = json['createdStaffName'];
		currentUserId = json['currentUserId'];
		deletedFlag = json['deletedFlag'];
		fjwjWjm = json['fjwjWjm'];
		createdTime = json['createdTime'];
		fjwjBm = json['fjwjBm'];
		fjwjIds = json['fjwjIds'];
		realPath = json['realPath'];
		projectName = json['projectName'];
		enterpriseName = json['enterpriseName'];
		staffId = json['staffId'];
		fjwjYwjms = json['fjwjYwjms'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['modifiedTime'] = this.modifiedTime;
		data['modifiedStaffName'] = this.modifiedStaffName;
		data['createdStaffId'] = this.createdStaffId;
		data['fjwjYwjm'] = this.fjwjYwjm;
		data['modifiedStaffId'] = this.modifiedStaffId;
		data['organNo'] = this.organNo;
		data['fjwjId'] = this.fjwjId;
		data['fjwjBms'] = this.fjwjBms;
		data['fjwjFwdz'] = this.fjwjFwdz;
		data['fjwjWjms'] = this.fjwjWjms;
		data['fjwjBmid'] = this.fjwjBmid;
		data['fjwjFwdzs'] = this.fjwjFwdzs;
		data['createdStaffName'] = this.createdStaffName;
		data['currentUserId'] = this.currentUserId;
		data['deletedFlag'] = this.deletedFlag;
		data['fjwjWjm'] = this.fjwjWjm;
		data['createdTime'] = this.createdTime;
		data['fjwjBm'] = this.fjwjBm;
		data['fjwjIds'] = this.fjwjIds;
		data['realPath'] = this.realPath;
		data['projectName'] = this.projectName;
		data['enterpriseName'] = this.enterpriseName;
		data['staffId'] = this.staffId;
		data['fjwjYwjms'] = this.fjwjYwjms;
		return data;
	}
}

class TzzyryDetailsDataSfzlist {
	dynamic modifiedTime;
	dynamic modifiedStaffName;
	dynamic createdStaffId;
	String fjwjYwjm;
	dynamic modifiedStaffId;
	dynamic organNo;
	int fjwjId;
	dynamic fjwjBms;
	String fjwjFwdz;
	dynamic fjwjWjms;
	int fjwjBmid;
	dynamic fjwjFwdzs;
	dynamic createdStaffName;
	dynamic currentUserId;
	int deletedFlag;
	String fjwjWjm;
	dynamic createdTime;
	String fjwjBm;
	dynamic fjwjIds;
	dynamic realPath;
	dynamic projectName;
	dynamic enterpriseName;
	dynamic staffId;
	dynamic fjwjYwjms;

	TzzyryDetailsDataSfzlist({this.modifiedTime, this.modifiedStaffName, this.createdStaffId, this.fjwjYwjm, this.modifiedStaffId, this.organNo, this.fjwjId, this.fjwjBms, this.fjwjFwdz, this.fjwjWjms, this.fjwjBmid, this.fjwjFwdzs, this.createdStaffName, this.currentUserId, this.deletedFlag, this.fjwjWjm, this.createdTime, this.fjwjBm, this.fjwjIds, this.realPath, this.projectName, this.enterpriseName, this.staffId, this.fjwjYwjms});

	TzzyryDetailsDataSfzlist.fromJson(Map<String, dynamic> json) {
		modifiedTime = json['modifiedTime'];
		modifiedStaffName = json['modifiedStaffName'];
		createdStaffId = json['createdStaffId'];
		fjwjYwjm = json['fjwjYwjm'];
		modifiedStaffId = json['modifiedStaffId'];
		organNo = json['organNo'];
		fjwjId = json['fjwjId'];
		fjwjBms = json['fjwjBms'];
		fjwjFwdz = json['fjwjFwdz'];
		fjwjWjms = json['fjwjWjms'];
		fjwjBmid = json['fjwjBmid'];
		fjwjFwdzs = json['fjwjFwdzs'];
		createdStaffName = json['createdStaffName'];
		currentUserId = json['currentUserId'];
		deletedFlag = json['deletedFlag'];
		fjwjWjm = json['fjwjWjm'];
		createdTime = json['createdTime'];
		fjwjBm = json['fjwjBm'];
		fjwjIds = json['fjwjIds'];
		realPath = json['realPath'];
		projectName = json['projectName'];
		enterpriseName = json['enterpriseName'];
		staffId = json['staffId'];
		fjwjYwjms = json['fjwjYwjms'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['modifiedTime'] = this.modifiedTime;
		data['modifiedStaffName'] = this.modifiedStaffName;
		data['createdStaffId'] = this.createdStaffId;
		data['fjwjYwjm'] = this.fjwjYwjm;
		data['modifiedStaffId'] = this.modifiedStaffId;
		data['organNo'] = this.organNo;
		data['fjwjId'] = this.fjwjId;
		data['fjwjBms'] = this.fjwjBms;
		data['fjwjFwdz'] = this.fjwjFwdz;
		data['fjwjWjms'] = this.fjwjWjms;
		data['fjwjBmid'] = this.fjwjBmid;
		data['fjwjFwdzs'] = this.fjwjFwdzs;
		data['createdStaffName'] = this.createdStaffName;
		data['currentUserId'] = this.currentUserId;
		data['deletedFlag'] = this.deletedFlag;
		data['fjwjWjm'] = this.fjwjWjm;
		data['createdTime'] = this.createdTime;
		data['fjwjBm'] = this.fjwjBm;
		data['fjwjIds'] = this.fjwjIds;
		data['realPath'] = this.realPath;
		data['projectName'] = this.projectName;
		data['enterpriseName'] = this.enterpriseName;
		data['staffId'] = this.staffId;
		data['fjwjYwjms'] = this.fjwjYwjms;
		return data;
	}
}
