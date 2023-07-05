import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'feat_test_event.dart';
part 'feat_test_state.dart';

class FeatTestBloc extends Bloc<FeatTestEvent, FeatTestState> {
  FeatTestBloc() : super(FeatTestInitial()) {
    on<FeatTestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
