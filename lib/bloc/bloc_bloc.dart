import 'package:bloc/bloc.dart';
import 'package:blog_explorer/Blog_repo.dart';
import 'package:blog_explorer/models/blogModelFile.dart';
import 'package:meta/meta.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocInitial()) {
    on<BlocEvent>((event, emit) async{
      // TODO: implement event handler
      emit(BlogeLoadingState());
      MyBlogModel blocOBJ = await BlogeRepo().fetchBlogs();
      emit(BlogeLoadedState(blocOBJ));
    });
  }
}
