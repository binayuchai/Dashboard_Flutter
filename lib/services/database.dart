import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService{
  final String? uid;
DatabaseService({ this.uid});
  //collection reference
  final CollectionReference fileCollection = FirebaseFirestore.instance.collection('files');

  //adding documents for user inside 'files' collection
  //  Future updateUserData(String icon,String fileName,String dateFile,String size) async{
  //         return await fileCollection.doc(uid).set({
  //           'icon':icon,
  //           'file':fileName,
  //           'date':dateFile,
  //           'size':size
  //         });
  //  }

  // adding document to the inside 'files' collection
// collection Future addFileData(String fileName,String size,String date,String fileURL) async{
//    return await fileCollection.add({
//      'file':fileName,
//      'size':size,
//      'date':date,
//      'icon':fileURL
//    })
//  }


   //get files stream
   Stream<QuerySnapshot> get files{
     return fileCollection.snapshots();
   }
}