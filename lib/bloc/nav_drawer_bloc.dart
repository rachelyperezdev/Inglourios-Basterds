import 'package:bloc/bloc.dart';
import 'package:inglourious_basterds/bloc/drawer_event.dart';
import 'package:inglourious_basterds/bloc/nav_drawer_state.dart';

class NavDrawerBloc extends Bloc<NavDrawerEvent, NavDrawerState> {
  NavDrawerBloc() : super(NavDrawerState(NavItem.homeView)) {
    on<NavigateTo>((event, emit) {
      if (event.destination != state.selectedItem) {
        emit(NavDrawerState(event.destination));
      }
    });
  }
}
