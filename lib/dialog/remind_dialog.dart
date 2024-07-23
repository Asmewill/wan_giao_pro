import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemindDialog extends StatefulWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;

  RemindDialog(this.title, this.content, this.onConfirm);

  @override
  State<RemindDialog> createState() => _RemindDialogState();
}

class _RemindDialogState extends State<RemindDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _animationController.reverse();
        Navigator.of(context).pop();
        return false;
      },
      child: ScaleTransition(
        scale: CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOut,
        ),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          child: Container(
            height: 150.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(widget.content),
                SizedBox(height: 20),
                Container(
                  width: 100.w,
                  child: ElevatedButton(
                    onPressed: widget.onConfirm,
                    child: Text('确认'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
