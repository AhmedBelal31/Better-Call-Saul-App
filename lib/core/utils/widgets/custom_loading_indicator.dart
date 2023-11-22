import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(
      'assets/images/funnyLoading.json',
    ));
    //return const Center(child: CircularProgressIndicator(color: MyColors.myYellow,));
  }
}
