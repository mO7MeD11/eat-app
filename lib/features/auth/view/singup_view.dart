import 'package:eat/core/constant/app_colors.dart';
import 'package:eat/shared/custom_text.dart';
import 'package:eat/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SingUpView extends StatefulWidget {
  const SingUpView({super.key});

  @override
  State<SingUpView> createState() => _SingUpViewState();
}

class _SingUpViewState extends State<SingUpView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(screenHight * .12),

                    Center(
                      child: SvgPicture.asset(
                        'assets/logo/logo.svg',
                        width: screenWidth * 0.7,
                      ),
                    ),
                    Gap(10),
                    CustomText(
                      text: 'WelcomeBack Discover the fast food ',
                      size: 16,
                      weight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    Gap(30),
                    CustomTextFormField(
                      hintText: 'name',
                      controller: nameController,
                      icon: Icon(Icons.person),
                    ),
                    Gap(15),
                    CustomTextFormField(
                      hintText: 'email',
                      controller: emailController,
                      icon: Icon(Icons.email),
                    ),
                    Gap(15),
                    CustomTextFormField(
                      hintText: 'PassWord',
                      controller: passWordController,

                      obscure: true,
                    ),
                    Gap(15),
                    CustomTextFormField(
                      hintText: 'confirmPassWord',
                      controller: confirmPasswordController,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Confirm Password is required';
                        }
                        if (v != passWordController.text) {
                          return 'password not match';
                        }
                        return null;
                      },
                      obscure: true,
                    ),
                    Gap(30),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          // => send to Api
                        }
                      },
                      child: Container(
                        height: 50,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                          child: CustomText(
                            text: 'Sign Up',
                            size: 18,
                            weight: FontWeight.w600,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
