import 'dart:async';

import '../imports.dart';

class InternetConnectionStatus extends GetxController {
  var isIneternetAvailble = 0.obs;

  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    monitoring();
  }

  void monitoring() async {
    _connectivity.onConnectivityChanged.asBroadcastStream().listen(
      (result) {
        if (result == ConnectivityResult.none) {
          isIneternetAvailble.value = 0;
          update();
        } else {
          isIneternetAvailble.value = 1;
          update();
        }
      },
    );
  }
}

class InternetConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternetConnectionStatus>(() => InternetConnectionStatus());
  }
}
