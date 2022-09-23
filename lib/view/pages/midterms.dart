import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/view/component/core/core_components.dart';
import 'package:odcworkshop2/view/pages/layout.dart';
import 'package:odcworkshop2/view_model/midterm/midterm_cubit.dart';
import 'package:odcworkshop2/view_model/midterm/midterm_state.dart';

class MidtermsScreen extends StatelessWidget {
  const MidtermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MidtermCubit()..getMidtermData(),
      child: BlocConsumer<MidtermCubit, MidtermState>(
        listener: (context, state) {},
        builder: (context, state) {
          MidtermCubit myCubit = MidtermCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: whiteColor,
              centerTitle: true,
              title: const Text(
                'Midterm',
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
                        child: Text("All Midterms"),
                      ),
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text("Finished Midterms"),
                      ),
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text("Remaining Midterms"),
                      ),
                    ];
                  },
                ),
              ],
            ),
            body: myCubit.midtermmodel == null
                ? const Center(
                    child: CircularProgressIndicator(
                    color: mainColor,
                  ))
                : ListView.builder(
                    itemCount: myCubit.midtermmodel!.data!.length,
                    itemBuilder: (context, index) {
                      return BuildCardLectures(
                        name: myCubit.midtermmodel!.data![index].examSubject
                            .toString(),
                        day: myCubit.midtermmodel!.data![index].examDate
                            .toString(),
                        StartTime: myCubit
                            .midtermmodel!.data![index].examStartTime
                            .toString(),
                        EndTime: myCubit.midtermmodel!.data![index].examEndTime
                            .toString(),
                        DaySection: myCubit
                            .midtermmodel!.data![index].examEndTime
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
