import 'package:delivery/components/my_current_location.dart';
import 'package:delivery/components/my_description_box.dart';
import 'package:delivery/components/my_drawer.dart';
import 'package:delivery/components/my_food_tile.dart';
import 'package:delivery/components/my_sliver_app_bar.dart';
import 'package:delivery/components/my_tab_bar.dart';
import 'package:delivery/models/food.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:delivery/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food>_filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index){

          final food = categoryMenu[index];

          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FoodPage(food: food),
              ),
            ),
          );
      },
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Home"),
     // backgroundColor: Theme.of(context).colorScheme.background,
      //),
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
              title: MyTabBar(tabController:_tabController ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Divider(indent: 25, endIndent: 25, color: Theme.of(context).colorScheme.secondary,
            ),

            const MyCurrentLocation(),

            const MyDescriptionBox(),
        ],
      ),
          ),
        ], body: Consumer<Restaurant>(
        builder: (context, restaurant, child) => TabBarView(
        controller: _tabController,
        children: getFoodInThisCategory(restaurant.menu),
      ),
      ),
      ),
    );
  }
}
