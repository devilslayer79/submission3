import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_apps/provider/scheduling_provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  static const String settingsTitle = 'Settings';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Material(
          child: ListTile(
              title: Text('Scheduling Restaurant'),
              trailing: Consumer<SchedulingProvider>(
                builder: (context, scheduling, _) {
                  return Switch.adaptive(
                    value: scheduling.isScheduled,
                    onChanged: (value) async {
                      scheduling.scheduledRestaurant(value);
                    },
                  );
                },
              )),
        )
      ],
    );
  }
}
