
class SlryDetailData {
	dynamic modifiedTime;
	int zwId;
	String slryFzbm;
	dynamic endDate;
	dynamic modifiedStaffid;
	dynamic organNo;
	String slryFzrq;
	String zwName;
	dynamic slryTcrqAfter;
	dynamic tableName;
	int zsCount;
	dynamic currentUserId;
	List<SlryDetailDataSfzlist> sfzList;
	dynamic fjwjYwjmss;
	int txCount;
	String createdTime;
	String slryJcrq;
	dynamic createdStaffId;
	dynamic fjwjBms;
	dynamic fjwjFwdzs;
	String slryJszc;
	dynamic ryzwQuery;
	int organId;
	dynamic ryztQuery;
	dynamic projectName;
	String slryBz;
	int sfzCount;
	dynamic startDate;
	dynamic modifiedStaffName;
	int createdStaffid;
	dynamic sfzUpfiles;
	dynamic fjwjWjmss;
	String txFjwjFwdz;
	dynamic fjwjBmid;
	dynamic slryTcrq;
	List<SlryDetailDataZslist> zsList;
	String slryFsrq;
	dynamic realPath;
	dynamic enterpriseName;
	dynamic fjwjYwjms;
	String slrySfzh;
	dynamic zsUpfiles;
	int slryRyzt;
	dynamic modifiedStaffId;
	dynamic keyName;
	dynamic fjwjWjms;
	String txFjwjYwjm;
	dynamic createdStaffName;
	String organName;
	String slryAqzs;
	int deletedFlag;
	dynamic txUpfiles;
	String fjwjFwdzss;
	String tzzyXm;
	dynamic fjwjIds;
	dynamic staffId;
	int slryId;

	SlryDetailData({this.modifiedTime, this.zwId, this.slryFzbm, this.endDate, this.modifiedStaffid, this.organNo, this.slryFzrq, this.zwName, this.slryTcrqAfter, this.tableName, this.zsCount, this.currentUserId, this.sfzList, this.fjwjYwjmss, this.txCount, this.createdTime, this.slryJcrq, this.createdStaffId, this.fjwjBms, this.fjwjFwdzs, this.slryJszc, this.ryzwQuery, this.organId, this.ryztQuery, this.projectName, this.slryBz, this.sfzCount, this.startDate, this.modifiedStaffName, this.createdStaffid, this.sfzUpfiles, this.fjwjWjmss, this.txFjwjFwdz, this.fjwjBmid, this.slryTcrq, this.zsList, this.slryFsrq, this.realPath, this.enterpriseName, this.fjwjYwjms, this.slrySfzh, this.zsUpfiles, this.slryRyzt, this.modifiedStaffId, this.keyName, this.fjwjWjms, this.txFjwjYwjm, this.createdStaffName, this.organName, this.slryAqzs, this.deletedFlag, this.txUpfiles, this.fjwjFwdzss, this.tzzyXm, this.fjwjIds, this.staffId, this.slryId});

