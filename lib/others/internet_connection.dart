import '../imports.dart';

class InternetConnectionStatus extends GetxController {
  var isIneternetAvailble = false.obs;

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
      isIneternetAvailble.value = false;
    } else {
      isIneternetAvailble.value = true;
    }
  }
}

class InternetConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternetConnectionStatus>(
      () => InternetConnectionStatus(),
    );
  }
}
