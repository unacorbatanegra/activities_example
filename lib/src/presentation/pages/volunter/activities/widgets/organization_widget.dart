import 'package:flutter/material.dart';

import '../../../../../models/models.dart';
import '../../../../widgets/widgets.dart';

class OrganizationWidget extends StatelessWidget {
  final Activitie activitie;
  const OrganizationWidget(
    this.activitie, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(
        Icons.business,
        color: Palette.accent,
      ),
      title: Text(
        activitie.organization.user,
        style: const TextStyle(
          color: Palette.accent,
        ),
      ),
    );
  }
}
