import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/view/component/core/core_components.dart';
import 'package:odcworkshop2/view/pages/layout.dart';
import 'package:odcworkshop2/view_model/lectures/lectures_cubit.dart';
import 'package:odcworkshop2/view_model/lectures/lectures_state.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (context) => LecturesCubit()..getLectureData(),
      child: BlocConsumer<LecturesCubit, LecturesState>(
        listener: (context, state) {},
        builder: (context, state) {
          LecturesCubit myCubit = LecturesCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: whiteColor,
              centerTitle: true,
              title: const Text(
                'Lectures',
                style: TextStyle(
                  color: blackColor,
                  fontSize: 25,
                ),
              ),
              leading: IconButton(
                  onPressed: () {
                    navigateAndFinish(context, LayoutScreen());
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: mainColor,
                  )),
              actions: [
                PopupMenuButton(
                  icon: const Icon(
                    Icons.filter_alt,
                    color: mainColor,
                    size: 28,
                  ),
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text("All Lectures"),
                      ),
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text("Finished Lectures"),
                      ),
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text("Remaining Lectures"),
                      ),
                    ];
                  },
                ),
              ],
            ),
            body: myCubit.lecturemodel == null
                ? const Center(
                    child: CircularProgressIndicator(
                    color: mainColor,
                  ))
                : ListView.builder(
                    itemCount: myCubit.lecturemodel!.data!.length,
                    itemBuilder: (context, index) {
                      return BuildCardLectures(
                        name: myCubit.lecturemodel!.data![index].lectureSubject
                            .toString(),
                        day: myCubit.lecturemodel!.data![index].lectureDate
                            .toString(),
                        StartTime: myCubit
                            .lecturemodel!.data![index].lectureStartTime
                            .toString(),
                        EndTime: myCubit
                            .lecturemodel!.data![index].lectureEndTime
                            .toString(),
                        DaySection: myCubit
                            .lecturemodel!.data![index].lectureEndTime
                            .toString(),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
