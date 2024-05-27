import 'package:dashboard_flutter/constants.dart';
import 'package:dashboard_flutter/screens/authentications/signup_w.dart';
import 'package:dashboard_flutter/services/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../main/main_screen.dart';



class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key? key
  }):super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();    //to validate the form
  String error = "";


  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
print("I am in login widget");
    return Theme(
        data: ThemeData.light(),
        child: SafeArea(
            child: Scaffold(


                body: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    // occupy available horizontal space as parent allows
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    // widget will occupy the entire height of device screen.

                    child: Form(
                      key:_formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          SizedBox(
                              child: Column(
                      
                                children: [
                                  FadeInUp(duration: Duration(milliseconds: 1000),
                                      child: Text("Login", style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),)),
                      
                                  FadeInUp(duration: Duration(milliseconds: 1300),
                                      child: Text("Login to your account")),
                                ],
                              )),
                      
                      
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: <Widget>[
                                FadeInUp(duration: const Duration(
                                    milliseconds: 1200), child: makeInput(
                                    label: "Email",
                                    hintText: 'Enter your email',
                                    controller: _emailController,
                                    validator:(val)=> _emailController.text.isEmpty ? "Enter your email address" : null
                                )),
                                FadeInUp(duration: const Duration(
                                    milliseconds: 1300), child: makeInput(
                                    label: "Password",
                                    obscureText: true,
                                    hintText: 'Enter your password',
                                    controller: _passwordController,
                                    validator: (val)=> _passwordController.text.isEmpty ? "Enter your password" : null
                                ))
                      
                              ],
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultPadding),
                              child: MaterialButton(
                                  onPressed: () async {
                                    print("Clicked===========");
                                    if(_formKey.currentState!.validate()){
                                    dynamic result = await _auth.signInWithEmailPassword(_emailController.text, _passwordController.text);
                                    if (result == null) {
                                      setState(() {
                                        error = "Please enter valid email or password";

                                      });
                                    } else {


                                      if(kDebugMode){
                                        print("signed in..");

                                      }

                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainScreen()));

                                    }


                                    }


                                  },
                                  minWidth: double.infinity,
                      
                                  height: 60,
                                  color: secondaryColor,

                      
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    "Login", style: TextStyle(color: Colors
                                      .white),))
                      
                      
                          ),
                          SizedBox(height: 12.0,),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red,fontSize: 16.0),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't have an account?"),
                                  const SizedBox(width: 5,),
                                  TextButton(
                                   onPressed: (){
                                     // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpWidget()));
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpWidget()));

                                   },
                                  child:const Text("Sign up", style: TextStyle(
                                 fontWeight: FontWeight.bold, fontSize: 16),))


                                ],
                              )
                          )
                        ],
                      ),
                    ),
                  ),


                )

            )
        )

    );
  }

}


Widget makeInput({label,obscureText=false,hintText,controller,validator}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(label,style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,

      ),),
      SizedBox(height: 5,),
      TextFormField(
        controller: controller,
        onChanged: (val){
          print("Value changed   $val");
        },
        validator: validator,

        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color:Colors.grey.shade400),
            )
        ),
      ),
      SizedBox(height: 30,)
    ],
  );
}
