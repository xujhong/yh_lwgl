
class XjrwListData {
	int itemId;
	String xjrwName;
	dynamic itemJcbz;
	int xjrwId;
	String endTime;
	int zybwId;
	String zybwMc;
	dynamic itemYzdj;
	int zrwStatus;
	dynamic zrwYhtm;
	String startTime;
	String organName;
	int zrwId;
	String zrwJclx;
	String staffId;
	String staffName;
	int zrwYjcs;
	int zrwJccs;
	int zrwWjcs;
	int organId;

	XjrwListData({this.itemId, this.xjrwName, this.itemJcbz, this.xjrwId, this.endTime, this.zybwId, this.zybwMc, this.itemYzdj, this.zrwStatus, this.zrwYhtm, this.startTime, this.organName, this.zrwId, this.zrwJclx, this.staffId, this.staffName, this.zrwYjcs, this.zrwJccs, this.zrwWjcs, this.organId});

	XjrwListData.fromJson(Map<String, dynamic> json) {
		itemId = json['item_id'];
		xjrwName = json['xjrw_name'];
		itemJcbz = json['item_jcbz'];
		xjrwId = json['xjrw_id'];
		endTime = json['end_time'];
		zybwId = json['zybw_id'];
		zybwMc = json['zybw_mc'];
		itemYzdj = json['item_yzdj'];
		zrwStatus = json['zrw_status'];
		zrwYhtm = json['zrw_yhtm'];
		startTime = json['start_time'];
		organName = json['organ_name'];
		zrwId = json['zrw_id'];
		zrwJclx = json['zrw_jclx'];
		staffId = json['staff_id'];
		staffName = json['staffName'];
		zrwYjcs = json['zrw_yjcs'];
		zrwJccs = json['zrw_jccs'];
		zrwWjcs = json['zrw_wjcs'];
		organId = json['organ_id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['item_id'] = this.itemId;
		data['xjrw_name'] = this.xjrwName;
		data['item_jcbz'] = this.itemJcbz;
		data['xjrw_id'] = this.xjrwId;
		data['end_time'] = this.endTime;
		data['zybw_id'] = this.zybwId;
		data['zybw_mc'] = this.zybwMc;
		data['item_yzdj'] = this.itemYzdj;
		data['zrw_status'] = this.zrwStatus;
		data['zrw_yhtm'] = this.zrwYhtm;
		data['start_time'] = this.startTime;
		data['organ_name'] = this.organName;
		data['zrw_id'] = this.zrwId;
		data['zrw_jclx'] = this.zrwJclx;
		data['staff_id'] = this.staffId;
		data['staffName'] = this.staffName;
		data['zrw_yjcs'] = this.zrwYjcs;
		data['zrw_jccs'] = this.zrwJccs;
		data['zrw_wjcs'] = this.zrwWjcs;
		data['organ_id'] = this.organId;
		return data;
	}
}
