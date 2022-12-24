import 'package:get/get.dart';

class NavController extends GetxController {
  RxInt _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  set selectedIndex(int value) {
    _selectedIndex.value = value;
  }

  void onBackPressed() {}
}
