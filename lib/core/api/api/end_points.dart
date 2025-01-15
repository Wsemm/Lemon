class EndPoint {
  static String baseUrl = "https://lemon-backend-kcmg.onrender.com/";
  //================== Auth =======================
  static String register = "auth/register";
  static String login = "auth/login";
  static String sendEmail = "auth/send-verification-otp";
  static String verifyEmail = "auth/verify-otp";
  static String changePassword = "/auth/change-password";
  static String forgetPassword = "/auth/forgot-password";
  static String resetPassword = "/auth/reset-password";

  //================== user =======================
  static String updateProfile = "/users/me";
  static String uploadImage = "/Upload";

  //================== products =======================
  static String getProducts = "/products";

  //================== stores =======================
  static String getStores = "/stores";
  static String storesSearch = "/stores/search/";
  static String storesTags = "/stores/tags";
  //================== Home =======================
  static String homeSections = "/home/sections";
  static String home = "/home";
  //================== Orders =======================
  static String myOrders = "/orders";
  static String orderCheckOut = "/orders/checkout";
  //================== Carts =======================
  static String getMyCart = "/carts/me";
  //================== notification =======================
  static String notification = "/notification";
}

class ApiKey {
  static String email = "email";
  static String message = "message";
  static String statusCode = "statusCode";
  static String accessToken = "accessToken";
  static String authorization = "Authorization";
  static String error = "error";

  // static String password = "password";
  // static String error = "error";

  // static String id = "id";
  // static String userid = "userid";
  // static String errorMessage = "ErrorMessage";
  // static String name = "name";
  // static String phone = "phone";
  // static String location = "location";
  // static String profilePic = "profilePic";
  // static String token = "token";
}
