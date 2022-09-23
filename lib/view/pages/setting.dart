import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/view/component/login/login_components.dart';
import 'package:odcworkshop2/view/component/pages_components/setting_components.dart';
import 'package:odcworkshop2/view/pages/faq.dart';
import 'package:odcworkshop2/view/pages/our_partners.dart';
import 'package:odcworkshop2/view/pages/support.dart';
import 'package:odcworkshop2/view/pages/terms_condition.dart';
import 'package:odcworkshop2/view_model/setting/setting_cubit.dart';
import 'package:odcworkshop2/view_model/setting/setting_state.dart';

import '../component/core/core_components.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit(),
      child: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state)
        {
          if(state is LogOutSuccess)
          {
            showToast(text: 'Logout Success', state: ToastStates.SUCCESS);
          }
        },
        builder: (context, state)
        {
          SettingCubit cubit = SettingCubit.get(context);

          return Scaffold(
            backgroundColor: whiteColor,
            appBar: AppBar(
              backgroundColor: whiteColor,
              elevation: 0,
              title: const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [

                InkWell(
                    onTap: ()
                    {
                      navigateTo(context, const FAQScreen());
                    },
                    child: DefaultListTile(text: 'FAQ')),
                divider(),
                InkWell( onTap: ()
                {
                  navigateTo(context, const TermsAndCondition());
                },child: DefaultListTile(text: 'Terms & Conditions')),
                divider(),
                InkWell(
                    onTap: ()
                    {
                      navigateTo(context, const OurPartnerScreen());
                    },
                    child: DefaultListTile(text: 'Our Partners')),
                divider(),
                InkWell(
                    onTap: ()
                    {
                      navigateTo(context, const SupportScreen());
                    },
                    child: DefaultListTile(text: 'Support')),
                divider(),
                InkWell(
                  child: DefaultListTile(text: 'Log Out'),
                  onTap: (){
                    cubit.showMaterialDialog(context);

                  },
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}