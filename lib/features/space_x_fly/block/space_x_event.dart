import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class SpaceXEvent extends Equatable {
  const SpaceXEvent();
}

class SpaceXFetchEvent extends SpaceXEvent {
  @override
  List<Object?> get props => [];
}
