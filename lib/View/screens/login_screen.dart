import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_sample_project/View/widgets/custom_button.dart';
import 'package:getx_sample_project/View/widgets/custom_text_field.dart';
import 'package:getx_sample_project/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final  controller = Get.find<LoginController>();
  final FocusNode _emailFocus = FocusNode(); // Create a FocusNode for the email TextField


  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).requestFocus(_emailFocus);
    });

   return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(30.0,50,30,50),
          child: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Align(
                      alignment: Alignment.topLeft, 
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Obx((){
                      return CustomTextField(
                      controller: controller.emailController, 
                      onChanged: (value) {  
                        controller.validateEmail(value);
                      },
                      hintText: "E-mail",
                      focusNode: _emailFocus,
                      suffix: controller.emailNotEmpty.value
                            ? 
                            IconButton(
                                icon: Icon(FontAwesomeIcons.solidCircleXmark, color: Colors.grey),
                                onPressed: () => controller.emailController.clear(),
                              )
                            : null,
                    );
                    }),
                      ],
                    ),
                  ),
                  
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
                        : "Enter your email address",
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





