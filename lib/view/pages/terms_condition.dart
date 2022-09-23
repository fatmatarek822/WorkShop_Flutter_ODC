import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/view_model/terms/terms_cubit.dart';
import 'package:odcworkshop2/view_model/terms/terms_state.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TermsCubit()..getTermsData(),
      child: BlocConsumer<TermsCubit, TermsState>(
        listener: (context, state) {},
        builder: (context, state) {
          TermsCubit myCubit = TermsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: whiteColor,
              centerTitle: true,
              title: const Text(
                'Terms & Conditions',
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
            body: myCubit.termsmodel == null
                ? const Center(
                    child: CircularProgressIndicator(
                    color: mainColor,
                  ))
                : SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Html(data: myCubit.termsmodel!.data!.terms),
                  ),
          );
        },
      ),
    );
  }
}
