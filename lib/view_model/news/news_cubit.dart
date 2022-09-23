import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/model/news.dart';
import 'package:odcworkshop2/view_model/database/network/dio_helper.dart';
import 'package:odcworkshop2/view_model/database/network/end_points.dart';
import 'package:odcworkshop2/view_model/news/news_state.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  NewsModel? newsmodel;

  void getNewsData() async
  {
    await DioHelper.getData(url: newsEndPoint, token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjM1LCJyb2xlIjo0LCJpYXQiOjE2NjM3NTA0MTksImV4cCI6MTc1MDE1MDQxOX0.lV5ywPhPKxmWxMs-78JtRK1ZFN9P_dssA8HENDN6wCM').then((value)
    {
      newsmodel = NewsModel.fromJson(value.data);
      emit(NewsSuccessState());
      print(newsmodel!.data![0].title);
    });
  }

}