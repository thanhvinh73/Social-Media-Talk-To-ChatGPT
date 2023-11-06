import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

import '../../generated/assets.gen.dart';
import '../../generated/translations.g.dart';
import '../../routes/app_router.dart';
import '../../shared/helpers/dialog_helper.dart';
import 'cubit/splash_screen_cubit.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final _debound = Debouncer(delay: const Duration(seconds: 1));
  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: WillPopScope(
          onWillPop: () => Future.value(false),
          child: BlocProvider(
            create: (context) => SplashScreenCubit(),
            child: MultiBlocListener(
              listeners: [
                BlocListener<SplashScreenCubit, SplashScreenState>(
                  listenWhen: (previous, current) =>
                      previous.errorMessage != current.errorMessage &&
                      current.errorMessage != null,
                  listener: (context, state) {
                    showErrorDialog(context,
                            title: tr(LocaleKeys.Auth_Error),
                            content: state.errorMessage)
                        .then((value) => context
                            .read<SplashScreenCubit>()
                            .resetErrorMessage());
                  },
                ),
                BlocListener<SplashScreenCubit, SplashScreenState>(
                  listenWhen: (previous, current) =>
                      previous.isInit != current.isInit,
                  listener: (context, state) {
                    Get.toNamed(Routes.connectToServer);
                  },
                ),
              ],
              child: LayoutBuilder(builder: (context, constraints) {
                _debound.call(() => context
                    .read<SplashScreenCubit>()
                    .updateState((p0) => p0.copyWith(isInit: true)));
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Assets.icons.pcFetchApi.svg(),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
