import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/widgets.dart';

class Button extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final IconData iconData;
  const Button({
    Key? key,
    required this.onTap,
    required this.label,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(blurRadius: 5, offset: Offset(2, 2), color: Colors.grey)
          ],
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 6),
            Icon(
              iconData,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(
                fontSize: 20.0,
                color: Palette.accent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
