import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:stocoin/core/bootstrap/helpers.dart';
import 'package:stocoin/core/bootstrap/navigation_service.dart';
import 'package:stocoin/core/config/app_constants.dart';
import 'package:stocoin/core/config/app_theme.dart';
import 'package:stocoin/core/localization/app_localization.dart';
import 'package:stocoin/core/ui/entry_button.dart';
import 'package:stocoin/core/ui/entry_text_field.dart';
import 'package:stocoin/features/login/presentation/cubit/login_cubit.dart';
import 'package:stocoin/features/login/presentation/widgets/logo.dart';
import 'package:stocoin/injectable.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();
    final loginCubit = context.read<LoginCubit>();

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: entrySymmetricVerticalPadding,
          ),
          child: Column(
            children: <Widget>[
              const Logo(),
              Text(
                (getEnv('APP_NAME') as String).toUpperCase(),
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontFamily: appNameFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 55,
                    ),
              ),
              const SizedBox(height: 41),
              EntryTextField(
                onChanged: loginCubit.emailChanged,
                hintText: 'email',
                type: TextFieldType.email,
                controller: emailTextController,
              ),
              const SizedBox(height: 5),
              EntryTextField(
                onChanged: loginCubit.passwordChanged,
                hintText: 'password',
                type: TextFieldType.password,
                controller: passwordTextController,
              ),
              const Spacer(),
              const EntryButton(label: 'log_in'),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => di<NavigationService>()
                    .navigateTo(registerPath, arguments: this),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyText2,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'dont_have_an_account'.tr(),
                      ),
                      TextSpan(
                        text: 'sign_up'.tr(),
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
      ),
    );
  }
}
