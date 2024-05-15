import 'package:dashboard_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    Key? key
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data:ThemeData.light(),
        child:SafeArea(
            child:Scaffold(

              appBar: AppBar(
                title: const Text("Sign up",style: TextStyle(color: Colors.white),),
                backgroundColor: bgColor,

              ),
              body:SingleChildScrollView(
                child:Container(
                  width: double.infinity, // occupy available horizontal space as parent allows
                  height: MediaQuery.of(context).size.height,  // widget will occupy the entire height of device screen.

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
                            FadeInUp(duration:const Duration(milliseconds: 1200),child:makeInput(label:"Email",hintText: 'Enter your email',)),
                            FadeInUp(duration:const Duration(milliseconds: 1300),child:makeInput(label:"Password",obscureText: true,hintText: 'Enter your password')),
                            FadeInUp(duration:const Duration(milliseconds: 1300),child:makeInput(label:"Confirm Password",obscureText: true,hintText: 'Re enter your password'))

                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                          child:MaterialButton(
                              onPressed: (){},
                              minWidth:double.infinity,

                              height: 60,
                              color: secondaryColor,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text("Submit",style: TextStyle(color: Colors.white),))


                      ),
                      Padding(
                          padding: EdgeInsets.all(30),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?"),
                              SizedBox(width: 5,),
                              Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)

                            ],
                          )
                      )
                    ],
                  ),
                ) ,


              )

            )
        )

    );

  }
}

Widget makeInput({label,obscureText=false,hintText}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(label,style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,

      ),),
      SizedBox(height: 5,),
      TextField(

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
