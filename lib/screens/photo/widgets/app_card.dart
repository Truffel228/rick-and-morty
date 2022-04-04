import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({Key? key, required this.title, required this.child})
      : super(key: key);
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(20),),
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text('$title:'),
          Expanded(child: Center(child: child)),
        ],
      ),
    );
  }
}
