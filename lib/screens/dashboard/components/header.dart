import 'package:dashboard_flutter/controller/MenuAppController.dart';
import 'package:dashboard_flutter/screens/authentications/login.dart';
import 'package:dashboard_flutter/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class Header extends StatelessWidget {

     Header({
    Key? key,
  }) : super(key: key);

  final AuthService _auth = AuthService();

     @override
  Widget build(BuildContext context) {




    return Row(
      mainAxisAlignment: MainAxisAlignment.start,

   // Menu to show and hide
      children: [
        IconButton(

            onPressed: Provider.of<MenuAppController>(context).controlMenu,
            icon: Icon(
                Icons.menu,

            )),
         Expanded(child: SearchField()),
        ElevatedButton.icon(
            onPressed: ()async{
              await _auth.signOut();
              print("Signed out user");
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginWidget()));



            },
           icon: Icon(Icons.person),
            label: Text("Logout")
        )


      ],
    );
  }
}


class SearchField extends StatelessWidget {
  const SearchField(

      {
        Key? key
      }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        border:OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        )

      ),
    );
  }
}
