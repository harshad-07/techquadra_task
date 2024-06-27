import 'package:flutter/material.dart';

import 'curved_edges.dart';

class CurvedEdgesWidget extends StatelessWidget {
  final Widget child;

  const CurvedEdgesWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}
