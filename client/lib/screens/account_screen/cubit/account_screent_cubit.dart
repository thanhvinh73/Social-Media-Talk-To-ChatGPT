import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_screent_state.dart';
part 'account_screent_cubit.freezed.dart';

class AccountScreentCubit extends Cubit<AccountScreentState> {
  AccountScreentCubit() : super(AccountScreentState.initial());
}
