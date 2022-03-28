import 'dart:io';

import 'package:cruise_box/main.dart';
import 'package:cruise_box/widgets/firebase_api.dart';
import 'package:cruise_box/widgets/firebase_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  UploadTask? task;
  File? image;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path;
    setState(() => image = File(path!));
  }

  Future uploadFile() async {
    if (image == null) return;
    final fileName = basename(image!.path);
    final destination = 'file/$fileName';
    task = FirebaseApi.uploadFile(destination, image!);
    setState(() {});
    if (task == null) return;
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);
            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);

      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("failed to pick image: $e");
    }
  }

  Future<File> saveImagePermanently(String imagepath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagepath);
    final image = File('${directory.path}/$name');
    return File(imagepath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade300,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Spacer(),
            image != null ? Image.file(image!) : Icon(Icons.camera_alt),
            SizedBox(
              height: 24,
            ),
            Text(
              "Pick Image",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 48,
            ),
            buildButton(
              title: "Pick Gallery",
              icon: Icons.image_outlined,
              onClicked: () => pickImage(ImageSource.gallery),
            ),
            SizedBox(
              height: 24,
            ),
            buildButton(
              title: "Pick Gallery",
              icon: Icons.camera_alt_outlined,
              onClicked: () => pickImage(ImageSource.camera),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(56),
          primary: Colors.white,
          onPrimary: Colors.black,
          textStyle: TextStyle(fontSize: 20),
        ),
        child: Row(
          children: <Widget>[
            // Icon: (icon, size: 28),
            SizedBox(width: 16),
          ],
        ),
        onPressed: onClicked,
      );
}

class ImageWidget extends StatelessWidget {
  final File image;
  final ValueChanged<ImageSource> onClicked;

  const ImageWidget({required this.image, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    final color = Colors.blueAccent;
    return Center(
      child: Stack(
        children: <Widget>[
          buildImage(context),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    final imagePath = this.image.path;
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: 160,
          height: 160,
          child: InkWell(
            onTap: () async {
              final Source = await showImageSource(context);
              if (Source == null) return;
              onClicked(Source);
            },
          ),
        ),
      ),
    );
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('camera'),
                  onTap: () => Navigator.of(context).pop(ImageSource.camera),
                ),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text('Gallery'),
                  onTap: () => Navigator.of(context).pop(ImageSource.gallery),
                ),
              ],
            ));
  }

  buildEditIcon(MaterialAccentColor color) {
    Icon(Icons.access_alarm);
  }

// Widget buildEditIcon(Color color) => buildCircle()
}

class UploadEventScreen extends StatefulWidget {
  const UploadEventScreen({Key? key}) : super(key: key);

  @override
  _UploadEventScreenState createState() => _UploadEventScreenState();
}

class _UploadEventScreenState extends State<UploadEventScreen> {
  late Future<List<FirebaseFile>> futureFiles;

  UploadTask? task;
  File? file;

  @override
  void initState() {
    super.initState();
    futureFiles = FirebaseApi.ListAll('files!');
  }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : "No File Shared";
    return Scaffold(
      appBar: AppBar(
        title: Text("$MyApp.title"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<FirebaseFile>>(
        future: futureFiles,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text('Some error occurred'),
                );
              } else {
                final files = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildHeader(files.length),
                    SizedBox(
                      height: 12,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: files.length,
                            itemBuilder: (context, index) {
                              final file = files[index];
                              return buildFile(context, file);
                            }))
                  ],
                );
              }
          }
        },
      ),
    );
  }

  Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
        leading: Image.network(
          file.url,
          width: 52,
          height: 52,
          fit: BoxFit.cover,
        ),
        title: Text(
          file.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: Colors.blue,
          ),
        ),
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ImagePage(file: file),
        )),
      );

  buildHeader(int length) {
    Icon(Icons.list);
  }
}

class ImagePage extends StatelessWidget {
  final FirebaseFile file;
  const ImagePage({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(file.name),
        centerTitle: true,
      ),
      body: Image.network(
        file.url,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildHeader(int length) => ListTile(
        tileColor: Colors.blue,
        leading: Container(
          width: 52,
          height: 52,
          child: Icon(
            Icons.file_copy,
          ),
        ),
      );
}
