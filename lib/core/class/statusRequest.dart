enum StatusRequest {
  none,
  loading,
  sucess,
  failuer,
  serverFailuer,
  serverExciption,
  offlineFailuer,
}

serverFailuer(statusRequest,message) {
  print("=============================================");
  print("message:${message}");
  print("statusRequest:${statusRequest}");
  print("=============================================");

}
