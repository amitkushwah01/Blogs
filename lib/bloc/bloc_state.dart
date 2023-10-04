part of 'bloc_bloc.dart';

@immutable
sealed class BlocState {}

final class BlocInitial extends BlocState {}

class BlogeInitState extends BlocState{}
class BlogeLoadingState extends BlocState{}

class BlogeLoadedState extends BlocState{
  MyBlogModel Modelobj;
  BlogeLoadedState(this.Modelobj);
}

class BlogeErrorState extends BlocState{
  String errorMsg;
  BlogeErrorState(this.errorMsg);
}
