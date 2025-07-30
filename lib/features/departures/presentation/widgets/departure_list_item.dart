import 'package:flutter/material.dart';

import '../../domain/entities/departure.dart';

class DepartureListItem extends StatelessWidget {
  final Departure departure;

  const DepartureListItem({super.key, required this.departure});

  @override
  Widget build(BuildContext context) {
    final formattedTime = TimeOfDay.fromDateTime(
      departure.plannedDeparture,
    ).format(context);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: Text(departure.lineName),
      ),
      title: Text(departure.direction),
      subtitle: Text('Platform: ${departure.platform ?? "N/A"}'),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            formattedTime,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            departure.isDelayed ? 'Delayed' : 'On Time',
            style: TextStyle(
              color: departure.isDelayed ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
