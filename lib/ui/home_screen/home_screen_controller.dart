import 'dart:math';

import 'package:get/get.dart';
import 'package:test_task/assets/colors/app_colors.dart';
import 'package:test_task/data/wifi_lists.dart';

class HomeScreenController extends GetxController {
  final RxList<String> displayedWiFiNames = RxList<String>([]);
  final RxBool isPasswordVisible = RxBool(false);
  final RxString password = RxString('');

  final Random _random = Random();

  @override
  void onInit() {
    super.onInit();
    generateRandomWiFiList();
  }

  // Generate a random list of 6 or 7 Wi-Fi names and shuffle them
  void generateRandomWiFiList() {
    final allWiFiNames = WifiData.allWiFiNames;
    displayedWiFiNames.clear();

    // Randomly choose 6 or 7 items
    int numberOfItems = _random.nextBool() ? 6 : 7;

    // Shuffle the list and pick items
    allWiFiNames.shuffle();
    displayedWiFiNames.addAll(allWiFiNames.take(numberOfItems));
  }

  void onPasswordVisibilityChanged() {
    isPasswordVisible.toggle();
  }

  void onPasswordChanged(final String value) {
    password.value = value;
  }

  void showSuccessSnackbar() {
    Get.showSnackbar(
      const GetSnackBar(
        title: 'Verbunden',
        message: 'Erfolgreich verbunden',
        backgroundColor: AppColors.green,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void showErrorSnackbar() {
    Get.showSnackbar(
      const GetSnackBar(
        title: 'Nicht verbunden',
        message: 'Leeres Passwort',
        backgroundColor: AppColors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void connectTapped() {
    if (password.value.trim().isNotEmpty) {
      showSuccessSnackbar();
      Get.close(1);
    } else {
      showErrorSnackbar();
    }
  }

  void moveItemToTop(int index) {
    if (index == 0) return;

    final String item = displayedWiFiNames[index];
    displayedWiFiNames.removeAt(index);
    displayedWiFiNames.insert(0, item);
  }

  void clearPasswordState() {
    password.value = '';
    isPasswordVisible.value = false;
  }
}
