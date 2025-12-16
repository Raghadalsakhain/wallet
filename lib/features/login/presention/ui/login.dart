import 'package:flutter/material.dart';
import 'package:wallet/core/extension/appSize.dart';
import 'package:wallet/features/home/presention/ui/homescreen.dart';
import 'package:wallet/core/style/color/appcolors.dart';
import 'package:wallet/core/widgets/boutton.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller=TextEditingController(); 
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                  hint: Text('name'), 
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), 
                  borderSide: BorderSide(color: Appcolors.blakcolor)
                 )
                ),
              ),
            ), 
        SizedBox(height: 16,), 
            Boutton(text: 'login', width: context.getWidth(), ouline: false, onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homescreen(name: namecontroller.text,)));  
            }, backGroudcolor:Appcolors.basecolor),
          ],
        ),
      ),
    );
  }
}