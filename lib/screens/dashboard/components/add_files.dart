import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:image_picker/image_picker.dart';
class AddDocumentForm extends StatefulWidget {
  const AddDocumentForm({super.key});

  @override
  State<AddDocumentForm> createState() => _AddDocumentFormState();
}

class _AddDocumentFormState extends State<AddDocumentForm> {
final TextEditingController _fileNameController = TextEditingController();
final TextEditingController _sizeController = TextEditingController();
final TextEditingController _dateController = TextEditingController();
String? _imageFile;

Future _getImage() async{
  try{
    final pickedFile = await FilePicker.platform.pickFiles(
      type:FileType.custom,
      allowedExtensions: ['svg'], // Allow only SVG files
    );

     if(pickedFile == null || pickedFile.files.single.path == null) return;
    final imageTemp = pickedFile.files.single.path!;

    setState(() {
      _imageFile = imageTemp;
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
    File file = File(_imageFile!);
    String fileName = _fileNameController.text.trim();
    String fileSize = _sizeController.text.trim();
    String date = _dateController.text.trim();

    //upload file to  firebase storage

    // Reference storageReference =  FirebaseStorage,instanc






  }catch(e){


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
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: _sizeController,
              decoration: InputDecoration(labelText: 'File Size'),
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