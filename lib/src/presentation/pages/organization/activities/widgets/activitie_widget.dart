import 'package:flutter/material.dart';

import '../../../../../models/models.dart';
import '../../../../../utils/utils.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 60,
                  child: Text(
                    '${activitie.name}',
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Flexible(
                  flex: 40,
                  child: Text(
                    Helpers.formatDate(activitie.date),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8.0),
            Text(activitie.description),
          ],
        ),
      ),
    );
  }
}
