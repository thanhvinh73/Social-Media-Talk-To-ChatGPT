import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:social_media_with_chatgpt/shared/utils/shared_preference.dart';

import '../../public_providers/app_user_cubit/app_user_cubit.dart';
import '../../public_providers/page_router_cubit/page_router_cubit.dart';
import '../../router_observer.dart';
import '../../routes/app_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final botToastBuilder = BotToastInit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageRouterCubit()),
        BlocProvider(create: (context) => AppUserCubit()),
      ],
      child: Builder(builder: (context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          initialRoute:
              sp.loggedBefore ? Routes.connectToServer : Routes.welcome,
          routes: Routes.routes,
          builder: (context, child) => botToastBuilder(context, child),
          navigatorObservers: [
            BotToastNavigatorObserver(),
            AppRouteObserver(context)
          ],
        );
      }),
    );
  }
}
