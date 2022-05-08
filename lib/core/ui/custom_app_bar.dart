import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stocoin/core/bootstrap/helpers.dart';

import 'package:stocoin/core/bootstrap/navigation_service.dart';
import 'package:stocoin/core/localization/app_localization.dart';
import 'package:stocoin/injectable.dart';

class CustomAppBar extends HookWidget implements PreferredSizeWidget {
  const CustomAppBar({this.title, Key? key}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title!.tr(),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(5),
        child: Tooltip(
          message: 'back'.tr(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: di<NavigationService>().goBack,
            child: Icon(
              FluentIcons.arrow_left_16_regular,
              color: get(context).accent,
            ),
          ),
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}
