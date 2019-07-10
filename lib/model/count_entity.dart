
class CountData {
	int zcrs;
	int yjyrs;
	int hmds;
	int tcrs;
	int wgdrs;
	int wjyrs;
	int yjrs;

	CountData({this.zcrs, this.yjyrs, this.hmds, this.tcrs, this.wgdrs, this.wjyrs, this.yjrs});

	CountData.fromJson(Map<String, dynamic> json) {
		zcrs = json['zcrs'];
		yjyrs = json['yjyrs'];
		hmds = json['hmds'];
		tcrs = json['tcrs'];
		wgdrs = json['wgdrs'];
		wjyrs = json['wjyrs'];
		yjrs = json['yjrs'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['zcrs'] = this.zcrs;
		data['yjyrs'] = this.yjyrs;
		data['hmds'] = this.hmds;
		data['tcrs'] = this.tcrs;
		data['wgdrs'] = this.wgdrs;
		data['wjyrs'] = this.wjyrs;
		data['yjrs'] = this.yjrs;
		return data;
	}
}
