import 'package:dashboard_flutter/controller/MenuAppController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class Header extends StatelessWidget {

  const Header({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Row(
   // Menu to show and hide
      children: [
        IconButton(
            onPressed: context.read<MenuAppController>().controlMenu,
            icon: Icon(Icons.menu)),
        Expanded(child: SearchField()),

      ],
    );
  }
}


class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        border:OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        )

      ),
    );
  }
}
