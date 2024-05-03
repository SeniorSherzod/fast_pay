import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_event.dart';
part 'bottom_state.dart';

class BottomBloc extends Bloc<BottomEvent, BottomState> {
  BottomBloc() : super(BottomInitial()) {
    on<BottomEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
