import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample_project/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(30.0),
          child: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft, 
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  SizedBox(height: 20,),
                  CustomTextField(
                    controller: TextEditingController(), 
                    onChanged: (value) {  
                      controller.validateEmail(value);
                    },
                    hintText: "Email",
                  ),
                  
                Spacer(),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                   height: 20, // Set the height as needed
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       CustomTextWithUnderline(
                        text: "Find Email",
                        textColor: Colors.grey,
                      ),
                                      
                       VerticalDivider(
                         color: Colors.grey.withOpacity(0.8),
                         thickness: 1,
                         width: 40,
                         indent: 2,
                         endIndent: 2,
                       ),
                        CustomTextWithUnderline(
                        text: "Find Password",
                        textColor: Colors.grey,
                      ),
                      
                     ],
                   ),
                 ),
                 ),

                  Obx(() {
                    // Use Obx to observe isEmailValid
                    return CustomElevatedButton(
                    isEnabled: controller.isEmailValid.value,
                    onPressed: () {
                      controller.login();
                    },
                    label: controller.isEmailValid.value
                        ? "Next"
                        : "Enter Your Email Address",
                  );
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomTextWithUnderline extends StatelessWidget {
  final String text;
  final Color textColor;

  CustomTextWithUnderline({
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor.withOpacity(0.8),
        decoration: TextDecoration.underline,
      ),
    );
  }
}


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String hintText;
  final bool isObscureText;

  CustomTextField({
    required this.controller,
    required this.onChanged,
    required this.hintText,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: isObscureText,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => controller.clear(),
        ),
        hintText: hintText,
      ),
    );
  }
}


class CustomElevatedButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;
  final String label;

  CustomElevatedButton({
    required this.isEnabled,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            isEnabled ? Colors.black : Colors.grey,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(
            Size(double.infinity, 50.0),
          ),
        ),
      ),
    );
  }
}