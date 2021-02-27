import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/widgets.dart';
import 'activitie_controller.dart';

class ActivitieOrganizationPage
    extends GetView<ActivitieOrganizationController> {
  const ActivitieOrganizationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const gap18 = SizedBox(height: 18.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activitie'),
        actions: [
          Obx(
            () => Visibility(
              visible: controller.isEditing,
              child: IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: controller.delete,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomButton(
        onPressed: controller.accept,
        label: 'Save changes',
      ),
      body: Obx(
        () => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        gap18,
                        CustomTextField(
                          controller: controller.nameController,
                          label: 'Name',
                          hint: 'activitie name',
                          validator: controller.validator,
                        ),
                        gap18,
                        CustomTextField(
                          controller: controller.description,
                          label: 'Description',
                          hint: 'description',
                          validator: controller.validator,
                        ),
                        gap18,
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.date_range),
                          title: const Text('Date'),
                          onTap: controller.onDate,
                          subtitle: Text(controller.dateFormat),
                        ),
                        gap18,
                        const Text(
                          'Activities',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 18.0,
                          ),
                        ),
                        gap18,
                        controller.activities.isNotEmpty
                            ? Column(
                                children: [
                                  ...controller.activities
                                      .asMap()
                                      .entries
                                      .map(
                                        (e) => Dismissible(
                                          key: UniqueKey(),
                                          onDismissed: (_) =>
                                              controller.deleteActivitie(e.key),
                                          child: ListTile(
                                            leading:
                                                const Icon(Icons.view_list),
                                            contentPadding: EdgeInsets.zero,
                                            onTap: () =>
                                                controller.onTap(e.key),
                                            title: Text(
                                              e.value,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList()
                                ],
                              )
                            : const Center(
                                child: Text('no activities yet'),
                              ),
                        gap18,
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton.icon(
                            onPressed: controller.onAdd,
                            icon: const Icon(Icons.note_add),
                            label: Text('add activitie'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
