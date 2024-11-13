import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:inglourious_basterds/bloc/drawer_event.dart';
import 'package:inglourious_basterds/bloc/nav_drawer_bloc.dart';
import 'package:inglourious_basterds/bloc/nav_drawer_state.dart';

class _NavigationItem {
  final NavItem item;
  final String title;
  final IconData icon;

  _NavigationItem(this.item, this.title, this.icon);
}

class NavDrawerWidget extends StatelessWidget {
  NavDrawerWidget({super.key});

  final List<_NavigationItem> _listItems = [
    _NavigationItem(NavItem.homeView, "Portada", IconlyBold.home),
    _NavigationItem(NavItem.charactersView, "Reparto", IconlyBold.star),
    _NavigationItem(NavItem.scenesView, "Escenas", IconlyBold.camera),
    _NavigationItem(NavItem.aboutView, "Acerca de", IconlyBold.info_circle),
    _NavigationItem(
        NavItem.personalExperienceView, "En mi vida", IconlyBold.heart),
    _NavigationItem(NavItem.hireMeView, "Contrátame", IconlyBold.user_2),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 163, 9, 30),
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
              accountName: Text(
                'Rachely Pérez',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              accountEmail: Text('20221856@itla.edu.do',
                  style: TextStyle(color: Color(0xFF6E030B))),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://ntvb.tmsimg.com/assets/p193875_v_h8_aq.jpg?w=1280&h=720')))),
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _listItems.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) =>
                BlocBuilder<NavDrawerBloc, NavDrawerState>(
              builder: (BuildContext context, NavDrawerState state) =>
                  _buildItem(_listItems[index], state),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem(_NavigationItem data, NavDrawerState state) =>
      _makeListItem(data, state);

  Widget _makeListItem(_NavigationItem data, NavDrawerState state) => Card(
        color: Color.fromARGB(255, 163, 9, 30),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        borderOnForeground: true,
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Builder(
          builder: (BuildContext context) => ListTile(
            title: Text(
              data.title,
              style: TextStyle(
                fontWeight: data.item == state.selectedItem
                    ? FontWeight.bold
                    : FontWeight.w300,
                color: data.item == state.selectedItem
                    ? const Color.fromARGB(255, 255, 191, 0)
                    : const Color.fromARGB(255, 255, 227, 144),
              ),
            ),
            leading: Icon(
              data.icon,
              color: data.item == state.selectedItem
                  ? const Color.fromARGB(255, 255, 191, 0)
                  : const Color.fromARGB(255, 255, 227, 144),
            ),
            onTap: () => _handleItemClick(context, data.item),
          ),
        ),
      );

  void _handleItemClick(BuildContext context, NavItem item) {
    BlocProvider.of<NavDrawerBloc>(context).add(NavigateTo(item));
    Navigator.pop(context);
  }
}
