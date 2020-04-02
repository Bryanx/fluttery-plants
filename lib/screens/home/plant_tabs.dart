import 'package:flutter/material.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/home/plant_list.dart';

class PlantTabs extends StatefulWidget {
  const PlantTabs();

  @override
  _PlantTabsState createState() => _PlantTabsState();
}

class _PlantTabsState extends State<PlantTabs> with TickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;
  final selectedTabColor = ColorUtil.darken(ColorUtil.primaryColor, .2);
  final unSelectedTabColor = ColorUtil.grey;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  createTabBar() {
    return TabBar(
      labelColor: selectedTabColor,
      indicatorColor: Colors.transparent,
      unselectedLabelColor: unSelectedTabColor,
      labelStyle: TextStyle(
        fontFamily: 'AlegreyaSans',
        fontSize: 22,
        color: Color(0xFF21293A),
        fontWeight: FontWeight.w500,
      ),
      tabs: <Tab>[
        Tab(text: "All"),
        Tab(text: "Living room"),
      ],
      controller: _tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollViewController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            brightness: Brightness.light,
            elevation: 0.0,
            expandedHeight: 130.0,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: true,
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 8.0),
                      padding: EdgeInsets.only(left: 32.0, right: 32.0),
                      child: Text(
                        'Orchid',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.title,
                      ))
                ],
              ),
            ),
            pinned: true,
            floating: true,
            backgroundColor: Color(0xFFfafafa),
            forceElevated: innerBoxIsScrolled,
            bottom: createTabBar(),
          ),
        ];
      },
      body: TabBarView(
        children: <Widget>[
          PlantList(),
          PlantList(),
        ],
        controller: _tabController,
      ),
    );
  }
}
