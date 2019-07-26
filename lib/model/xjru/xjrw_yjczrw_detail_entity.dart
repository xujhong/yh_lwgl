

class XjrwYjczrwDetailData {
	String staffName;
	int xjjlStatus;
	int xjjlId;
	List<XjrwYjczrwDetailDataFjwjlist> fjwjList;
	int zrwId;
	dynamic yhxxId;
	int staffId;
	String remark;
	String acturalTime;

	XjrwYjczrwDetailData({this.staffName, this.xjjlStatus, this.xjjlId, this.fjwjList, this.zrwId, this.yhxxId, this.staffId, this.remark, this.acturalTime});

	XjrwYjczrwDetailData.fromJson(Map<String, dynamic> json) {
		staffName = json['staff_name'];
		xjjlStatus = json['xjjl_status'];
		xjjlId = json['xjjl_id'];
		if (json['fjwjList'] != null) {
			fjwjList = new List<XjrwYjczrwDetailDataFjwjlist>();(json['fjwjList'] as List).forEach((v) { fjwjList.add(new XjrwYjczrwDetailDataFjwjlist.fromJson(v)); });
		}
		zrwId = json['zrw_id'];
		yhxxId = json['yhxxId'];
		staffId = json['staff_id'];
		remark = json['remark'];
		acturalTime = json['actural_time'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['staff_name'] = this.staffName;
		data['xjjl_status'] = this.xjjlStatus;
		data['xjjl_id'] = this.xjjlId;
		if (this.fjwjList != null) {
      data['fjwjList'] =  this.fjwjList.map((v) => v.toJson()).toList();
    }
		data['zrw_id'] = this.zrwId;
		data['yhxxId'] = this.yhxxId;
		data['staff_id'] = this.staffId;
		data['remark'] = this.remark;
		data['actural_time'] = this.acturalTime;
		return data;
	}
}

class XjrwYjczrwDetailDataFjwjlist {
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

	XjrwYjczrwDetailDataFjwjlist({this.modifiedTime, this.modifiedStaffName, this.createdStaffId, this.fjwjYwjm, this.modifiedStaffId, this.organNo, this.fjwjId, this.fjwjBms, this.fjwjFwdz, this.fjwjWjms, this.fjwjBmid, this.fjwjFwdzs, this.createdStaffName, this.currentUserId, this.deletedFlag, this.fjwjWjm, this.createdTime, this.fjwjBm, this.fjwjIds, this.realPath, this.projectName, this.enterpriseName, this.staffId, this.fjwjYwjms});

	XjrwYjczrwDetailDataFjwjlist.fromJson(Map<String, dynamic> json) {
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
