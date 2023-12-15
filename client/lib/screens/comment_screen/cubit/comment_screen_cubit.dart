import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_screen_state.dart';
part 'comment_screen_cubit.freezed.dart';

class CommentScreenCubit extends Cubit<CommentScreenState> {
  CommentScreenCubit() : super(CommentScreenState.initial());
}
