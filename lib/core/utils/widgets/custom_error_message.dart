import 'package:flutter/material.dart';
import '../styles.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Oops there was an error. Please try again later ',
      style: Styles.textStyle20,
    );
  }
}
