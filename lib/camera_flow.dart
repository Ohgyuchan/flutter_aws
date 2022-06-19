import 'package:flutter/material.dart';

import 'gallery_page.dart';

class CameraFlow extends StatefulWidget {
  // 1
  final VoidCallback shouldLogOut;

  const CameraFlow({Key? key, required this.shouldLogOut}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CameraFlowState();
}

class _CameraFlowState extends State<CameraFlow> {
  // 2

  @override
  void initState() {
    super.initState();
    // _getCamera();
  }

  // 3
  List<MaterialPage> get _pages {
    return [
      // Show Gallery Page
      const MaterialPage(child: Placeholder()),

      MaterialPage(
        child: GalleryPage(
          shouldLogOut: widget.shouldLogOut,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // 4
    return Navigator(
      pages: _pages,
      onPopPage: (route, result) => route.didPop(result),
    );
  }
}
