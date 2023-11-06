import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import 'fade_in_out.dart';

class LoadingAnimation extends StatelessWidget {
  final Color color;

  const LoadingAnimation({Key? key, this.color = AppColors.green})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: FadeInOut(
          visible: true,
          child: Center(
            child: CircularProgressIndicator(
              color: color,
            ),
          )),
    );
  }
}
