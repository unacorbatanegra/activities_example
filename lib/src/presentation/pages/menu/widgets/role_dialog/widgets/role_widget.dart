import 'package:flutter/material.dart';

import '../../../../../../models/models.dart';
import '../../../../../widgets/widgets.dart';

class RoleWidget extends StatelessWidget {
  final String label;
  final ValueChanged<Role> onSelected;

  final IconData iconData;
  final Role value;
  final Role? selectedValue;
  const RoleWidget({
    Key? key,
    required this.label,
    required this.onSelected,
    required this.value,
    required this.iconData,
    required this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = value == selectedValue;
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => onSelected(value),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(blurRadius: 5, offset: Offset(2, 2), color: Colors.grey),
          ],
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: selected ? Palette.accent : Colors.grey,
            ),
            const SizedBox(height: 6.0),
            Text(
              label,
              style: TextStyle(
                color: selected ? Palette.accent : Colors.grey,
                fontSize: 16.0,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
