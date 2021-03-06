import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:stocoin/core/bootstrap/helpers.dart';
import 'package:stocoin/core/config/app_constants.dart';
import 'package:stocoin/core/localization/app_localization.dart';

class EntryButton extends HookWidget {
  const EntryButton({this.label, this.enabled, Key? key}) : super(key: key);

  final String? label;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    final buttonColor = get(context).entryButtonColor;
    final horizontalPadding = useState<double>(entrySymmetricHorizontalPadding);
    final verticalPadding = useState<double>(0);

    return Listener(
      onPointerDown: (_) {
        if (enabled!) {
          verticalPadding.value = .8;
          horizontalPadding.value += .8;
          HapticFeedback.vibrate();
        }
      },
      onPointerUp: (_) {
        verticalPadding.value = 0;
        horizontalPadding.value = entrySymmetricHorizontalPadding;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding.value,
          vertical: verticalPadding.value,
        ),
        child: Container(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
            color: enabled! ? buttonColor : get(context).scaffold,
            border: enabled!
                ? Border.all(width: 0)
                : Border.all(color: buttonColor),
            borderRadius: BorderRadius.circular(entryButtonRadius),
          ),
          child: Center(
            child: Text(
              label!.tr().toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
