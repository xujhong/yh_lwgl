class BaseDTO {
  int errorCode;
  String errorMsg;
  dynamic data;

  BaseDTO({this.errorCode, this.errorMsg, this.data});

  BaseDTO.fromJson(Map<String, dynamic> json) {
    errorCode = json['code'];
    errorMsg = json['msg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.errorCode;
    data['msg'] = this.errorMsg;
    data['data'] = this.data;
    return data;
  }
}
