import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../domain/domains.dart';
import '../../../../models/models.dart';
import '../../../../services/services.dart';
import '../../../../utils/utils.dart';

class ActivitiesOrganizationController extends GetxController {
  final ActivitieDomain domain;

  ScrollController scrollController;
  TextEditingController controller;

  ActivitiesOrganizationController({
    @required this.domain,
  });

  final list = <Activitie>[].obs;

  var _isCharging = false;
  final _isLoading = false.obs;
  final _isSearching = false.obs;
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

  void onTextSearchChanged(String value) async {
    debouncer.run(
      () => filter(value),
    );
  }

  void filter(String value) async {
    domain.clearPagination();
    _isLoading(true);
    list.assignAll(await domain.getListOrg(name: value));
    _isLoading(false);
  }

  void onScroll() async {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= Get.height * .20 && !_isCharging) {
      _isCharging = true;
      list.addAll(await domain.getListOrg(startAfterTheLastDocument: true));
      _isCharging = false;
    }
  }

  void focusListener() {
    _isSearching.value = focusNode.hasFocus;
    if (!focusNode.hasFocus) {
      controller.text = '';
      init();
    }
  }

  void init() async {
    _isLoading(true);
    domain.clearPagination();
    list.assignAll(await domain.getListOrg());
    _isLoading(false);
  }

  void onAdd() async {
    final result = await Get.toNamed(
      RouteName.activitieOrganization,
    ) as bool;
    if (result ?? false) init();
  }

  void onTap(int index) async {
    final result = await Get.toNamed(
      RouteName.activitieOrganization,
      arguments: list[index],
    ) as bool;
    print(result);
    if (result ?? false) init();
  }

  bool changeSearching() {
    _isSearching.value = !isSearching;
    focusNode.requestFocus();
    return _isSearching.value;
  }

  bool get isLoading => _isLoading.value;
  bool get isSearching => _isSearching.value;

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
