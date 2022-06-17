import 'package:get/get.dart';

class FilterController extends GetxController {
  /// #Nasibali
  List<bool> isTabs = [false, false, false, false, false, false, false, false];
  bool isClean = false;
  List<bool> selectedTabs = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  int cointFilter = 0;

  onTab(int index) {
    isTabs[index] = !isTabs[index];

    for (int i = 0; i < isTabs.length; i++) {
      if (!isTabs[i]) {
        isClean = false;
        continue;
      } else {
        isClean = true;
        break;
      }
    }
    update();
  }

  clearTabs() {
    for (int i = 0; i < isTabs.length; i++) {
      isTabs[i] = false;
    }
    isClean = false;
    selectedTabs = [false, false, false, false, false, false, false, false];
    update();
  }

  selectTabs() {
    selectedTabs = isTabs;
    for (int i = 0; i < selectedTabs.length; i++) {
      if (selectedTabs[i]) {
        cointFilter++;
      }
    }

    update();
  }

  onTabIconFilter(int index) {
    selectedTabs[index] = !selectedTabs[index];
    if (selectedTabs[index]) {
      cointFilter++;
    } else {
      cointFilter--;
    }

    update();
  }
}
