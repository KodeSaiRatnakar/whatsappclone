import '../imports.dart';

class InternetConnectionStatus extends GetxController {
  var isIneternetAvailble = 0.obs;

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(monitoring);
  }

  @override
  void onClose() {
    connectivitySubscription.cancel();
    super.onClose();
  }

  void monitoring(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      isIneternetAvailble.value = 0;
    } else {
      isIneternetAvailble.value = 1;
    }
  }
}

class InternetConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternetConnectionStatus>(() => InternetConnectionStatus());
  }
}
