
class LoginData {
	String birthday;
	dynamic unionid;
	String gender;
	String levelId;
	dynamic shieldG;
	String cover;
	String nick;
	String qrcodeUrl;
	String trueName;
	String integral;
	String lastTime;
	dynamic otherCover;
	String id;
	String email;
	String createTime;
	String customQrcodeStr;
	dynamic expiryDate;
	String token;
	String phone;
	String name;
	dynamic inviteCode;
	String describe;
	String pwd;
	dynamic shieldV;
	String age;
	String status;

	LoginData({this.birthday, this.unionid, this.gender, this.levelId, this.shieldG, this.cover, this.nick, this.qrcodeUrl, this.trueName, this.integral, this.lastTime, this.otherCover, this.id, this.email, this.createTime, this.customQrcodeStr, this.expiryDate, this.token, this.phone, this.name, this.inviteCode, this.describe, this.pwd, this.shieldV, this.age, this.status});

	LoginData.fromJson(Map<String, dynamic> json) {
		birthday = json['birthday'];
		unionid = json['unionid'];
		gender = json['gender'];
		levelId = json['level_id'];
		shieldG = json['shield_g'];
		cover = json['cover'];
		nick = json['nick'];
		qrcodeUrl = json['qrcode_url'];
		trueName = json['true_name'];
		integral = json['integral'];
		lastTime = json['last_time'];
		otherCover = json['other_cover'];
		id = json['id'];
		email = json['email'];
		createTime = json['create_time'];
		customQrcodeStr = json['custom_qrcode_str'];
		expiryDate = json['expiry_date'];
		token = json['token'];
		phone = json['phone'];
		name = json['name'];
		inviteCode = json['invite_code'];
		describe = json['describe'];
		pwd = json['pwd'];
		shieldV = json['shield_v'];
		age = json['age'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['birthday'] = this.birthday;
		data['unionid'] = this.unionid;
		data['gender'] = this.gender;
		data['level_id'] = this.levelId;
		data['shield_g'] = this.shieldG;
		data['cover'] = this.cover;
		data['nick'] = this.nick;
		data['qrcode_url'] = this.qrcodeUrl;
		data['true_name'] = this.trueName;
		data['integral'] = this.integral;
		data['last_time'] = this.lastTime;
		data['other_cover'] = this.otherCover;
		data['id'] = this.id;
		data['email'] = this.email;
		data['create_time'] = this.createTime;
		data['custom_qrcode_str'] = this.customQrcodeStr;
		data['expiry_date'] = this.expiryDate;
		data['token'] = this.token;
		data['phone'] = this.phone;
		data['name'] = this.name;
		data['invite_code'] = this.inviteCode;
		data['describe'] = this.describe;
		data['pwd'] = this.pwd;
		data['shield_v'] = this.shieldV;
		data['age'] = this.age;
		data['status'] = this.status;
		return data;
	}
}
