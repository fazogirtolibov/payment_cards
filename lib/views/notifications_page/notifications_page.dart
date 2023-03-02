import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notifications Page',
        widget: Container(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Oops.. There is no any notification",
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ),
    );
  }
}
