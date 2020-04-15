import 'package:flutter/material.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/home/plant_list.dart';
import 'package:fluttering_plants/screens/navigation/drag_direction.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:provider/provider.dart';

///
/// Tabbed navigation of plants in certain rooms.
///
class PlantTabs extends StatefulWidget {
  const PlantTabs();

  @override
  _PlantTabsState createState() => _PlantTabsState();
}

class _PlantTabsState extends State<PlantTabs> with TickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;
  final selectedTabColor = ColorUtil.darken(ColorUtil.primaryColor, .2);
  final unSelectedTabColor = ColorUtil.darken(ColorUtil.white, .3);

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _tabController = TabController(vsync: this, length: 2);
  }

  void onAfterTabDrag(int from, int to, MainStore store) {
    if (from > to) store.settTabDragDirection(Direction.LEFT);
    else store.settTabDragDirection(Direction.RIGHT);
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
    final store = Provider.of<MainStore>(context);
    _tabController.addListener(() {
      if(_tabController.index != _tabController.previousIndex)
        onAfterTabDrag(_tabController.previousIndex, _tabController.index, store);
    });
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
            backgroundColor: ColorUtil.backgroundColor,
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
