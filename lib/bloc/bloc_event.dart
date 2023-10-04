part of 'bloc_bloc.dart';

@immutable
sealed class BlocEvent {}

class TrendingBlogeEvent extends BlocEvent
{
  TrendingBlogeEvent();
}