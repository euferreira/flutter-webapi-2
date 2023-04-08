import 'package:bytebank/components/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/name.dart';

class NameContainer extends BlocContainer {

  @override
  Widget build(BuildContext context) {
    return NameView();
  }
}

class NameView extends StatelessWidget {
  NameView({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    this._controller.text = context.read<NameCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Name'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: this._controller,
              decoration: InputDecoration(
                labelText: 'Name',          
              ),
              style: TextStyle(
                fontSize: 24,
              ),        
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text('Change'),
                  onPressed: () {
                    final name = this._controller.text;
                    context.read<NameCubit>().changeName(name);
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}