import 'package:flutter/material.dart';

class NotFoundView extends StatefulWidget {
  const NotFoundView({Key? key}) : super(key: key);

  @override
  State<NotFoundView> createState() => _NotFoundViewState();
}

class _NotFoundViewState extends State<NotFoundView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 80,
          width: 80,
          color: Colors.amber,
          child: Text('Rota nao encontrada'),
        ),
      ),
    );
  }
}
