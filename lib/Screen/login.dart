import 'package:api_demo/Controller/Api%20Controller/api_controller.dart';
import 'package:api_demo/Custom_Widget/Custom_Textfeild.dart';
import 'package:api_demo/Custom_Widget/custom_text.dart';
import 'package:api_demo/Screen/singup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final apiController = Get.put(ApiController());
    final email = TextEditingController();
    final password = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextfeild(
                visible: false,
                hint: 'Email',
                textEditingController: email,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextfeild(
                textEditingController: password,
                hint: 'Password',
                visible: true,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        elevation: 5,
                        overlayColor: Colors.grey,
                        foregroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      apiController.login(email.text, password.text);
                    },
                    child: Obx(() => apiController.isLoad.value == true
                        ? const CircularProgressIndicator()
                        : CustomText(
                            text: 'Login',
                            size: 18,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w500)),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(const Singup(), transition: Transition.leftToRight);
                  },
                  child: CustomText(
                      text: 'Sing up',
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w500))
            ],
          ),
        ),
      ),
    );
  }
}
