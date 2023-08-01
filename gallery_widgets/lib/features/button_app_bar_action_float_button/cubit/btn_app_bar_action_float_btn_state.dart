// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'btn_app_bar_action_float_btn_cubit.dart';

class BtnAppBarActionFloatBtnState extends Equatable {
  const BtnAppBarActionFloatBtnState({
    this.showFloatingActionButton = true,
    this.showNotch = true,
    this.floatingActionButtonLocation = FloatingActionButtonLocation.endDocked,
  });

  final bool showFloatingActionButton;
  final bool showNotch;
  final FloatingActionButtonLocation floatingActionButtonLocation;

  @override
  List<Object> get props => [
        showFloatingActionButton,
        showNotch,
        floatingActionButtonLocation,
      ];

  BtnAppBarActionFloatBtnState copyWith({
    bool? showFloatingActionButton,
    bool? showNotch,
    FloatingActionButtonLocation? floatingActionButtonLocation,
  }) {
    return BtnAppBarActionFloatBtnState(
      showFloatingActionButton:
          showFloatingActionButton ?? this.showFloatingActionButton,
      showNotch: showNotch ?? this.showNotch,
      floatingActionButtonLocation:
          floatingActionButtonLocation ?? this.floatingActionButtonLocation,
    );
  }
}
