import 'dart:convert';
import 'dart:io';
import 'package:everyday/model/FileModel.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
//import 'package:storage_path/storage_path.dart';



class AddPhotoDialog extends StatefulWidget{
  Function clearDialog;
  AddPhotoDialog({this.clearDialog});
  @override
  State<StatefulWidget> createState() => _AddPhotoState();

}

class _AddPhotoState extends State<AddPhotoDialog>{
  List<File> _fileImages = [];
  Future getImage() async {
//    var imagesPath;
//    try {
//      imagesPath = await StoragePath.imagesPath;
//      var response = jsonDecode(imagesPath);
//      var imageList = response as List;
//      List<FileModel> folders = imageList.map<FileModel>((json) => FileModel.fromJson(json)).toList();
//      List<File> files = [];
//      folders.forEach((itemFolder) {
//        itemFolder.files.forEach((path) {
//          files.add(File(path));
//        });
//      });
//      setState(() {
//        _fileImages.clear();
//        _fileImages = files;
//      });//contains images path and folder name in json format
//    } on PlatformException {
//      print("error");
//    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission(PermissionGroup.storage);
  }

  Future<void> requestPermission(PermissionGroup permission) async {
    final List<PermissionGroup> permissions = <PermissionGroup>[permission];
    final Map<PermissionGroup, PermissionStatus> permissionRequestResult =
    await PermissionHandler().requestPermissions(permissions);

    print(permissionRequestResult);
    var _permissionStatus = permissionRequestResult[permission];
    print(_permissionStatus);
    if (_permissionStatus.value == PermissionStatus.granted.value) {
      getImage();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(0x80000000),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  color: Colors.white
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 45,
                        child: Align(
                            alignment: Alignment(0, 0),
                            child: Text("Add Photo", style: TextStyle( color: Color(0xFF666666), fontSize: 14),)
                        ),
                      ),
                      Align(
                        alignment: Alignment(1,0),
                        child: Padding(
                          padding: const EdgeInsets.all(11),
                          child: InkWell(
                            child: SizedBox(
                              child: Image.asset("assets/ic_clear.png"),
                            ),
                            onTap: () {
                              print("AsscloseDialog");
                              widget.clearDialog();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 0.5,
                    color: Color(0xFFF1F1F1),
                  ),
                  Container(
                    height: 230,
                    color: Colors.white,
                    child: GridView.count(
                        crossAxisCount: 3,
                      padding: EdgeInsets.all(16),
                      mainAxisSpacing: 11,
                      crossAxisSpacing: 11,
                      childAspectRatio: 1.5,
                      children: List.generate(_fileImages.length, (index) {
                        return Image.file(_fileImages[index], fit: BoxFit.cover,);
                      }),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


}
