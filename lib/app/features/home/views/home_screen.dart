import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:quickreels/app/core/values/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  Color unselectedColor = AppColors.colorWhite;
  Color selectedColor = AppColors.colorPrimary;

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation?.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  void onAddPostClicked() {
    print("onAddPostClicked ...");
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          backgroundColor: Colors.black,
        ),
        body: BottomBar(
          clip: Clip.none,
          fit: StackFit.expand,
          icon: (width, height) => Center(
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: null,
              icon: Icon(
                Icons.arrow_upward_rounded,
                color: unselectedColor,
                size: width,
              ),
            ),
          ),
          borderRadius: BorderRadius.circular(500),
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate,
          showIcon: true,
          width: MediaQuery.of(context).size.width * 0.8,
          barColor: AppColors.colorDark,
          start: 2,
          end: 0,
          offset: 10,
          barAlignment: Alignment.bottomCenter,
          iconHeight: 30,
          iconWidth: 30,
          reverse: false,
          hideOnScroll: true,
          scrollOpposite: false,
          onBottomBarHidden: () {},
          onBottomBarShown: () {},
          body: (context, controller) => TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: const BouncingScrollPhysics(),
            children: [1, 2, 3, 4, 5]
                .map<Widget>(
                  (e) => PageView(
                      key: ValueKey('infinite_list_key#${e.toString()}')),
                )
                .toList(),
          ),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              TabBar(
                onTap: (index) {
                  if (index == 2) {
                    onAddPostClicked();
                  } else {
                    changePage(index);
                  }
                },
                indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                controller: tabController,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: selectedColor,
                      width: 4,
                    ),
                    insets: const EdgeInsets.fromLTRB(16, 0, 16, 8)),
                tabs: [
                  _buildTab(0, Icons.home),
                  _buildTab(1, Icons.search),
                  _buildTab(2, Icons.add),
                  _buildTab(3, Icons.favorite),
                  _buildTab(4, Icons.person_outline),
                ],
              ),
              Positioned(
                top: -15,
                child: FloatingActionButton(
                  onPressed: onAddPostClicked,
                  child: const Icon(Icons.add),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(int idx, IconData icon) {
    return SizedBox(
      height: 55,
      width: 40,
      child: Center(
        child: Icon(
          icon,
          color: currentPage == idx ? selectedColor : unselectedColor,
        ),
      ),
    );
  }

}
