import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../../domain/domains.dart';
import '../../../../models/models.dart';
import 'activities_controller.dart';
import 'widgets/activitie_widget.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/organization_widget.dart';

class ActivitiesVolunterPage extends StatelessWidget {
  const ActivitiesVolunterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ActivitiesVolunterController(
        domain: ActivityDomain(),
      ),
      builder: (_) => _ActivitiesVolunterPage(),
    );
  }
}

class _ActivitiesVolunterPage extends GetView<ActivitiesVolunterController> {
  const _ActivitiesVolunterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => controller.changeSearching(),
      child: Scaffold(
        appBar: CustomAppBar(
          focusNode: controller.focusNode,
          controller: controller.controller,
          onChanged: controller.onTextSearchChanged,
          changeSearching: controller.changeSearching,
          isSearching: controller.isSearching,
        ),
        backgroundColor: Colors.grey[200],
        body: controller.obx(
          (list) => list.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  child: CupertinoScrollbar(
                    child: GroupedListView<Activity, String>(
                      elements: list,
                      indexedItemBuilder: (context, e, index) =>
                          ActivitieWidget(
                        onTap: () => controller.onTap(index),
                        activitie: e,
                      ),
                      groupBy: (e) => e.organization.uid,
                      groupHeaderBuilder: (value) => OrganizationWidget(value),
                    ),
                  ),
                )
              : const Center(child: Text('No activities yet')),
        ),
      ),
    );
  }
}
