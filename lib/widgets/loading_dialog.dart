import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingDialog extends StatelessWidget {
  Widget widget;

  LoadingDialog({this.widget = const CircularProgressIndicator(), Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(
              Radius.circular(20))),
      content: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: SizedBox(
                    width: 30,
                    height: 30,
                    child: widget)),
              ],
            ),
          );
        },
      ),
    );
  }
}
