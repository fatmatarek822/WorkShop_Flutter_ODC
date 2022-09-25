
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';
import 'package:odcworkshop2/view/component/core/core_components.dart';
import 'package:odcworkshop2/view/pages/events.dart';
import 'package:odcworkshop2/view/pages/layout.dart';
import 'package:odcworkshop2/view/pages/login.dart';
import 'package:odcworkshop2/view/pages/register.dart';
import 'package:odcworkshop2/view/pages/section.dart';
import 'package:odcworkshop2/view/pages/setting.dart';
import 'package:odcworkshop2/view_model/database/network/dio_helper.dart';
import 'package:odcworkshop2/view_model/database/network/local/cache_helper.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  String? accessToken = CacheHelper.getData(key: 'accessToken');

  if(accessToken !=null)
  {
    widget = LayoutScreen();
  }else
    {
      widget = Login();
    }

  runApp(MyApp(startWidget: widget,));

 // dynamic accessToken = CacheHelper.getData(key: 'token');
}

class MyApp extends StatelessWidget {

  final Widget? startWidget;

   MyApp({super.key, this.startWidget});

  //List<Widget> views =[];

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange,
        ),
        home: AnimatedSplashScreen(
            splash: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OrangeText(),
                const SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  child: LinearPercentIndicator(
                    barRadius: const Radius.circular(20),
                    linearStrokeCap: LinearStrokeCap.round,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 10.0,
                    percent: 1,
                    progressColor: mainColor,
                  ),
                ),
              ],
            ),
            nextScreen: startWidget!),
      ),
    );
  }
}


