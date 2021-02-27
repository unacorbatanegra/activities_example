import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import 'activity_controller.dart';

class ActivityVolunterPage extends GetView<ActivityVolunterController> {
  const ActivityVolunterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const gap18 = SizedBox(height: 18.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body: Obx(
        () => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      gap18,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 60,
                            child: Text(
                              '${controller.activity.name}',
                              overflow: TextOverflow.visible,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 40,
                            child: Text(
                              Helpers.formatDate(controller.activity.date),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      gap18,
                      const Divider(),
                      Text(controller.activity.description),
                      gap18,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Activities',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            '( ${controller.activity.activities.length} )',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Palette.accent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      gap18,
                      ...controller.activity.activities
                          .map(
                            (e) => ListTile(
                              leading: const Icon(Icons.view_list),
                              contentPadding: EdgeInsets.zero,
                              title: Text(e),
                            ),
                          )
                          .toList(),
                      gap18,
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
