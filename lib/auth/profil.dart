import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';


class Profile extends StatelessWidget {
  final double size;
  final String imageURL1;
  const Profile({Key? key, required this.size,required this.imageURL1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:BorderRadius.circular(size/2-size/10),
      child:Image.network( imageURL1,
        width: size,
        height: size,
        fit: BoxFit.cover,),
    );
  }
}