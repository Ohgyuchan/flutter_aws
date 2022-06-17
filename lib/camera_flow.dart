import 'package:flutter/material.dart';

class CameraFlow extends StatefulWidget {
  // 1
  final VoidCallback shouldLogOut;

  const CameraFlow({Key? key, required this.shouldLogOut}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CameraFlowState();
}

class _CameraFlowState extends State<CameraFlow> {
  // 2
  bool _shouldShowCamera = false;

  // 3
  List<MaterialPage> get _pages {
    return [
      // Show Gallery Page
      const MaterialPage(child: Placeholder()),

      // Show Camera Page
      if (_shouldShowCamera) const MaterialPage(child: Placeholder())
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

  // 5
  // ignore: unused_element
  void _toggleCameraOpen(bool isOpen) {
    setState(() {
      _shouldShowCamera = isOpen;
    });
  }
}
