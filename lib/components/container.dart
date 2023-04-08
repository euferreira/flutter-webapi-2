import 'package:flutter/material.dart';

abstract class BlocContainer extends StatelessWidget {  
}

void push(BuildContext blocContext, BlocContainer widget) {
  Navigator.of(blocContext).push(
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}