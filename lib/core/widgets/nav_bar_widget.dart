import 'package:bokiaa/core/constant/assets_icon.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/feature/cart/presentation/page/cart_view.dart';
import 'package:bokiaa/feature/home/presentation/page/home_view.dart';
import 'package:bokiaa/feature/profile/presentation/page/profile_view.dart';
import 'package:bokiaa/feature/wishlist/presentation/page/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int selctedIndex = 0;
  List<Widget> pages = const [
    HomeView(),
    WishListView(),
    CartView(),
    ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selctedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: selctedIndex,
        onTap: (value) {
          setState(() {
            selctedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsIcon.homeSvg),
              activeIcon: SvgPicture.asset(
                AssetsIcon.homeSvg,
                colorFilter:
                    ColorFilter.mode(Appcolors.primaryColor, BlendMode.srcIn),
              ),
              label: "home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsIcon.bookMarkSvg),
              activeIcon: SvgPicture.asset(
                AssetsIcon.bookMarkSvg,
                colorFilter:
                    ColorFilter.mode(Appcolors.primaryColor, BlendMode.srcIn),
              ),
              label: "home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsIcon.cartSvg),
              activeIcon: SvgPicture.asset(
                AssetsIcon.cartSvg,
                colorFilter:
                    ColorFilter.mode(Appcolors.primaryColor, BlendMode.srcIn),
              ),
              label: "home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsIcon.profileSvg),
              activeIcon: SvgPicture.asset(
                AssetsIcon.profileSvg,
                colorFilter:
                    ColorFilter.mode(Appcolors.primaryColor, BlendMode.srcIn),                            
              ),
              label: "home")
        ],
      ),
    );
  }
}
