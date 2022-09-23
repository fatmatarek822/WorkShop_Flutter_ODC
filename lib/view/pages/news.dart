import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/view_model/news/news_cubit.dart';
import 'package:odcworkshop2/view_model/news/news_state.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (context) => NewsCubit()..getNewsData(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state){},
        builder: (context,state)
        {
          NewsCubit cubit = NewsCubit.get(context);

          return Scaffold(
            body: cubit.newsmodel == null ? const Center(child: CircularProgressIndicator(color: mainColor,)) : ListView.builder(
              itemCount: cubit.newsmodel!.data!.length,
              itemBuilder: (context, index)
              {
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 60, bottom: 20),
                      child: Text(
                        'News',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: blackColor,),
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[350]),
                            child: Image(image: NetworkImage(cubit.newsmodel!.data![index].imageUrl!),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadiusDirectional.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.share,
                                      color: whiteColor,
                                      size: 20,
                                    ),
                                  ),
                                  const VerticalDivider(
                                    width: 1,
                                    indent: 5,
                                    endIndent: 5,
                                    color: whiteColor,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.copy, color: whiteColor, size: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                         Positioned(
                          top: 20,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                                    cubit.newsmodel!.data![index].title!,
                            ),
                          ),
                        ),
                         Positioned(
                          bottom: 20,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              cubit.newsmodel!.data![index].body!,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),

          );
        },
      ),
    );
  }
}
