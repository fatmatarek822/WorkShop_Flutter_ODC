import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/view/component/core/core_components.dart';
import 'package:odcworkshop2/view/pages/events.dart';
import 'package:odcworkshop2/view/pages/finals.dart';
import 'package:odcworkshop2/view/pages/lectures.dart';
import 'package:odcworkshop2/view/pages/midterms.dart';
import 'package:odcworkshop2/view/pages/note.dart';
import 'package:odcworkshop2/view/pages/section.dart';
import 'package:odcworkshop2/view_model/home/home_cubit.dart';
import 'package:odcworkshop2/view_model/home/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeMainCubit(),
      child: BlocConsumer<HomeMainCubit, HomeMainState>(
        listener: (context, state) {},
        builder: (context, state) {

          HomeMainCubit cubit = HomeMainCubit.get(context);

           return Scaffold(
             backgroundColor: whiteColor,
              appBar: AppBar(
            backgroundColor: whiteColor,
            elevation: 0,
              ),
              body: Column(
              children: [
              OrangeText(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
                  child: GridView.count(
                    physics: BouncingScrollPhysics(),
                    childAspectRatio: MediaQuery
                        .of(context)
                        .size
                        .height / 400,
                    // primary: false,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: <Widget>[

                      InkWell(
                        onTap: () {
                          navigateTo(context, LecturesScreen(),);
                        },
                        child: BuildCardHome(
                            icon: Icons.menu_book_outlined, text: 'Lectures'),),
                      InkWell(
                          onTap: () {
                            navigateTo(context, SectionScreen(),);
                          },
                          child: BuildCardHome(
                              icon: Icons.group, text: 'Sections')),
                      InkWell(
                          onTap: () {
                            navigateTo(context, MidtermsScreen(),);
                          },
                          child: BuildCardHome(icon: Icons.text_snippet_sharp,
                              text: 'Midterms')),
                      InkWell(
                          onTap: () {
                            navigateTo(context, FinalsScreen(),);
                          },
                          child: BuildCardHome(
                              icon: Icons.grading_rounded, text: 'Finals')),
                      InkWell(
                          onTap: () {
                            navigateTo(context, EventsScreen(),);
                          },
                          child: BuildCardHome(
                              icon: Icons.calendar_month, text: 'Events')),
                      InkWell(
                          onTap: () {
                            navigateTo(context, NoteScreen(),);
                          },
                          child: BuildCardHome(
                              icon: Icons.note_alt, text: 'Notes')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
        },
      ),
    );
  }
}

