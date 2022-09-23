import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/view_model/faq/faq_cubit.dart';
import 'package:odcworkshop2/view_model/faq/faq_state.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FAQCubit()..getFAQData(),
      child: BlocConsumer<FAQCubit, FAQState>(
        listener: (context, state) {},
        builder: (context, state) {
          FAQCubit myCubit = FAQCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: whiteColor,
              centerTitle: true,
              title: const Text(
                'FAQ',
                style: TextStyle(
                  color: blackColor,
                  fontSize: 25,
                ),
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: mainColor,
                  )),
            ),
            body: myCubit.faqmodel == null
                ? const Center(
                    child: CircularProgressIndicator(
                    color: mainColor,
                  ))
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: myCubit.faqmodel!.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius:
                                    BorderRadiusDirectional.circular(20),
                              ),
                              child: ExpansionTile(
                                title: Html(
                                    data: myCubit
                                        .faqmodel!.data![index].question),
                                iconColor: blackColor,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            const BorderRadiusDirectional.only(
                                                bottomStart:
                                                    Radius.circular(20),
                                                bottomEnd:
                                                    Radius.circular(20))),
                                    child: ListTile(
                                      title: Html(
                                          data: myCubit
                                              .faqmodel!.data![index].answer),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
