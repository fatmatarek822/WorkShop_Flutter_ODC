import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/model/final.dart';
import 'package:odcworkshop2/view_model/database/network/dio_helper.dart';
import 'package:odcworkshop2/view_model/database/network/end_points.dart';
import 'package:odcworkshop2/view_model/finals/final_state.dart';

class FinalCubit extends Cubit<FinalState>{
  FinalCubit() : super(FinalInitial());

  static FinalCubit get(context) => BlocProvider.of(context);


  FinalModel? finalmodel;

  void getFinalData() async
  {
    await DioHelper.getData(url: examsEndPoint, token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjM1LCJyb2xlIjo0LCJpYXQiOjE2NjM3NTA0MTksImV4cCI6MTc1MDE1MDQxOX0.lV5ywPhPKxmWxMs-78JtRK1ZFN9P_dssA8HENDN6wCM').then((value)
    {
      finalmodel = FinalModel.fromJson(value.data);
      emit(FinalSuccessState());
      print(finalmodel!.data![0].examSubject);
    });
  }

}