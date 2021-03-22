import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:seventh_main/data/core/urls.dart';
import 'package:seventh_main/post_client.dart';
import 'package:seventh_main/screens/authenticatonscreen/register.dart';
import 'package:seventh_main/screens/home/home_screen.dart';
import 'package:seventh_main/util/themes/app_colors.dart';
import 'package:seventh_main/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ApiClient client = ApiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.authButtonMain,
        elevation: 0.0,
        actions: [
          OutlineButton(
            textColor: Colors.white,
            child: Text('Skip'),
            borderSide: BorderSide(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 1,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false,
              );
            },
          )
        ],
      ),
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
                height: 40,
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  'assets/cs-tips-for-better-digestive-health-722x406.jpg',
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
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
                  RequiredValidator(errorText: 'Name is required.'),
                  EmailValidator(errorText: 'Please enter valid email')
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
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Password is required.'),
                  MinLengthValidator(8,
                      errorText: 'Password must contain at least 8 characters.')
                ]),
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
                height: 30,
              ),
              Builder(
                builder: (context) => CustomButton(
                  buttonName: 'Login',
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      try {
                        Map<String, String> data = {
                          "email": emailController.text,
                          "password": passwordController.text,
                        };
                        await client.post(userLoginEndPoint, data);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false,
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
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Create new account..?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  OutlineButton(
                    // shape: StadiumBorder(),
                    textColor: Colors.white,
                    child: Text('Register'),
                    borderSide: BorderSide(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                  )
                ],
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
