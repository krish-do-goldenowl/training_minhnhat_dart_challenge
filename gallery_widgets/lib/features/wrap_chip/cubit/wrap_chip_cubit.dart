import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wrap_chip_state.dart';

class WrapChipCubit extends Cubit<WrapChipState> {
  WrapChipCubit() : super(WrapChipInitial());
}
