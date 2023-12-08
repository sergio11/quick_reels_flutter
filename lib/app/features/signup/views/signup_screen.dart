import 'package:flutter/material.dart';
import 'package:quickreels/app/core/base/base_view.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/widget/text_input_field.dart';
import 'package:quickreels/app/features/signup/controllers/signup_controller.dart';

class SignupScreen extends BaseView<SignupController> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
   return null;
  }

  @override
  Widget body(BuildContext context) {
   return Container(
     alignment: Alignment.center,
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text(
           'Quick Reels',
           style: TextStyle(
             fontSize: 35,
             color: AppColors.buttonColor,
             fontWeight: FontWeight.w900,
           ),
         ),
         const Text(
           'Register',
           style: TextStyle(
             fontSize: 25,
             fontWeight: FontWeight.w700,
           ),
         ),
         const SizedBox(
           height: 25,
         ),
         Stack(
           children: [
             const CircleAvatar(
               radius: 64,
               backgroundImage: NetworkImage(
                   'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
               backgroundColor: Colors.black,
             ),
             Positioned(
               bottom: -10,
               left: 80,
               child: IconButton(
                 onPressed: () => controller.pickImage(),
                 icon: const Icon(
                   Icons.add_a_photo,
                 ),
               ),
             ),
           ],
         ),
         const SizedBox(
           height: 15,
         ),
         Container(
           width: MediaQuery.of(context).size.width,
           margin: const EdgeInsets.symmetric(horizontal: 20),
           child: TextInputField(
             controller: _usernameController,
             labelText: 'Username',
             icon: Icons.person,
           ),
         ),
         const SizedBox(
           height: 15,
         ),
         Container(
           width: MediaQuery.of(context).size.width,
           margin: const EdgeInsets.symmetric(horizontal: 20),
           child: TextInputField(
             controller: _emailController,
             labelText: 'Email',
             icon: Icons.email,
           ),
         ),
         const SizedBox(
           height: 15,
         ),
         Container(
           width: MediaQuery.of(context).size.width,
           margin: const EdgeInsets.symmetric(horizontal: 20),
           child: TextInputField(
             controller: _passwordController,
             labelText: 'Password',
             icon: Icons.lock,
             isObscure: true,
           ),
         ),
         const SizedBox(
           height: 30,
         ),
         Container(
           width: MediaQuery.of(context).size.width - 40,
           height: 50,
           decoration: BoxDecoration(
             color: AppColors.buttonColor,
             borderRadius: const BorderRadius.all(
               Radius.circular(5),
             ),
           ),
           child: InkWell(
             onTap: () => controller.registerUser(
               _usernameController.text,
               _emailController.text,
               _passwordController.text
             ),
             child: const Center(
               child: Text(
                 'Register',
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.w700,
                 ),
               ),
             ),
           ),
         ),
         const SizedBox(
           height: 15,
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const Text(
               'Already have an account? ',
               style: TextStyle(
                 fontSize: 20,
               ),
             ),
             InkWell(
               onTap: () => {},
               child: Text(
                 'Login',
                 style: TextStyle(fontSize: 20, color: AppColors.buttonColor),
               ),
             ),
           ],
         ),
       ],
     ),
   );
  }
}