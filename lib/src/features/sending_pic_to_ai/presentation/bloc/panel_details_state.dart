import 'dart:io';
import 'package:equatable/equatable.dart';


enum PanelDetailsInternalState {
  homeInitial,
  selectImageSuccess,
  selectImageError,
  sendImageToAiLoading,
  sendImageToAiSuccess,
  sendImageToAiError
}

class PanelDetailsState extends Equatable {
  final PanelDetailsInternalState? currentState;
  final File? selectedImage;
  final String? result;
  final String? errorMsg;

  const PanelDetailsState({
    this.currentState,
    this.result,
    this.selectedImage,
    this.errorMsg
  });

  factory PanelDetailsState.initial(){
    return const PanelDetailsState(
        currentState : PanelDetailsInternalState.homeInitial,
        selectedImage : null,
        result : '',
        errorMsg : ''
    );
  }

  PanelDetailsState copyWith({
    required PanelDetailsInternalState state,
    File? selectedImage,
    String? errorMessage
  })
  {
    return PanelDetailsState(
      currentState: state,
      selectedImage: selectedImage?? selectedImage,
      errorMsg: errorMessage?? errorMsg,
    );
  }

  @override
  List<Object?> get props => [currentState, selectedImage, errorMsg];
}