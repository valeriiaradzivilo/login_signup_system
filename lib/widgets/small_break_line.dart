import 'package:flutter/material.dart';

class SmallBreakLine extends StatelessWidget {
  final int amount;
  const SmallBreakLine({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * amount / 100,
    );
  }
}
