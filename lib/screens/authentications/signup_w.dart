import 'package:dashboard_flutter/constants.dart';
import 'package:dashboard_flutter/screens/authentications/login.dart';
import 'package:dashboard_flutter/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

import '../main/main_screen.dart';








class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    Key? key
  }):super(key: key);


  @override
  State<SignUpWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignUpWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();    //to validate the form
  final AuthService _auth = AuthService();
  String error = "";

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
print("I am in signup widget");

    return Theme(
        data:ThemeData.light(),
        child:SafeArea(
            child:Scaffold(


                body:SingleChildScrollView(
                  child:Container(
                    width: double.infinity, // occupy available horizontal space as parent allows
                    height: MediaQuery.of(context).size.height,  // widget will occupy the entire height of device screen.

                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          SizedBox(
                              child: Column(

                                children: [
                                  FadeInUp(duration:Duration(milliseconds: 1000),child:Text("Sign up",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),

                                  FadeInUp(duration:Duration(milliseconds: 1150),child:Text("Create an account, it's free")),
                                ],
                              )),






                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: <Widget>[
                                FadeInUp(duration:const Duration(milliseconds: 1200),child:makeInput(label:"Email",hintText: 'Enter your email',controller: _emailController,
                                validator:(val)=> _emailController.text.isEmpty ? "Enter your email address" : null)),
                                FadeInUp(duration:const Duration(milliseconds: 1300),child:makeInput(label:"Password",obscureText: true,hintText: 'Enter your password',controller: _passwordController,
                                validator:(val)=> _passwordController.text.length < 6? "Enter a password 6+ char long" : null)),
                                FadeInUp(duration:const Duration(milliseconds: 1300),child:makeInput(label:"Confirm Password",obscureText: true,hintText: 'Re enter your password',controller: _confirmPasswordController,
                                validator: (val)=>_confirmPasswordController.text != _passwordController.text ? "Password and confirm password should be matched" : null))

                              ],
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                              child:MaterialButton(
                                  onPressed: ()async{
                                    if(_formKey.currentState!.validate()){
                                        dynamic result = await _auth.registerWithEmailPassword(_emailController.text,_passwordController.text);
                                        if (result == null){
                                          setState(() {
                                            error = "Please supply a valid email";
                                          });


                                        }else{
                                          print("Signup successfully");
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainScreen()));

                                        }
                                    }
                                  },
                                  minWidth:double.infinity,

                                  height: 60,
                                  color: secondaryColor,

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text("Submit",style: TextStyle(color: Colors.white),))


                          ),
                          SizedBox(height: 12.0,),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red,fontSize: 16.0),
                          ),
                          Padding(
                              padding: EdgeInsets.all(30),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have an account?"),

                                  SizedBox(width: 5,),
                                  TextButton(
                                      onPressed: (){

                                        // Navigate to the login widget

                                       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginWidget()));
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginWidget()));

                                      },
                                      child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)  )


                                ],
                              )
                          )
                        ],
                      ),
                    ),
                  ) ,


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
