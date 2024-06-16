import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

import 'package:image_picker/image_picker.dart';
class AddDocumentForm extends StatefulWidget {
  const AddDocumentForm({super.key});

  @override
  State<AddDocumentForm> createState() => _AddDocumentFormState();
}

class _AddDocumentFormState extends State<AddDocumentForm> {
final TextEditingController _fileNameController = TextEditingController();
String? _imageFile;
String? _imageSize;

Future _getImage() async{
  try{
    final pickedFile = await FilePicker.platform.pickFiles(
      type:FileType.custom,
      allowedExtensions: ['svg'], // Allow only SVG files
    );

     if(pickedFile == null || pickedFile.files.single.path == null) return;
    final imageTemp = pickedFile.files.single.path!;
    //Calculate the fileSize

    final file = File(imageTemp);
    final fileSizeInBytes = await file.length();
    final fileSizeInMB = fileSizeInBytes / (1024*1024);


    setState(() {
      _imageFile = imageTemp;
      _imageSize = fileSizeInMB.toStringAsFixed(1) + 'MB';
    });
  } on PlatformException catch(e){

    print('Failed to pick image: $e');

  }


}

Future<void> _uploadFile() async{
  if(_imageFile == null){
    print('No file selected');
    return;

  }
  try{

    //Upload file to Firebase Storage
    String fileName = _fileNameController.text.trim();
    File file = File(_imageFile!);

    //upload file to  firebase storage

     Reference  ref =  FirebaseStorage.instance.ref().child('uploads/$fileName.svg');
     final uploadTask = ref.putFile(file);


    // Wait for the upload to complete

    await uploadTask.whenComplete(()=>null);
    final fileUrl = await ref.getDownloadURL();

    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // save metaData to FireStore
    await FirebaseFirestore.instance.collection('files').add({
      'title':fileName,
      'icon':fileUrl,
      'size':_imageSize,
      'date':date,
    });

    print('File uploaded successfully');
    Navigator.pop(context);


  }catch(e){
  print('Failed to upload file: $e');
  }
}
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New File'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _fileNameController,
              decoration: InputDecoration(labelText: 'File Name'),
            ),

             if(_imageFile != null)
               SizedBox(
                 height: 100,
                 width: 100,
                 child: SvgPicture.file(
                   File(_imageFile!),
                   placeholderBuilder: (BuildContext context) =>const CircularProgressIndicator(),
                 ),
               ),
        
            ElevatedButton(
                onPressed: _getImage,
                child: const Text('Select Image')),
        
        
        
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
        child:const Text('Cancel'),
        ),
        TextButton(
            onPressed: (){
              _uploadFile();
            },
            child: const Text('Add'))
      ],
    );
  }
}

void showAddDialogBox(BuildContext context){
   showDialog(
       context: context,
       builder: (BuildContext context){
         return const AddDocumentForm();
       });

}