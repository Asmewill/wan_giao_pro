import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final  GestureTapCallback? onTap;
  final double verticalSpacing;
  final double labelSize;
  final  String labelText;
  final Color labelColor;

 IconTextWidget(this.icon,this.labelText,this.labelSize, this.labelColor,{ this.iconColor=Colors.black12, this.onTap, this.verticalSpacing=0}) ;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Ink(
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(height: verticalSpacing,),
              Text(
                labelText,style: TextStyle(fontSize: labelSize,color: labelColor),
              )
            ],
          ),
          onTap:this.onTap ,
        ),
      ),
    );
  }
}
