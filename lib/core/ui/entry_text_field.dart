import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stocoin/core/bootstrap/helpers.dart';
import 'package:stocoin/core/config/app_constants.dart';
import 'package:stocoin/core/localization/app_localization.dart';

enum TextFieldType { email, text, password }

typedef OnChanged = void Function(String);

class EntryTextField extends HookWidget {
  const EntryTextField({
    this.hintText,
    this.type,
    this.controller,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final String? hintText;
  final TextFieldType? type;
  final TextEditingController? controller;
  final OnChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    final obscureText = useState<bool>(type == TextFieldType.password);
    final showClearIcon = useState<bool>(false);

    if (type != TextFieldType.password) {
      controller!.addListener(() {
        if (controller!.value.text.isNotEmpty) {
          showClearIcon.value = true;
        } else {
          showClearIcon.value = false;
        }
      });
    }

    return SizedBox(
      height: 67,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: entrySymmetricHorizontalPadding,
        ),
        child: TextField(
          autocorrect: false,
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText!.tr(),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: TextStyle(color: get(context).textFieldHintTextColor),
            isDense: true,
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 40, maxWidth: 40),
            suffixIcon: type == TextFieldType.password
                ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () => obscureText.value = !obscureText.value,
                      customBorder: const CircleBorder(),
                      child: Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: get(context).textFieldSuffixIconBgColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.5),
                          child: SvgPicture.asset(
                            getIcon('eye.svg'),
                            color: get(context).textFieldSuffixIconColor,
                          ),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: controller!.clear,
                      customBorder: const CircleBorder(),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 150),
                        opacity: showClearIcon.value ? 1 : 0,
                        curve: Curves.easeInOutSine,
                        child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: get(context).textFieldSuffixIconBgColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.5),
                            child: SvgPicture.asset(
                              getIcon('remove.svg'),
                              color: get(context).textFieldSuffixIconColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
            alignLabelWithHint: true,
          ),
          obscureText: obscureText.value,
        ),
      ),
    );
  }
}
