
import 'package:flutter/material.dart';

Widget OrangeText () => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: const [
    Text(
      'Orange ',
      style: TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 25),
    ),
    Text(
      'Digital Center',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    ),
  ],
);

Widget BuildCardHome({
  required IconData icon,
  required String text,
}) => Stack(
  alignment: AlignmentDirectional.topCenter,
  children: [
    Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 20,
      child: Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(20)
        ),
      ),
    ),
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[300],
            child: Icon(icon, color: Colors.orange, size: 35,),
          ),
        ),
        Text(text),
      ],
    ),


  ],
);


Widget BuildCardLectures({
  required String name,
  required String day,
  required String StartTime,
  required String EndTime,
  required String DaySection,


}) => Padding(
  padding: const EdgeInsets.only(top: 15,right: 15,left: 15),
  child: Container(
    height: 107,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.0),
      ),
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Spacer(),
                const Icon(
                  Icons.alarm,
                  size: 16,
                ),
                const Text(
                  '2hrs',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                       DaySection,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.black54,
                          size: 20,
                        ),
                        Text(
                          day,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Start Time',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.alarm,
                          color: Colors.green,
                          size: 20,
                        ),
                        Text(
                          StartTime,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                   const Text(
                      'End Time',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.alarm,
                          color: Colors.red,
                          size: 20,
                        ),
                        Text(
                          EndTime,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ),
);


void navigateTo(context, Widget) => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => Widget),
);

void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => Widget),
      (Route<dynamic> route) => false,
);
