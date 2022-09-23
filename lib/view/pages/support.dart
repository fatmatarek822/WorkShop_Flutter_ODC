import 'package:flutter/material.dart';
import 'package:odcworkshop2/core/resources/color_manager.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

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
        title: const Text('Support', style: TextStyle(fontSize: 25, color: blackColor),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                cursorColor: mainColor,
                decoration: InputDecoration(
                  label: const Text(
                    'Name',
                  ),
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: grayColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 3,
                      color: ErrorColor,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: mainColor, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                cursorColor: mainColor,
                decoration: InputDecoration(
                  label: const Text(
                    'E-Mail',
                  ),
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(Icons.mail,color: mainColor,),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 3,
                      color: ErrorColor,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: mainColor, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                cursorColor: mainColor,
                maxLines: 4,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  label: const Text(
                    'What\'s making you unhappy ? ',

                  ),
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: grayColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 3,
                      color: ErrorColor,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: mainColor, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: mainColor, // b
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),// ackground// foreground
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}