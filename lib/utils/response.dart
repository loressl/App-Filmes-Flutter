class GenericResponse<T>{
  bool status;
  String msg;

  final T result;

  GenericResponse(this.status, {this.msg, this.result});

  isOk(){
    return status;
  }

  @override
  String toString() {
    return "Response{ok: $status, msg: $msg, result:$result}";
  }
}
