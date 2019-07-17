

class GlwjxfdatailData {
	List<GlwjxfdatailDataFjwjlist> fjwjList;
	GlwjxfdatailDataGlwj glwj;
	List<GlwjxfdatailDataGlwjxq> glwjxq;

	GlwjxfdatailData({this.fjwjList, this.glwj, this.glwjxq});

	GlwjxfdatailData.fromJson(Map<String, dynamic> json) {
		if (json['fjwjList'] != null) {
			fjwjList = new List<GlwjxfdatailDataFjwjlist>();(json['fjwjList'] as List).forEach((v) { fjwjList.add(new GlwjxfdatailDataFjwjlist.fromJson(v)); });
		}
		glwj = json['glwj'] != null ? new GlwjxfdatailDataGlwj.fromJson(json['glwj']) : null;
		if (json['glwjxq'] != null) {
			glwjxq = new List<GlwjxfdatailDataGlwjxq>();(json['glwjxq'] as List).forEach((v) { glwjxq.add(new GlwjxfdatailDataGlwjxq.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.fjwjList != null) {
      data['fjwjList'] =  this.fjwjList.map((v) => v.toJson()).toList();
    }
		if (this.glwj != null) {
      data['glwj'] = this.glwj.toJson();
    }
		if (this.glwjxq != null) {
      data['glwjxq'] =  this.glwjxq.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class GlwjxfdatailDataFjwjlist {
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

	GlwjxfdatailDataFjwjlist({this.modifiedTime, this.modifiedStaffName, this.createdStaffId, this.fjwjYwjm, this.modifiedStaffId, this.organNo, this.fjwjId, this.fjwjBms, this.fjwjFwdz, this.fjwjWjms, this.fjwjBmid, this.fjwjFwdzs, this.createdStaffName, this.currentUserId, this.deletedFlag, this.fjwjWjm, this.createdTime, this.fjwjBm, this.fjwjIds, this.realPath, this.projectName, this.enterpriseName, this.staffId, this.fjwjYwjms});

	GlwjxfdatailDataFjwjlist.fromJson(Map<String, dynamic> json) {
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

class GlwjxfdatailDataGlwj {
	dynamic modifiedTime;
	dynamic modifiedStaffName;
	dynamic statusStr;
	dynamic organNo;
	int feedbackResult;
	dynamic fjwjBmid;
	dynamic currentUserId;
	int wjStatus;
	int isNeedFeedback;
	String createdTime;
	dynamic realPath;
	String feedbackResultName;
	dynamic enterpriseName;
	dynamic fjwjYwjms;
	dynamic organs;
	int createdStaffId;
	dynamic modifiedStaffId;
	dynamic keyName;
	dynamic fjwjBms;
	dynamic fjwjWjms;
	dynamic feedbackFlagName;
	dynamic fjwjFwdzs;
	String createdStaffName;
	String isNeedFeedbackName;
	dynamic statusList;
	String wjName;
	int deletedFlag;
	int wjId;
	dynamic fjwjIds;
	dynamic projectName;
	dynamic staffId;

	GlwjxfdatailDataGlwj({this.modifiedTime, this.modifiedStaffName, this.statusStr, this.organNo, this.feedbackResult, this.fjwjBmid, this.currentUserId, this.wjStatus, this.isNeedFeedback, this.createdTime, this.realPath, this.feedbackResultName, this.enterpriseName, this.fjwjYwjms, this.organs, this.createdStaffId, this.modifiedStaffId, this.keyName, this.fjwjBms, this.fjwjWjms, this.feedbackFlagName, this.fjwjFwdzs, this.createdStaffName, this.isNeedFeedbackName, this.statusList, this.wjName, this.deletedFlag, this.wjId, this.fjwjIds, this.projectName, this.staffId});

	GlwjxfdatailDataGlwj.fromJson(Map<String, dynamic> json) {
		modifiedTime = json['modifiedTime'];
		modifiedStaffName = json['modifiedStaffName'];
		statusStr = json['statusStr'];
		organNo = json['organNo'];
		feedbackResult = json['feedbackResult'];
		fjwjBmid = json['fjwjBmid'];
		currentUserId = json['currentUserId'];
		wjStatus = json['wjStatus'];
		isNeedFeedback = json['isNeedFeedback'];
		createdTime = json['createdTime'];
		realPath = json['realPath'];
		feedbackResultName = json['feedbackResultName'];
		enterpriseName = json['enterpriseName'];
		fjwjYwjms = json['fjwjYwjms'];
		organs = json['organs'];
		createdStaffId = json['createdStaffId'];
		modifiedStaffId = json['modifiedStaffId'];
		keyName = json['keyName'];
		fjwjBms = json['fjwjBms'];
		fjwjWjms = json['fjwjWjms'];
		feedbackFlagName = json['feedbackFlagName'];
		fjwjFwdzs = json['fjwjFwdzs'];
		createdStaffName = json['createdStaffName'];
		isNeedFeedbackName = json['isNeedFeedbackName'];
		statusList = json['statusList'];
		wjName = json['wjName'];
		deletedFlag = json['deletedFlag'];
		wjId = json['wjId'];
		fjwjIds = json['fjwjIds'];
		projectName = json['projectName'];
		staffId = json['staffId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['modifiedTime'] = this.modifiedTime;
		data['modifiedStaffName'] = this.modifiedStaffName;
		data['statusStr'] = this.statusStr;
		data['organNo'] = this.organNo;
		data['feedbackResult'] = this.feedbackResult;
		data['fjwjBmid'] = this.fjwjBmid;
		data['currentUserId'] = this.currentUserId;
		data['wjStatus'] = this.wjStatus;
		data['isNeedFeedback'] = this.isNeedFeedback;
		data['createdTime'] = this.createdTime;
		data['realPath'] = this.realPath;
		data['feedbackResultName'] = this.feedbackResultName;
		data['enterpriseName'] = this.enterpriseName;
		data['fjwjYwjms'] = this.fjwjYwjms;
		data['organs'] = this.organs;
		data['createdStaffId'] = this.createdStaffId;
		data['modifiedStaffId'] = this.modifiedStaffId;
		data['keyName'] = this.keyName;
		data['fjwjBms'] = this.fjwjBms;
		data['fjwjWjms'] = this.fjwjWjms;
		data['feedbackFlagName'] = this.feedbackFlagName;
		data['fjwjFwdzs'] = this.fjwjFwdzs;
		data['createdStaffName'] = this.createdStaffName;
		data['isNeedFeedbackName'] = this.isNeedFeedbackName;
		data['statusList'] = this.statusList;
		data['wjName'] = this.wjName;
		data['deletedFlag'] = this.deletedFlag;
		data['wjId'] = this.wjId;
		data['fjwjIds'] = this.fjwjIds;
		data['projectName'] = this.projectName;
		data['staffId'] = this.staffId;
		return data;
	}
}

class GlwjxfdatailDataGlwjxq {
	String modifiedTime;
	String modifiedStaffName;
	dynamic statusStr;
	dynamic organNo;
	int isRead;
	String readTime;
	int xqId;
	dynamic feedbackFlag;
	dynamic fjwjBmid;
	dynamic currentUserId;
	dynamic createdTime;
	String feedbackMessage;
	dynamic realPath;
	dynamic enterpriseName;
	dynamic fjwjYwjms;
	dynamic createdStaffId;
	dynamic modifiedStaffId;
	String isReadStr;
	dynamic keyName;
	dynamic fjwjBms;
	dynamic fjwjWjms;
	String readPersonName;
	dynamic feedbackFlagName;
	dynamic fjwjFwdzs;
	dynamic createdStaffName;
	String organName;
	List<GlwjxfdatailDataGlwjxqFjlist> fjlist;
	dynamic wjName;
	dynamic deletedFlag;
	int readPerson;
	int wjId;
	int organId;
	dynamic fjwjIds;
	dynamic projectName;
	dynamic staffId;

	GlwjxfdatailDataGlwjxq({this.modifiedTime, this.modifiedStaffName, this.statusStr, this.organNo, this.isRead, this.readTime, this.xqId, this.feedbackFlag, this.fjwjBmid, this.currentUserId, this.createdTime, this.feedbackMessage, this.realPath, this.enterpriseName, this.fjwjYwjms, this.createdStaffId, this.modifiedStaffId, this.isReadStr, this.keyName, this.fjwjBms, this.fjwjWjms, this.readPersonName, this.feedbackFlagName, this.fjwjFwdzs, this.createdStaffName, this.organName, this.fjlist, this.wjName, this.deletedFlag, this.readPerson, this.wjId, this.organId, this.fjwjIds, this.projectName, this.staffId});

	GlwjxfdatailDataGlwjxq.fromJson(Map<String, dynamic> json) {
		modifiedTime = json['modifiedTime'];
		modifiedStaffName = json['modifiedStaffName'];
		statusStr = json['statusStr'];
		organNo = json['organNo'];
		isRead = json['isRead'];
		readTime = json['readTime'];
		xqId = json['xqId'];
		feedbackFlag = json['feedbackFlag'];
		fjwjBmid = json['fjwjBmid'];
		currentUserId = json['currentUserId'];
		createdTime = json['createdTime'];
		feedbackMessage = json['feedbackMessage'];
		realPath = json['realPath'];
		enterpriseName = json['enterpriseName'];
		fjwjYwjms = json['fjwjYwjms'];
		createdStaffId = json['createdStaffId'];
		modifiedStaffId = json['modifiedStaffId'];
		isReadStr = json['isReadStr'];
		keyName = json['keyName'];
		fjwjBms = json['fjwjBms'];
		fjwjWjms = json['fjwjWjms'];
		readPersonName = json['readPersonName'];
		feedbackFlagName = json['feedbackFlagName'];
		fjwjFwdzs = json['fjwjFwdzs'];
		createdStaffName = json['createdStaffName'];
		organName = json['organName'];
		if (json['fjlist'] != null) {
			fjlist = new List<GlwjxfdatailDataGlwjxqFjlist>();(json['fjlist'] as List).forEach((v) { fjlist.add(new GlwjxfdatailDataGlwjxqFjlist.fromJson(v)); });
		}
		wjName = json['wjName'];
		deletedFlag = json['deletedFlag'];
		readPerson = json['readPerson'];
		wjId = json['wjId'];
		organId = json['organId'];
		fjwjIds = json['fjwjIds'];
		projectName = json['projectName'];
		staffId = json['staffId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['modifiedTime'] = this.modifiedTime;
		data['modifiedStaffName'] = this.modifiedStaffName;
		data['statusStr'] = this.statusStr;
		data['organNo'] = this.organNo;
		data['isRead'] = this.isRead;
		data['readTime'] = this.readTime;
		data['xqId'] = this.xqId;
		data['feedbackFlag'] = this.feedbackFlag;
		data['fjwjBmid'] = this.fjwjBmid;
		data['currentUserId'] = this.currentUserId;
		data['createdTime'] = this.createdTime;
		data['feedbackMessage'] = this.feedbackMessage;
		data['realPath'] = this.realPath;
		data['enterpriseName'] = this.enterpriseName;
		data['fjwjYwjms'] = this.fjwjYwjms;
		data['createdStaffId'] = this.createdStaffId;
		data['modifiedStaffId'] = this.modifiedStaffId;
		data['isReadStr'] = this.isReadStr;
		data['keyName'] = this.keyName;
		data['fjwjBms'] = this.fjwjBms;
		data['fjwjWjms'] = this.fjwjWjms;
		data['readPersonName'] = this.readPersonName;
		data['feedbackFlagName'] = this.feedbackFlagName;
		data['fjwjFwdzs'] = this.fjwjFwdzs;
		data['createdStaffName'] = this.createdStaffName;
		data['organName'] = this.organName;
		if (this.fjlist != null) {
      data['fjlist'] =  this.fjlist.map((v) => v.toJson()).toList();
    }
		data['wjName'] = this.wjName;
		data['deletedFlag'] = this.deletedFlag;
		data['readPerson'] = this.readPerson;
		data['wjId'] = this.wjId;
		data['organId'] = this.organId;
		data['fjwjIds'] = this.fjwjIds;
		data['projectName'] = this.projectName;
		data['staffId'] = this.staffId;
		return data;
	}
}

class GlwjxfdatailDataGlwjxqFjlist {
	dynamic modifiedTime;
	dynamic modifiedStaffName;
	dynamic createdStaffId;
	String fjwjYwjm;
	dynamic modifiedStaffId;
	dynamic organNo;
	dynamic fjwjId;
	dynamic fjwjBms;
	String fjwjFwdz;
	dynamic fjwjWjms;
	int fjwjBmid;
	dynamic fjwjFwdzs;
	dynamic createdStaffName;
	dynamic currentUserId;
	dynamic deletedFlag;
	String fjwjWjm;
	dynamic createdTime;
	String fjwjBm;
	dynamic fjwjIds;
	dynamic realPath;
	dynamic projectName;
	dynamic enterpriseName;
	dynamic staffId;
	dynamic fjwjYwjms;

	GlwjxfdatailDataGlwjxqFjlist({this.modifiedTime, this.modifiedStaffName, this.createdStaffId, this.fjwjYwjm, this.modifiedStaffId, this.organNo, this.fjwjId, this.fjwjBms, this.fjwjFwdz, this.fjwjWjms, this.fjwjBmid, this.fjwjFwdzs, this.createdStaffName, this.currentUserId, this.deletedFlag, this.fjwjWjm, this.createdTime, this.fjwjBm, this.fjwjIds, this.realPath, this.projectName, this.enterpriseName, this.staffId, this.fjwjYwjms});

	GlwjxfdatailDataGlwjxqFjlist.fromJson(Map<String, dynamic> json) {
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
