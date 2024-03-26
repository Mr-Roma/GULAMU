import 'package:get/get.dart';

class NavbarController extends GetxController {
  //TODO: Implement NavbarController

  int tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
