import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../domain/domains.dart';
import '../../../../models/models.dart';
import '../../../../services/services.dart';
import '../../../../utils/utils.dart';

class ActivitiesVolunterController extends GetxController
    with StateMixin<List<Activitie>> {
  final ActivitieDomain domain;

  ScrollController scrollController;
  TextEditingController controller;

  ActivitiesVolunterController({
    @required this.domain,
  });

  final list = <Activitie>[].obs;

  var _isCharging = false;

  final isSearching = false.obs;
  FocusNode focusNode;
  final debouncer = Debouncer(milliseconds: 500);

  @override
  void onInit() {
    scrollController ??= ScrollController();
    controller ??= TextEditingController();
    focusNode ??= FocusNode();
    scrollController?.addListener(onScroll);
    focusNode?.addListener(focusListener);
    init();
    super.onInit();
  }

  void init() async {
    change(null, status: RxStatus.loading());
    domain.clearPagination();
    final result = await domain.getListQuery();
    list(result);
    change(list, status: RxStatus.success());
  }

  void onTextSearchChanged(String value) async {
    debouncer.run(
      () => filter(value),
    );
  }

  void filter(String value) async {
    domain.clearPagination();
    change(null, status: RxStatus.loading());
    domain.clearPagination();
    final result = await domain.getListQuery(name: value);
    list(result);
    change(list, status: RxStatus.success());
  }

  void onScroll() async {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= Get.height * .20 && !_isCharging) {
      _isCharging = true;
      final result = await domain.getListQuery(
        startAfterTheLastDocument: true,
        name: controller.text,
      );
      list.addAll(result);
      change(list, status: RxStatus.success());
      _isCharging = false;
    }
  }

  void focusListener() {
    isSearching.value = focusNode.hasFocus;
    if (!focusNode.hasFocus) {
      controller.text = '';
      init();
    }
  }

  void onTap(int index) async {
    final result = await Get.toNamed(
      RouteName.activitieVolunter,
      arguments: list[index],
    ) as bool;
    print(result);
    if (result ?? false) init();
  }

  bool changeSearching() {
    isSearching.value = !isSearching();
    focusNode.requestFocus();
    return isSearching.value;
  }

  @override
  void onClose() {
    scrollController?.removeListener(onScroll);
    focusNode?.removeListener(focusListener);
    scrollController?.dispose();
    controller?.dispose();
    focusNode?.dispose();
    super.onClose();
  }
}
