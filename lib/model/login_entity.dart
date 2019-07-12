

class LoginData {
	int roleKind;
	String clientType;
	int roleId;
	String staffTel;
	dynamic roleName;
	String staffName;
	String registrationId;
	int organId;
	int staffId;
	String staffAcct;

	LoginData({this.roleKind, this.clientType, this.roleId, this.staffTel, this.roleName, this.staffName, this.registrationId, this.organId, this.staffId, this.staffAcct});

	LoginData.fromJson(Map<String, dynamic> json) {
		roleKind = json['roleKind'];
		clientType = json['clientType'];
		roleId = json['roleId'];
		staffTel = json['staffTel'];
		roleName = json['roleName'];
		staffName = json['staffName'];
		registrationId = json['registrationId'];
		organId = json['organId'];
		staffId = json['staffId'];
		staffAcct = json['staffAcct'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['roleKind'] = this.roleKind;
		data['clientType'] = this.clientType;
		data['roleId'] = this.roleId;
		data['staffTel'] = this.staffTel;
		data['roleName'] = this.roleName;
		data['staffName'] = this.staffName;
		data['registrationId'] = this.registrationId;
		data['organId'] = this.organId;
		data['staffId'] = this.staffId;
		data['staffAcct'] = this.staffAcct;
		return data;
	}
}
