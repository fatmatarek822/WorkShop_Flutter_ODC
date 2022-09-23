import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/model/lecture.dart';
import 'package:odcworkshop2/view_model/database/network/dio_helper.dart';
import 'package:odcworkshop2/view_model/database/network/end_points.dart';
import 'package:odcworkshop2/view_model/lectures/lectures_state.dart';

class LecturesCubit extends Cubit<LecturesState>{
  LecturesCubit() : super(LecturesInitial());

  static LecturesCubit get(context) => BlocProvider.of(context);

  LecturesModel? lecturemodel;

  void getLectureData() async
  {
    await DioHelper.getData(url: lectureEndPoint, token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjM1LCJyb2xlIjo0LCJpYXQiOjE2NjM3NTA0MTksImV4cCI6MTc1MDE1MDQxOX0.lV5ywPhPKxmWxMs-78JtRK1ZFN9P_dssA8HENDN6wCM').then((value)
    {
      lecturemodel = LecturesModel.fromJson(value.data);
      emit(LecturesSuccessState());
      print(lecturemodel!.data![0].lectureSubject);
    });
  }


}