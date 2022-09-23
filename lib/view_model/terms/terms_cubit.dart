import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/model/terms.dart';
import 'package:odcworkshop2/view_model/database/network/dio_helper.dart';
import 'package:odcworkshop2/view_model/database/network/end_points.dart';
import 'package:odcworkshop2/view_model/terms/terms_state.dart';

class TermsCubit extends Cubit<TermsState>{
  TermsCubit() : super(TermsInitial());

  static TermsCubit get(context) => BlocProvider.of(context);


  TermsModel? termsmodel;

  void getTermsData() async
  {
    await DioHelper.getData(url: termsEndPoint, token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjM1LCJyb2xlIjo0LCJpYXQiOjE2NjM3NTA0MTksImV4cCI6MTc1MDE1MDQxOX0.lV5ywPhPKxmWxMs-78JtRK1ZFN9P_dssA8HENDN6wCM').then((value)
    {
      termsmodel = TermsModel.fromJson(value.data);
      emit(TermsSuccessState());
      print(termsmodel!.data!.terms);
    });
  }

}