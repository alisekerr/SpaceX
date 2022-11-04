import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:spacex/features/space_x_fly/model/space_x_model.dart';

@immutable
abstract class SpaceXState extends Equatable {}

class SpaceXLoadingState extends SpaceXState {
  @override
  List<Object?> get props => [];
}

class SpaceXLoadedState extends SpaceXState {
  final List<SpaceXModel> data;

  SpaceXLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}

class SpaceXErrorState extends SpaceXState {
  final String message;

  SpaceXErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