	SlryDetailData.fromJson(Map<String, dynamic> json) {
		modifiedTime = json['modifiedTime'];
		zwId = json['zwId'];
		slryFzbm = json['slryFzbm'];
		endDate = json['endDate'];
		modifiedStaffid = json['modifiedStaffid'];
		organNo = json['organNo'];
		slryFzrq = json['slryFzrq'];
		zwName = json['zwName'];
		slryTcrqAfter = json['slryTcrqAfter'];
		tableName = json['tableName'];
		zsCount = json['zsCount'];
		currentUserId = json['currentUserId'];
		if (json['sfzList'] != null) {
			sfzList = new List<SlryDetailDataSfzlist>();(json['sfzList'] as List).forEach((v) { sfzList.add(new SlryDetailDataSfzlist.fromJson(v)); });
		}
		fjwjYwjmss = json['fjwj_ywjmss'];
		txCount = json['txCount'];
		createdTime = json['createdTime'];
		slryJcrq = json['slryJcrq'];
		createdStaffId = json['createdStaffId'];
		fjwjBms = json['fjwjBms'];
		fjwjFwdzs = json['fjwjFwdzs'];
		slryJszc = json['slryJszc'];
		ryzwQuery = json['ryzwQuery'];
		organId = json['organId'];
		ryztQuery = json['ryztQuery'];
		projectName = json['projectName'];
		slryBz = json['slryBz'];
		sfzCount = json['sfzCount'];
		startDate = json['startDate'];
		modifiedStaffName = json['modifiedStaffName'];
		createdStaffid = json['createdStaffid'];
		sfzUpfiles = json['sfzUpfiles'];
		fjwjWjmss = json['fjwj_wjmss'];
		txFjwjFwdz = json['txFjwjFwdz'];
		fjwjBmid = json['fjwjBmid'];
		slryTcrq = json['slryTcrq'];
		if (json['zsList'] != null) {
			zsList = new List<SlryDetailDataZslist>();(json['zsList'] as List).forEach((v) { zsList.add(new SlryDetailDataZslist.fromJson(v)); });
		}
		slryFsrq = json['slryFsrq'];
		realPath = json['realPath'];
		enterpriseName = json['enterpriseName'];
		fjwjYwjms = json['fjwjYwjms'];
		slrySfzh = json['slrySfzh'];
		zsUpfiles = json['zsUpfiles'];
		slryRyzt = json['slryRyzt'];
		modifiedStaffId = json['modifiedStaffId'];
		keyName = json['keyName'];
		fjwjWjms = json['fjwjWjms'];
		txFjwjYwjm = json['txFjwjYwjm'];
		createdStaffName = json['createdStaffName'];
		organName = json['organName'];
		slryAqzs = json['slryAqzs'];
		deletedFlag = json['deletedFlag'];
		txUpfiles = json['txUpfiles'];
		fjwjFwdzss = json['fjwjFwdzss'];
		tzzyXm = json['tzzyXm'];
		fjwjIds = json['fjwjIds'];
		staffId = json['staffId'];
		slryId = json['slryId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['modifiedTime'] = this.modifiedTime;
		data['zwId'] = this.zwId;
		data['slryFzbm'] = this.slryFzbm;
		data['endDate'] = this.endDate;
		data['modifiedStaffid'] = this.modifiedStaffid;
		data['organNo'] = this.organNo;
		data['slryFzrq'] = this.slryFzrq;
		data['zwName'] = this.zwName;
		data['slryTcrqAfter'] = this.slryTcrqAfter;
		data['tableName'] = this.tableName;
		data['zsCount'] = this.zsCount;
		data['currentUserId'] = this.currentUserId;
		if (this.sfzList != null) {
      data['sfzList'] =  this.sfzList.map((v) => v.toJson()).toList();
    }
		data['fjwj_ywjmss'] = this.fjwjYwjmss;
		data['txCount'] = this.txCount;
		data['createdTime'] = this.createdTime;
		data['slryJcrq'] = this.slryJcrq;
		data['createdStaffId'] = this.createdStaffId;
		data['fjwjBms'] = this.fjwjBms;
		data['fjwjFwdzs'] = this.fjwjFwdzs;
		data['slryJszc'] = this.slryJszc;
		data['ryzwQuery'] = this.ryzwQuery;
		data['organId'] = this.organId;
		data['ryztQuery'] = this.ryztQuery;
		data['projectName'] = this.projectName;
		data['slryBz'] = this.slryBz;
		data['sfzCount'] = this.sfzCount;
		data['startDate'] = this.startDate;
		data['modifiedStaffName'] = this.modifiedStaffName;
		data['createdStaffid'] = this.createdStaffid;
		data['sfzUpfiles'] = this.sfzUpfiles;
		data['fjwj_wjmss'] = this.fjwjWjmss;
		data['txFjwjFwdz'] = this.txFjwjFwdz;
		data['fjwjBmid'] = this.fjwjBmid;
		data['slryTcrq'] = this.slryTcrq;
		if (this.zsList != null) {
      data['zsList'] =  this.zsList.map((v) => v.toJson()).toList();
    }
		data['slryFsrq'] = this.slryFsrq;
		data['realPath'] = this.realPath;
		data['enterpriseName'] = this.enterpriseName;
		data['fjwjYwjms'] = this.fjwjYwjms;
		data['slrySfzh'] = this.slrySfzh;
		data['zsUpfiles'] = this.zsUpfiles;
		data['slryRyzt'] = this.slryRyzt;
		data['modifiedStaffId'] = this.modifiedStaffId;
		data['keyName'] = this.keyName;
		data['fjwjWjms'] = this.fjwjWjms;
		data['txFjwjYwjm'] = this.txFjwjYwjm;
		data['createdStaffName'] = this.createdStaffName;
		data['organName'] = this.organName;
		data['slryAqzs'] = this.slryAqzs;
		data['deletedFlag'] = this.deletedFlag;
		data['txUpfiles'] = this.txUpfiles;
		data['fjwjFwdzss'] = this.fjwjFwdzss;
		data['tzzyXm'] = this.tzzyXm;
		data['fjwjIds'] = this.fjwjIds;
		data['staffId'] = this.staffId;
		data['slryId'] = this.slryId;
		return data;
	}
}

class SlryDetailDataSfzlist {
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
	String createdTime;
	String fjwjBm;
	dynamic fjwjIds;
	dynamic realPath;
	dynamic projectName;
	dynamic enterpriseName;
	dynamic staffId;
	dynamic fjwjYwjms;

	SlryDetailDataSfzlist({this.modifiedTime, this.modifiedStaffName, this.createdStaffId, this.fjwjYwjm, this.modifiedStaffId, this.organNo, this.fjwjId, this.fjwjBms, this.fjwjFwdz, this.fjwjWjms, this.fjwjBmid, this.fjwjFwdzs, this.createdStaffName, this.currentUserId, this.deletedFlag, this.fjwjWjm, this.createdTime, this.fjwjBm, this.fjwjIds, this.realPath, this.projectName, this.enterpriseName, this.staffId, this.fjwjYwjms});

	SlryDetailDataSfzlist.fromJson(Map<String, dynamic> json) {
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

class SlryDetailDataZslist {
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
	String createdTime;
	String fjwjBm;
	dynamic fjwjIds;
	String realPath;
	dynamic projectName;
	dynamic enterpriseName;
	dynamic staffId;
	dynamic fjwjYwjms;

	SlryDetailDataZslist({this.modifiedTime, this.modifiedStaffName, this.createdStaffId, this.fjwjYwjm, this.modifiedStaffId, this.organNo, this.fjwjId, this.fjwjBms, this.fjwjFwdz, this.fjwjWjms, this.fjwjBmid, this.fjwjFwdzs, this.createdStaffName, this.currentUserId, this.deletedFlag, this.fjwjWjm, this.createdTime, this.fjwjBm, this.fjwjIds, this.realPath, this.projectName, this.enterpriseName, this.staffId, this.fjwjYwjms});

	SlryDetailDataZslist.fromJson(Map<String, dynamic> json) {
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
