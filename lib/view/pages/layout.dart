import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/view_model/layout/layout_cubit.dart';
import 'package:odcworkshop2/view_model/layout/layout_state.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
       listener: (context, state){},
        builder: (context, state){

          LayoutCubit cubit = LayoutCubit.get(context);

         return Scaffold(
           body:
           Center(
             child: cubit.pages.elementAt(cubit.currentIndex),
           ),
           bottomNavigationBar: Container(
             decoration: BoxDecoration(
               color: whiteColor,
               boxShadow: [
                 BoxShadow(
                   blurRadius: 20,
                   color: Colors.black.withOpacity(.1),
                 )
               ],
             ),
             child: SafeArea(
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                 child: GNav(
                   rippleColor: Colors.grey[300]!,
                   hoverColor: Colors.grey[100]!,
                   gap: 8,
                   activeColor: mainColor,
                   iconSize: 24,
                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                   duration: Duration(milliseconds: 400),
                   tabBackgroundColor: Colors.grey[100]!,
                   color: blackColor,
                   tabs: const [
                     GButton(
                       icon: Icons.home,
                       text: 'Home',

                     ),
                     GButton(
                       icon: Icons.newspaper_outlined,
                       text: 'News',
                     ),
                     GButton(
                       icon: Icons.settings,
                       text: 'Setting',
                     ),
                   ],
                   selectedIndex: cubit.currentIndex,
                   onTabChange: (index) {
                     cubit.ChangeBottomNav(index);
                   },
                 ),
               ),
             ),
           ),
         );
        },
      ),
    );
  }
}

