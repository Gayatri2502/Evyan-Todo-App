import 'package:get/get.dart';
import 'package:todo_app/presentation/add_task_form_screen/binding/task_form_binding.dart';
import 'package:todo_app/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:todo_app/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:todo_app/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:todo_app/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:todo_app/presentation/home_screen/binding/home_binding.dart';
import 'package:todo_app/presentation/home_screen/home_screen.dart';
import 'package:todo_app/presentation/language_screen/binding/language_binding.dart';
import 'package:todo_app/presentation/language_screen/language_screen.dart';
import 'package:todo_app/presentation/login_or_signup_screen/binding/login_or_signup_binding.dart';
import 'package:todo_app/presentation/login_or_signup_screen/login_or_signup_screen.dart';
import 'package:todo_app/presentation/login_screen/binding/login_binding.dart';
import 'package:todo_app/presentation/login_screen/login_screen.dart';
import 'package:todo_app/presentation/personality_screen/binding/personality_binding.dart';
import 'package:todo_app/presentation/personality_screen/personality_screen.dart';
import 'package:todo_app/presentation/settings_screen/binding/settings_binding.dart';
import 'package:todo_app/presentation/settings_screen/settings_screen.dart';
import 'package:todo_app/presentation/signup_screen/binding/signup_binding.dart';
import 'package:todo_app/presentation/signup_screen/signup_screen.dart';
import 'package:todo_app/presentation/task_list_screen/task_list_screen.dart';
import 'package:todo_app/presentation/termsandconditions_screen/binding/termsandconditions_binding.dart';
import 'package:todo_app/presentation/termsandconditions_screen/termsandconditions_screen.dart';
import 'package:todo_app/presentation/wish_list_screen/binding/wish_list_binding.dart';
import 'package:todo_app/presentation/wish_list_screen/wish_list_screen.dart';
import 'package:todo_app/presentation/work_today_screen/binding/work_today_binding.dart';
import 'package:todo_app/presentation/work_today_screen/work_today_screen.dart';
import 'package:todo_app/widgets/progress_time_picker.dart';

import '../presentation/add_task_form_screen/task_form_screen.dart';
import '../presentation/prioritise_screen/binding/prioritise_binding.dart';
import '../presentation/prioritise_screen/prioritise_screen.dart';
import '../presentation/scheduling_screen/binding/scheduling_binding.dart';
import '../presentation/scheduling_screen/scheduling_screen.dart';
import '../presentation/splash_screen/binding/adacana_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/task_list_screen/binding/task_list_binding.dart';
import '../presentation/task_views_screen/binding/task_views_binding.dart';
import '../presentation/task_views_screen/task_views_screen.dart';
import '../widgets/date_range_picker.dart';

class AppRoutes {
  static const String splashScreen = '/Splash_screen';

  static const String loginOrSignupScreen = '/login_or_signup_screen';

  static const String signupScreen = '/signup_screen';

  static const String loginScreen = '/login_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String homeScreen = '/home_screen';

  static const String personalityScreen = '/personality_screen';

  static const String workTodayScreen = '/work_today_screen';

  static const String wishListScreen = '/wish_list_screen';

  static const String settingsScreen = '/settings_screen';

  static const String languageScreen = '/language_screen';

  static const String termsandconditionsScreen = '/termsandconditions_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String calendarScreen = '/calendar_screen';

  static const String schedulingScreen = '/scheduling_screen';

  static const String myTaskScreen = '/task_list_screen';

  static const String prioritiseScreen = '/prioritise_screen';

  static const String taskAllocatorScreen = '/task_allocator_screen';

  static const String taskBlockerScreen = '/task_blocker_screen';

  static const String taskViewsScreen = '/task_views_screen';

  static const String longTermTask = '/time_duration_picker.dart';

  static const String taskFormScreen = '/task_form_screen';

  static const String progressTimePicker = '/progress_time_picker.dart';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: loginOrSignupScreen,
      page: () => LoginOrSignupScreen(),
      bindings: [
        LoginOrSignupBinding(),
      ],
    ),
    GetPage(
      name: signupScreen,
      page: () => SignupScreen(),
      bindings: [
        SignupBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: personalityScreen,
      page: () => PersonalityScreen(),
      bindings: [
        PersonalityBinding(),
      ],
    ),
    GetPage(
      name: workTodayScreen,
      page: () => WorkTodayScreen(),
      bindings: [
        WorkTodayBinding(),
      ],
    ),
    // GetPage(
    //     name: calendarScreen,
    //     page: () => CalendarScreen(),
    //     bindings: [CalendarScreenBinding()]),
    GetPage(
      name: wishListScreen,
      page: () => WishListScreen(),
      bindings: [
        WishListBinding(),
      ],
    ),
    GetPage(
      name: settingsScreen,
      page: () => SettingsScreen(),
      bindings: [
        SettingsBinding(),
      ],
    ),
    GetPage(
      name: languageScreen,
      page: () => LanguageScreen(),
      bindings: [
        LanguageBinding(),
      ],
    ),
    GetPage(
      name: termsandconditionsScreen,
      page: () => TermsandconditionsScreen(),
      bindings: [
        TermsandconditionsBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: schedulingScreen,
      page: () => SchedulingScreen(),
      bindings: [
        SchedulingBinding(),
      ],
    ),
    GetPage(
      name: taskViewsScreen,
      page: () => TaskViewsScreen(),
    ),
    GetPage(
      name: prioritiseScreen,
      page: () => PrioritiseScreen(),
      bindings: [
        PrioritiseBinding(),
      ],
    ),

    GetPage(
      name: taskViewsScreen,
      page: () => TaskViewsScreen(),
      bindings: [
        TaskViewsBinding(),
      ],
    ),

    GetPage(
      name: myTaskScreen,
      page: () => MyTaskScreen(),
      bindings: [
        TaskListBinding(),
      ],
    ),

    GetPage(
      name: longTermTask,
      page: () => LongTermTask(),
    ),
    GetPage(
      name: progressTimePicker,
      page: () => ProgressTimePickerWidget(),
    ),

    GetPage(
      name: taskFormScreen,
      page: () => TaskFormScreen(),
      bindings: [
        TaskFormBinding(),
      ],
    ),
  ];
}
