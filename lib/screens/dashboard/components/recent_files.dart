import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard_flutter/constants.dart';
import 'package:dashboard_flutter/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dashboard_flutter/models/RecentFiles.dart';


class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,

  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(defaultPadding),

      decoration: BoxDecoration(
        color:secondaryColor,
         borderRadius: const BorderRadius.all(Radius.circular(10))
      ),

      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Recent Files",
              style:Theme.of(context).textTheme.titleMedium,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: DatabaseService().files,
            builder: (context,snapshot){

              if(snapshot.connectionState == ConnectionState.waiting){
                return const CircularProgressIndicator();
              }
              else if(snapshot.hasError){
                return Text('Error: ${snapshot.error}');
              }
              else{
                final files = snapshot.data!.docs;
                return Container(
                    width: double.infinity,
                    child: DataTable(
                        columnSpacing: defaultPadding,
                        columns: [
                          DataColumn(label: Text("FileName")),
                          DataColumn(label: Text("Date")),
                          DataColumn(label: Text("Size")),

                        ],
                        rows:List.generate(
                            files.length,
                                (index){

                              final data = files[index].data() as Map<String,dynamic>;

                              return recentFileDataRow(data);
                            })
                    )
                );


              }



            },

          ),
      ]

      ));
  }
}


DataRow recentFileDataRow(Map<String,dynamic> data){
  return DataRow(
      cells: [
        DataCell(
            Row(
              children: [
                Flexible(child:SvgPicture.asset(
                  data['icon'],
                  height: 30,
                  width: 30,


                ),),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                       child:Text(data['file'] ?? ''),
                )

              ],
            )),
        DataCell(Text(data['date']!)),
        DataCell(Text(data['size']!))
      ]);
}
