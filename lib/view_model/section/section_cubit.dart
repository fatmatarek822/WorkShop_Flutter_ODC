
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/model/section.dart';
import 'package:odcworkshop2/view_model/database/network/dio_helper.dart';
import 'package:odcworkshop2/view_model/database/network/end_points.dart';
import 'package:odcworkshop2/view_model/section/section_state.dart';

class SectionCubit extends Cubit<SectionState>{
  SectionCubit() : super(SectionInitial());

  static SectionCubit get(context) => BlocProvider.of(context);

  SectionModel? sectionmodel;

  void getData() async
  {
    await DioHelper.getData(url: sectionEndPoint, token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjM1LCJyb2xlIjo0LCJpYXQiOjE2NjM3NTA0MTksImV4cCI6MTc1MDE1MDQxOX0.lV5ywPhPKxmWxMs-78JtRK1ZFN9P_dssA8HENDN6wCM').then((value)
    {
      sectionmodel = SectionModel.fromJson(value.data);
      emit(SectionSuccessState());
      print(sectionmodel!.data![0].sectionSubject);
    });
  }

}