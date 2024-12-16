import 'package:get/get.dart';
import 'package:test_task/ui/home_screen/home_screen_bindings.dart';
import 'package:test_task/ui/home_screen/home_screen_page.dart';

class GetPages {
  static List<GetPage> allGetPages() => [
        GetPage(
          name: Routes.home,
          page: () => const HomeScreenPage(),
          binding: HomeScreenBindings(),
          transition: Transition.native,
          transitionDuration: const Duration(milliseconds: 300),
        ),
      ];
}

class Routes {
  static const home = '/home';
}
