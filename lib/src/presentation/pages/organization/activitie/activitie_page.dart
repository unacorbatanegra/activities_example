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
            () => controller.isEditing
                ? IconButton(
                    icon: const Icon(Icons.delete_forever),
                    onPressed: controller.delete,
                  )
                : const SizedBox.shrink(),
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
                  child: Column(
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
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
