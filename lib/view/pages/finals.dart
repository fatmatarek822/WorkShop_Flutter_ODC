import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/view/component/core/core_components.dart';
import 'package:odcworkshop2/view/pages/layout.dart';
import 'package:odcworkshop2/view_model/finals/final_cubit.dart';
import 'package:odcworkshop2/view_model/finals/final_state.dart';

class FinalsScreen extends StatelessWidget {
  const FinalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FinalCubit()..getFinalData(),
      child: BlocConsumer<FinalCubit, FinalState>(
        listener: (context, state) {},
        builder: (context, state) {
          FinalCubit myCubit = FinalCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: whiteColor,
              centerTitle: true,
              title: const Text(
                'Final',
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
                        child: Text("All Finals"),
                      ),
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text("Finished Finals"),
                      ),
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text("Remaining Finals"),
                      ),
                    ];
                  },
                ),
              ],
            ),
            body: myCubit.finalmodel == null
                ? const Center(
                    child: CircularProgressIndicator(
                    color: mainColor,
                  ))
                : ListView.builder(
                    itemCount: myCubit.finalmodel!.data!.length,
                    itemBuilder: (context, index) {
                      return BuildCardLectures(
                        name: myCubit.finalmodel!.data![index].examSubject
                            .toString(),
                        day: myCubit.finalmodel!.data![index].examDate
                            .toString(),
                        StartTime: myCubit
                            .finalmodel!.data![index].examStartTime
                            .toString(),
                        EndTime: myCubit.finalmodel!.data![index].examEndTime
                            .toString(),
                        DaySection: myCubit.finalmodel!.data![index].examEndTime
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
