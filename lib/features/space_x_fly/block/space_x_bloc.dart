import 'package:bloc/bloc.dart';
import 'package:spacex/features/space_x_fly/block/space_x_event.dart';
import 'package:spacex/features/space_x_fly/block/space_x_state.dart';
import 'package:spacex/features/space_x_fly/repository/space_x_repository.dart';

class SpaceXBloc extends Bloc<SpaceXEvent, SpaceXState> {
  final SpaceXRepository _spaceXRepository;

  SpaceXBloc(this._spaceXRepository) : super(SpaceXLoadingState()) {
    on<SpaceXFetchEvent>((event, emit) async {
      emit(SpaceXLoadingState());
      try {
        final result = await _spaceXRepository.getFlyData();
        emit(SpaceXLoadedState(result));
      } catch (e) {
        emit(SpaceXErrorState(e.toString()));
      }
    });
  }
}
