import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/widgets.dart';
import 'activitie_dialog_controller.dart';

class ActivitieDialog extends StatelessWidget {
  const ActivitieDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ActivitieDialogController(),
      builder: (_) => _ActivitieDialog(),
    );
  }
}

class _ActivitieDialog extends GetView<ActivitieDialogController> {
  const _ActivitieDialog({Key key}) : super(key: key);
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
        'ACTIVITIE',
        style: Get.textTheme.headline6.copyWith(
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
              hintText: 'activitie',
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'CANCEL',
            style: Get.textTheme.button.copyWith(
              color: Get.theme.accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: Get.back,
        ),
        FlatButton(
          child: Text(
            'ACCEPT',
            style: Get.textTheme.button.copyWith(
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
