import 'package:AmbulaceBooking/view/screen/auth/login.dart';
import 'package:AmbulaceBooking/view/screen/auth/signup.dart';
import 'package:AmbulaceBooking/view/screen/page/admin/blockedpage.dart';
import 'package:AmbulaceBooking/view/screen/page/admin/homeadminpage.dart';
import 'package:AmbulaceBooking/view/screen/page/admin/userspage.dart';
import 'package:AmbulaceBooking/view/screen/page/driver/drivrecase.dart';
import 'package:AmbulaceBooking/view/screen/page/driver/homedriverpage.dart';
import 'package:AmbulaceBooking/view/screen/page/uesrs/bookcase.dart';
import 'package:AmbulaceBooking/view/screen/page/uesrs/home_User_Page.dart';
import 'package:AmbulaceBooking/view/screen/page/uesrs/profile_user.dart';
import 'package:AmbulaceBooking/view/screen/page/uesrs/record.dart';
import 'package:AmbulaceBooking/view/widget/page/itemofnewWidget.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:AmbulaceBooking/core/constant/routes.dart';
import 'package:AmbulaceBooking/core/midllware/mymidllware.dart';
import 'package:AmbulaceBooking/view/screen/languag.dart';

List<GetPage<dynamic>>? routes = [
  //Auth
  GetPage(name: "/", page: () => const Languag(), middlewares: [
    MymiDllWare(),
  ]),
  // GetPage(name: "/", page: () => const TestView()),
  // GetPage(name: AppRout.home, page: () => Homepage()),
  GetPage(name: AppRout.chang, page: () => const Languag()),
  GetPage(name: AppRout.signup, page: () => SignUp()),
  GetPage(name: AppRout.login, page: () => Login()),
  GetPage(name: AppRout.homepage, page: () => HomePage()),
  GetPage(name: AppRout.record, page: () => const RecordList()),
  GetPage(name: AppRout.bookcase, page: () => BookCace()),
  GetPage(name: AppRout.profileuser, page: () => Profile()),
  GetPage(name: AppRout.drivrecase, page: () =>  DriverCase()),
  GetPage(name: AppRout.homedriverpage, page: () => const Homedriver()),
  GetPage(name: AppRout.homeadminpage, page: () =>  HomeAdmin()),
  GetPage(name: AppRout.blockedpage, page: () =>  const Blockedpage()),
  GetPage(name: AppRout.userspage, page: () =>  const UsersPage()),
  GetPage(name: AppRout.itemofnewWidget, page: () =>  const NewDriverlist()),
];
