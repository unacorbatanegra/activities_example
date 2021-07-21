import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/widgets.dart';
import 'activity_dialog_controller.dart';

class ActivityDialog extends StatelessWidget {
  const ActivityDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ActivityDialogController(),
      builder: (dynamic _) => _ActivityDialog(),
    );
  }
}

class _ActivityDialog extends GetView<ActivityDialogController> {
  const _ActivityDialog({Key? key}) : super(key: key);
  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'ACTIVITY',
        style: Get.textTheme.headline6!.copyWith(
          color: Palette.accent,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Container(
        width: Get.width,
        child: Form(
          key: controller.formKey,
          child: TextFormField(
            controller: controller.controller,
            validator: controller.validator,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Lato',
            ),
            decoration: InputDecoration(
              border: _border,
              focusedBorder: _border.copyWith(
                borderSide: const BorderSide(
                  color: Palette.accent,
                ),
              ),
              contentPadding: const EdgeInsets.all(18.0),
              hintText: 'activity',
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'CANCEL',
            style: Get.textTheme.button!.copyWith(
              color: Get.theme.accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: Get.back,
        ),
        TextButton(
          child: Text(
            'ACCEPT',
            style: Get.textTheme.button!.copyWith(
              color: Get.theme.accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: controller.onAccept,
        )
      ],
    );
  }
}
