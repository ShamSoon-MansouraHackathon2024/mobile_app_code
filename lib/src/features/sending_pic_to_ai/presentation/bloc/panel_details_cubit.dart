import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shamsoon/src/core/helpers/helper_methods/image_picker.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/data/repo/repo.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/presentation/bloc/panel_details_state.dart';

class PanelDetailsCubit extends Cubit<PanelDetailsState> {
  PanelDetailsCubit(this.repo) : super(PanelDetailsState.initial());
  PanelDetailsRepo repo;

  Future<void> pickImage()async{
    final result = await ImageSelector.selectImage(ImageSource.gallery);
    if(result != null){
      emit(state.copyWith(state: PanelDetailsInternalState.selectImageSuccess, selectedImage: result));
    }else{
      emit(state.copyWith(state: PanelDetailsInternalState.selectImageError));
    }
  }

  Future<void> sendImageToAi()async{
    await repo.sendImageToAi(state.selectedImage);
  }
}
