import 'package:flutter/material.dart';

class TopWidget extends StatelessWidget {
  final String? assetName;
  final String text;
  const TopWidget({Key? key, this.assetName, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (assetName != null)
          SizedBox(
            width: 100,
            child: Image.asset(assetName!),
          ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
