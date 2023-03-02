import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/navigation/navigation.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.widget,
    this.isHave = false,
  });

  final String title;
  final bool isHave;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: isHave
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                NavigationIcons.arrowBack,
              ),
            )
          : null,
      title: Text(
        title,
        style:
            Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 24),
      ),
      actions: [widget, const SizedBox(width: 24)],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
