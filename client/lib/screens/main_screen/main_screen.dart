import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_with_chatgpt/shared/enum/bottom_tabs.dart';

import '../../generated/translations.g.dart';
import '../../shared/helpers/dialog_helper.dart';
import '../../shared/utils/app_colors.dart';
import '../../shared/widgets/app_layout.dart';
import '../../shared/widgets/bottom_tab_bar_item.dart';
import '../home_screen/home_screen.dart';
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
    return Material(
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: BlocProvider(
          create: (context) => MainScreenCubit(),
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
                          .updateState(
                              (p0) => p0.copyWith(errorMessage: null)));
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
                  title: context.read<MainScreenCubit>().state.currentTab.label,
                  // showLeading: false,
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: state.currentTab.index,
                    unselectedItemColor: AppColors.bodyText,
                    selectedItemColor: AppColors.primaryColor,
                    selectedFontSize: 12,
                    backgroundColor: AppColors.white,
                    elevation: 0,
                    showUnselectedLabels: true,
                    type: BottomNavigationBarType.fixed,
                    landscapeLayout:
                        BottomNavigationBarLandscapeLayout.centered,
                    items: BottomTabs.values
                        .map((e) => BottomTabBarItem(
                              icon: Column(
                                children: [
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Icon(
                                    e.icon,
                                  ),
                                ],
                              ),
                              label: e.label,
                              activeIcon: Column(
                                children: [
                                  SizedBox(
                                    width: 32,
                                    height: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Icon(
                                    e.icon,
                                    // color: AppColors.text,
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                    onTap: (index) => context
                        .read<MainScreenCubit>()
                        .updateState((p0) =>
                            p0.copyWith(currentTab: BottomTabs.values[index])),
                  ),
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: const [
                      HomeScreen(),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
