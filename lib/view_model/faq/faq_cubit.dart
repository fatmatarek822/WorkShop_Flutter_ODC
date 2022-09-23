import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/model/faq.dart';
import 'package:odcworkshop2/view_model/database/network/dio_helper.dart';
import 'package:odcworkshop2/view_model/database/network/end_points.dart';
import 'package:odcworkshop2/view_model/faq/faq_state.dart';

class FAQCubit extends Cubit<FAQState>{
  FAQCubit() : super(FAQInitial());

  static FAQCubit get(context) => BlocProvider.of(context);


  FAQModel? faqmodel;

  void getFAQData() async
  {
    await DioHelper.getData(url: faqEndPoint, token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjM1LCJyb2xlIjo0LCJpYXQiOjE2NjM3NTA0MTksImV4cCI6MTc1MDE1MDQxOX0.lV5ywPhPKxmWxMs-78JtRK1ZFN9P_dssA8HENDN6wCM').then((value)
    {
      faqmodel = FAQModel.fromJson(value.data);
      emit(FAQSuccessState());
      print(faqmodel!.data![0].answer);
    });
  }

}