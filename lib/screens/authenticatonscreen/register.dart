import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:seventh_main/data/core/urls.dart';
import 'package:seventh_main/post_client.dart';
import 'package:seventh_main/util/themes/app_colors.dart';
import 'package:seventh_main/widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    ApiClient client = ApiClient();

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.authButtonMain,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25.0,
          right: 25.0,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'UserName',
                style: textStyle,
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: userNameController,
                keyboardType: TextInputType.emailAddress,
                validator: MultiValidator([
                  RequiredValidator(
                    errorText: 'UserName is required.',
                  ),
                  MinLengthValidator(
                    8,
                    errorText: 'UserName should be at least 8 characters',
                  ),
                ]),
                decoration: InputDecoration(
                  hintText: 'UserName',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Email',
                style: textStyle,
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Email is required.'),
                  EmailValidator(errorText: 'Enter valid email')
                ]),
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Password',
                style: textStyle,
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: MultiValidator(
                    [RequiredValidator(errorText: 'password is required.')]),
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Confirm Password',
                style: textStyle,
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                validator: MultiValidator(
                    [RequiredValidator(errorText: 'password is required.')]),
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Builder(
                builder: (context) => CustomButton(
                    buttonName: 'Register',
                    onTap: () async {
                      if (_formKey.currentState.validate()) {
                        Map<String, String> user = {
                          "userName": userNameController.text,
                          "email": emailController.text,
                          "password": passwordController.text,
                          "confirmPassword": confirmPasswordController.text,
                        };
                        try {
                          await client.post(userRegisterEndPoint, user);
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('User Registered'),
                            ),
                          );
                        } catch (error) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(error.toString()),
                            ),
                          );
                        }
                      } else {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Please enter all fields'),
                          ),
                        );
                      }
                    }),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final TextStyle textStyle = TextStyle(
  color: Colors.white,
  fontStyle: FontStyle.italic,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
