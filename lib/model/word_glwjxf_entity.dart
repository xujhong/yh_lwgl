
///管理文件
class WordGlwjxfData {
	String modifiedTime;
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
	int modifiedStaffId;
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

	WordGlwjxfData({this.modifiedTime, this.modifiedStaffName, this.statusStr, this.organNo, this.feedbackResult, this.fjwjBmid, this.currentUserId, this.wjStatus, this.isNeedFeedback, this.createdTime, this.realPath, this.feedbackResultName, this.enterpriseName, this.fjwjYwjms, this.organs, this.createdStaffId, this.modifiedStaffId, this.keyName, this.fjwjBms, this.fjwjWjms, this.feedbackFlagName, this.fjwjFwdzs, this.createdStaffName, this.isNeedFeedbackName, this.statusList, this.wjName, this.deletedFlag, this.wjId, this.fjwjIds, this.projectName, this.staffId});

	WordGlwjxfData.fromJson(Map<String, dynamic> json) {
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
