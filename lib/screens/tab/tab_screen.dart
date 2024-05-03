import 'package:fast_pay/screens/tab/card/card_screen.dart';
import 'package:fast_pay/screens/tab/history/history_screen.dart';
import 'package:fast_pay/screens/tab/home/home_screen.dart';
import 'package:fast_pay/screens/tab/profile/profile_screen.dart';
import 'package:fast_pay/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors/colors.dart';
import '../../utils/images/images.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _activeIndex = 0;


  @override

  List<Widget> _screens = [
    HomeScreen(),
    CardScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _activeIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
      _activeIndex = newActiveIndex;
      setState(() {});
    },
       showUnselectedLabels: true,
        selectedItemColor: AppColors.c_1A72DD,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: AppTextStyle.rubikMedium,
        unselectedLabelStyle: AppTextStyle.rubikMedium,
    currentIndex: _activeIndex,
        items:  [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.home),
            label: "Home",
            activeIcon: SvgPicture.asset(AppImages.home,color: AppColors.black,),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.store),
            label: "Cards",
            activeIcon: SvgPicture.asset(AppImages.store,color: AppColors.black,),
          ),
          BottomNavigationBarItem(
            icon:SvgPicture.asset(AppImages.order),
            label: "History",
            activeIcon: SvgPicture.asset(AppImages.order,color: AppColors.black,),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.profile),
            label: "Profile",
            activeIcon:SvgPicture.asset(AppImages.profile,color: AppColors.black,),
          )
        ],
      ),
    );
  }
}
