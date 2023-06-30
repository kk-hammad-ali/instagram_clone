import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/commons/common_function.dart';
import 'package:instagram_clone/commons/dimension.dart';
import 'package:instagram_clone/model/user_model.dart';
import 'package:instagram_clone/provider/user_provider.dart';
import 'package:instagram_clone/screen/post/componet/upper_bar.dart';
import 'package:provider/provider.dart';

class BodyAddPostScreen extends StatefulWidget {
  const BodyAddPostScreen({super.key});

  @override
  State<BodyAddPostScreen> createState() => _BodyAddPostScreenState();
}

class _BodyAddPostScreenState extends State<BodyAddPostScreen> {
  Uint8List? _selectedFile;
  final TextEditingController _descriptionConroller = TextEditingController();

  @override
  void dispose() {
    _descriptionConroller.dispose();
    super.dispose();
  }

  void _selectImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Create a post'),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Take a Photo'),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await CommonFunction.pickImage(
                  ImageSource.camera,
                  context,
                );
                setState(() {
                  _selectedFile = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Select an image'),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await CommonFunction.pickImage(
                  ImageSource.gallery,
                  context,
                );
                setState(() {
                  _selectedFile = file;
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final UserModel? user = Provider.of<UserProvider>(context).getUser;
    return _selectedFile == null
        ? Center(
            child: IconButton(
              onPressed: () => _selectImage(context),
              icon: const Icon(Icons.upload),
            ),
          )
        : SafeArea(
            child: Column(
              children: [
                const UpperBar(),
                SizedBox(
                  height: dimensions.getScreenHeight * 0.03,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user!.userPhotoURL),
                    ),
                    SizedBox(
                      width: dimensions.getScreenWidth * 0.5,
                      child: TextField(
                        controller: _descriptionConroller,
                        decoration: const InputDecoration(
                          hintText: 'Write a caption',
                          border: InputBorder.none,
                        ),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: MemoryImage(_selectedFile!),
                              fit: BoxFit.fill,
                              alignment: FractionalOffset.topCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
