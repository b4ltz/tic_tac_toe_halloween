import 'package:flutter/material.dart';

enum TicValue {
  x,
  hand,
}

class Panel extends StatefulWidget {
  final String assetName;
  final TicValue value;
  final VoidCallback onPressed;

  const Panel({
    Key? key,
    required this.assetName,
    required this.value,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<Panel> createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  String _assetName = '';

  @override
  void initState() {
    _assetName = widget.assetName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_assetName.isEmpty) {
      return MaterialButton(
          onPressed: () {
            var img = (widget.value == TicValue.x) ? 'x.png' : 'h.png';
            setState(() {
              _assetName = 'assets/' + img;
            });
            widget.onPressed();
          },
          child: Container());
    }

    return Image.asset(
      _assetName,
      errorBuilder: (context, obj, stacktrace) {
        return Container(color: Colors.grey);
      },
    );
  }
}
