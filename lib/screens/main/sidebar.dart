import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class SideMenu extends StatefulWidget {
//   const SideMenu({super.key});
//
//   @override
//   State<SideMenu> createState() => _SideMenuState();
// }
//
// class _SideMenuState extends State<SideMenu> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       // Add a ListView to the drawer. This ensures the user can scroll
//       // through the options in the drawer if there isn't enough vertical
//       // space to fit everything.
//       child: ListView(
//         // Important: Remove any padding from the ListView.
//         // Important: Remove any padding from the ListView.
//         padding: EdgeInsets.zero,
//         children: [
//           const DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: Text('Drawer Header'),
//           ),
//           ListTile(
//             title: const Text('Item 1'),
//             onTap: () {
//               // Update the state of the app.
//               // ...
//               // Navigator.pop(context);
//
//             },
//           ),
//           ListTile(
//             title: const Text('Item 2'),
//             onTap: () {
//               // Update the state of the app.
//               // ...
//               // Navigator.pop(context);
//
//             },
//           ),
//           ListTile(
//             title: const Text('Item 3'),
//             onTap: () {
//               // Update the state of the app.
//               // ...
//               // Navigator.pop(context);
//
//             },
//           ),
//
//         ],
//       ),
//     );
//   }
// }


class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double drawerWidth = MediaQuery.of(context).size.width * 0.6;
    return SizedBox(
      width:drawerWidth,
      child: Drawer(

        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(

              child: Image.asset('assets/icons/logo.png'),
            ),
            ListTile(
              leading: SvgPicture.asset('assets/icons/menu_dashboard.svg',
              colorFilter: ColorFilter.mode(Colors.white54,BlendMode.srcIn),
              height: 16,),
              title: const Text('Dashboard'),
              onTap: () {
                // Update the state of the app.
                // ...

              },
              

            ),
            ListTile(
              leading: SvgPicture.asset('assets/icons/menu_doc.svg',
                colorFilter: ColorFilter.mode(Colors.white54,BlendMode.srcIn),
                height: 16,),
              title: const Text('Docs'),
              onTap: () {
                // Update the state of the app.
                // ...

              },


            ),
            ListTile(
              leading: SvgPicture.asset('assets/icons/menu_task.svg',
                colorFilter: ColorFilter.mode(Colors.white54,BlendMode.srcIn),
                height: 16,),
              title: const Text('Task'),
              onTap: () {
                // Update the state of the app.
                // ...

              },


            ),
            ListTile(
              leading: SvgPicture.asset('assets/icons/menu_notification.svg',
                colorFilter: ColorFilter.mode(Colors.white54,BlendMode.srcIn),
                height: 16,),
              title: const Text('Notification'),
              onTap: () {
                // Update the state of the app.
                // ...

              },


            ),


          ],
        ),
      ),
    );
  }
}
