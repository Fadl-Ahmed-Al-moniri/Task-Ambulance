class AppLink {
  static const String _server = "http://192.168.1.100/ambulanceConnection";
  static const String linkImages =
      "http://192.168.1.100/ambulanceConnection/upload/";
  static const String imgCNIC =
      "http://192.168.1.100/ambulanceConnection/img/imgcinc";
  static const String imgStatus =
      "http://192.168.1.100/ambulanceConnection/img/imgStatus";
  static const String _operation = "$_server/operation";
  // // ==========================================Auth==================
  static const String signUp = "$_server/auth/signup.php";
  static const String login = "$_server/auth/login.php";
  // ==========================================User==================
  static const String _usres = "$_operation/usres";
  static const String addbookinguser = "$_usres/add_book.php";
  static const String getBookingusres = "$_usres/view_by_bookingStatus.php";
  static const String getdatauser = "$_operation/usres/view_usersByuserid.php";
  // ==========================================Driver==================
  static const String _driver = "$_operation/drivre";
  static const String getBookingDriver = "$_driver/viewBookingStaus.php";
  static const String setBookingStausDriver = "$_driver/setBookingStaus.php";
  // // ==========================================Admin==================
  static const String _admin = "$_operation/admin";
  static const String getallData = "$_admin/viewallActive.php";
  static const String getallDatabyemail = "$_admin/viewbyemail.php";
}
