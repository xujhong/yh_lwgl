
class BaseEntity<T>{

  int code;
  String msg;
  T data;
  
  BaseEntity(this.code, this.msg, this.data);
}