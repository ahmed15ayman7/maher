import 'package:flutter/material.dart';
import '../models/HelloCard-models.dart';

class HelloCard extends StatelessWidget {
  final Hellocard HellocardInterface;
  final VoidCallback onTap;

  const HelloCard({
    Key? key,
    required this.HellocardInterface,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(HellocardInterface.imageUrl),
        ),
        title: Text(HellocardInterface.model),
        subtitle: Text(HellocardInterface.year),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
