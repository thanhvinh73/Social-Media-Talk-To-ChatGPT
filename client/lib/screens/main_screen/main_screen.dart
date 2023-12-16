import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_with_chatgpt/generated/assets.gen.dart';
import 'package:social_media_with_chatgpt/screens/conversation_screen/cubit/conversation_screen_cubit.dart';
import 'package:social_media_with_chatgpt/screens/notification_screen/cubit/notification_screen_cubit.dart';
import 'package:social_media_with_chatgpt/shared/enum/main_tabs.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_dismiss_keyboard.dart';

import '../../generated/translations.g.dart';
import '../../shared/helpers/dialog_helper.dart';
import '../../shared/utils/app_colors.dart';
import '../../shared/widgets/app_layout.dart';
import 'cubit/main_screen_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppDismissKeyboard(
      onWillPop: false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MainScreenCubit()),
          BlocProvider(create: (context) => ConversationScreenCubit()),
          BlocProvider(create: (context) => NotificationScreenCubit()),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<MainScreenCubit, MainScreenState>(
              listenWhen: (previous, current) =>
                  previous.errorMessage != current.errorMessage &&
                  current.errorMessage != null,
              listener: (context, state) {
                showErrorDialog(context,
                        title: tr(LocaleKeys.Auth_Error),
                        content: state.errorMessage)
                    .then((value) => context
                        .read<MainScreenCubit>()
                        .updateState((p0) => p0.copyWith(errorMessage: null)));
              },
            ),
            BlocListener<MainScreenCubit, MainScreenState>(
              listenWhen: (previous, current) =>
                  previous.currentTab != current.currentTab,
              listener: (context, state) {
                pageController.animateToPage(state.currentTab.index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
              },
            ),
          ],
          child: BlocBuilder<MainScreenCubit, MainScreenState>(
            buildWhen: (previous, current) =>
                previous.currentTab != current.currentTab,
            builder: (context, state) {
              return AppLayout(
                statusBarColor:
                    context.read<MainScreenCubit>().state.currentTab.statusBar,
                title: context.read<MainScreenCubit>().state.currentTab.label,
                leading: const SizedBox.shrink(),
                showAppBar: false,
                floatingActionButton: FloatingActionButton(
                  backgroundColor: AppColors.white,
                  elevation: 3,
                  onPressed: () {
                    // Get.toNamed(Routes.chatBot);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Assets.icons.icChatBot.svg(color: AppColors.darkgreen),
                  ),
                ),
                // bottomNavigationBar: BottomNavigationBar(
                //   currentIndex: state.currentTab.index,
                //   unselectedItemColor: AppColors.bodyText,
                //   selectedItemColor: AppColors.darkgreen,
                //   selectedFontSize: 12,
                //   backgroundColor: AppColors.white,
                //   elevation: 0,
                //   showUnselectedLabels: true,
                //   type: BottomNavigationBarType.fixed,
                //   landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
                //   items: MainTabs.values
                //       .map((e) => BottomTabBarItem(
                //             icon: Column(
                //               children: [
                //                 const SizedBox(height: 6),
                //                 Icon(e.icon),
                //               ],
                //             ),
                //             label: e.label,
                //             activeIcon: Column(
                //               children: [
                //                 SizedBox(
                //                     width: 32,
                //                     height: 2,
                //                     child: AppContainer(
                //                       borderRadius: BorderRadius.circular(10),
                //                       color: AppColors.darkgreen,
                //                     )),
                //                 const SizedBox(height: 4),
                //                 Icon(e.icon),
                //               ],
                //             ),
                //           ))
                //       .toList(),
                //   onTap: (index) => context.read<MainScreenCubit>().updateState(
                //       (p0) => p0.copyWith(currentTab: MainTabs.values[index])),
                // ),

                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: MainTabs.values.map((tab) => tab.widget).toList(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
