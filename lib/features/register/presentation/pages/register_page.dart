import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:stocoin/core/bootstrap/helpers.dart';
import 'package:stocoin/core/bootstrap/navigation_service.dart';
import 'package:stocoin/core/config/app_constants.dart';
import 'package:stocoin/core/localization/app_localization.dart';
import 'package:stocoin/core/ui/custom_app_bar.dart';
import 'package:stocoin/core/ui/entry_button.dart';
import 'package:stocoin/core/ui/entry_text_field.dart';
import 'package:stocoin/injectable.dart';

class RegisterPage extends HookWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();
    final confirmPassTextController = useTextEditingController();

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(title: 'create_account'),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: entrySymmetricVerticalPadding / 2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: entrySymmetricHorizontalPadding,
                ),
                child: Text(
                  'lets_sign_you_up'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 30, fontWeight: FontWeight.w800),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 50),
                    EntryTextField(
                      hintText: 'name',
                      type: TextFieldType.text,
                      controller: emailTextController,
                    ),
                    const SizedBox(height: 5),
                    EntryTextField(
                      hintText: 'email',
                      type: TextFieldType.email,
                      controller: emailTextController,
                    ),
                    const SizedBox(height: 5),
                    EntryTextField(
                      hintText: 'password',
                      type: TextFieldType.password,
                      controller: passwordTextController,
                    ),
                    const SizedBox(height: 5),
                    EntryTextField(
                      hintText: 'confirm_password',
                      type: TextFieldType.password,
                      controller: confirmPassTextController,
                    ),
                    const Spacer(),
                    const EntryButton(label: 'sign_up', enabled: false),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => di<NavigationService>().goBack(),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'already_have_an_account'.tr(),
                            ),
                            TextSpan(
                              text: 'sign_in'.tr(),
                              style: TextStyle(
                                color: get(context).entryButtonColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
