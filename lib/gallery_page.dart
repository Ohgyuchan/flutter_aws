import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// 1
class GalleryPage extends StatelessWidget {
  // 2
  final VoidCallback shouldLogOut;

  const GalleryPage({Key? key, required this.shouldLogOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        actions: [
          // 4
          // Log Out Button
          Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
                onTap: shouldLogOut, child: const Icon(Icons.logout)),
          )
        ],
      ),
      // 5
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await getImage();
          },
          child: const Icon(Icons.camera_alt)),
      body: Container(child: _galleryGrid()),
    );
  }

  Future<XFile?> getImage() async {
    final _pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    return _pickedImage;
  }

  Widget _galleryGrid() {
    // 6
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 3,
        itemBuilder: (context, index) {
          // 7
          return const Placeholder();
        });
  }
}
