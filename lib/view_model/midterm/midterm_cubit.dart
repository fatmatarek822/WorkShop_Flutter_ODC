
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/model/exam.dart';
import 'package:odcworkshop2/view_model/database/network/dio_helper.dart';
import 'package:odcworkshop2/view_model/database/network/end_points.dart';
import 'package:odcworkshop2/view_model/midterm/midterm_state.dart';

class MidtermCubit extends Cubit<MidtermState>{
  MidtermCubit() : super(MidtermInitial());

  static MidtermCubit get(context) => BlocProvider.of(context);

  ExamModel? midtermmodel;

  void getMidtermData() async
  {
    await DioHelper.getData(url: userExamsEndPoint, token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjM1LCJyb2xlIjo0LCJpYXQiOjE2NjM3NTA0MTksImV4cCI6MTc1MDE1MDQxOX0.lV5ywPhPKxmWxMs-78JtRK1ZFN9P_dssA8HENDN6wCM').then((value)
    {
      midtermmodel = ExamModel.fromJson(value.data);
      emit(MidtermSuccessState());
      print(midtermmodel!.data![0].examSubject);
    });
  }


}