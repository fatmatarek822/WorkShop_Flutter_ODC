import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/view_model/add_note/add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState>{
  AddNoteCubit() : super(AddNoteInitial());

  static AddNoteCubit get(context) => BlocProvider.of(context);


}