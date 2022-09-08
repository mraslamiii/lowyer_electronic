

class ApiResponse<T> {

  String? status;
  T? data;
  String? message;

  ApiResponse(this.status,this.data,this.message);


  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}