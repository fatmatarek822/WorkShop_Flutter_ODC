import 'package:flutter/material.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';

class OurPartnerScreen extends StatelessWidget {
  const OurPartnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: mainColor,
            ),),
        centerTitle: true,
        title: const Text('Our Partners', style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Card(
                  elevation: 20,
                  child: Container(
                    width: 400,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(50),
                    ),
                    child: const Image(image: NetworkImage('https://media-exp1.licdn.com/dms/image/C4E1BAQENDMK0ZgaW8g/company-background_10000/0/1642165538816?e=2147483647&v=beta&t=hhcgn1wfutOU_v8SU6O0mvJEP_IoLULCtSNP3pl7tgc',),),),
                  ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('ODC', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
