import 'package:flutter/material.dart';

import '../../../../models/models.dart';

class ActivitieWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Activitie activitie;
  const ActivitieWidget({
    Key key,
    @required this.onTap,
    @required this.activitie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${activitie.name}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text('${activitie.date}'),
          ],
        ),
      ),
    );
  }
}
