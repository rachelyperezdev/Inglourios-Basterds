import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inglourious_basterds/bloc/nav_drawer_bloc.dart';
import 'package:inglourious_basterds/bloc/nav_drawer_state.dart';
import 'package:inglourious_basterds/views/about_view.dart';
import 'package:inglourious_basterds/views/characters_view.dart';
import 'package:inglourious_basterds/views/hire_me_view.dart';
import 'package:inglourious_basterds/views/home_view.dart';
import 'package:inglourious_basterds/views/personal_experience_view.dart';
import 'package:inglourious_basterds/views/scenes_view.dart';
import 'package:inglourious_basterds/widgets/drawer_widget.dart';
import 'package:inglourious_basterds/widgets/info_builder.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  MainWrapperState createState() => MainWrapperState();
}

class MainWrapperState extends State<MainWrapper> {
  // NavDrawer Bloc
  late NavDrawerBloc _bloc;

  // Each Item in Drawer Content
  late Widget _content;

  @override
  void initState() {
    super.initState();
    _bloc = NavDrawerBloc();
    _content = _getContentForState(_bloc.state.selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavDrawerBloc>(
      create: (BuildContext context) => _bloc,
      child: BlocConsumer<NavDrawerBloc, NavDrawerState>(
        listener: (BuildContext context, NavDrawerState state) {
          _content = _getContentForState(state.selectedItem);
        },
        buildWhen: (previous, current) {
          return previous.selectedItem != current.selectedItem;
        },
        listenWhen: (previous, current) {
          return previous.selectedItem != current.selectedItem;
        },
        builder: (BuildContext context, NavDrawerState state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                _getAppBarTitle(state.selectedItem),
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 191, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 191, 0)),
              backgroundColor: Color.fromARGB(255, 163, 9, 30),
            ),
            drawer: NavDrawerWidget(),
            body: AnimatedSwitcher(
              switchInCurve: Curves.fastLinearToSlowEaseIn,
              switchOutCurve: Curves.linearToEaseOut,
              duration: const Duration(milliseconds: 400),
              child: _content,
            ),
            bottomNavigationBar: Container(
              color: Color.fromARGB(255, 163, 9, 30),
              padding: EdgeInsets.all(8.0),
              child: const InfoBuilder(),
            ),
          );
        },
      ),
    );
  }

  Widget _getContentForState(NavItem selectedItem) {
    switch (selectedItem) {
      case NavItem.homeView:
        return const HomeView();
      case NavItem.charactersView:
        return const CharactersView();
      case NavItem.scenesView:
        return const ScenesView();
      case NavItem.aboutView:
        return const AboutView();
      case NavItem.personalExperienceView:
        return const PersonalExperienceView();
      case NavItem.hireMeView:
        return const HireMeView();
      default:
        return Container();
    }
  }

  String _getAppBarTitle(NavItem selectedItem) {
    switch (selectedItem) {
      case NavItem.homeView:
        return "Portada";
      case NavItem.charactersView:
        return "Reparto";
      case NavItem.scenesView:
        return "Escenas";
      case NavItem.aboutView:
        return "Acerca de";
      case NavItem.personalExperienceView:
        return "Mi experiencia";
      case NavItem.hireMeView:
        return "Contrátame";
      default:
        return "Bastardos sin gloria";
    }
  }
}
