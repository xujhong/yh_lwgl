
class XjrwCountData {
	int zybwId;
	int zrwCount;
	String zybwMc;

	XjrwCountData({this.zybwId, this.zrwCount, this.zybwMc});

	XjrwCountData.fromJson(Map<String, dynamic> json) {
		zybwId = json['zybw_id'];
		zrwCount = json['zrwCount'];
		zybwMc = json['zybw_mc'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['zybw_id'] = this.zybwId;
		data['zrwCount'] = this.zrwCount;
		data['zybw_mc'] = this.zybwMc;
		return data;
	}
}
