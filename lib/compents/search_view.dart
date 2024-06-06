import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  final GestureTapCallback? onTap;
  final ValueChanged<String>? submit;
  final ValueChanged<String>? changed;
  final bool enable;
  final TextEditingController? textEditingController;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final String? queryHint;

  SearchView(
      {this.submit,
      this.changed,
      this.onTap,
      this.enable = false,
      this.textEditingController,
      this.suffixIcon,
      this.onPressed,
      this.backgroundColor = Colors.black12,
      this.queryHint = ""});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController? _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = widget.textEditingController;
    _textEditingController?.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: TextField(
        onSubmitted: widget.submit,
        onChanged: widget.changed,
        enabled: widget.enable,
        controller: _textEditingController,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: _buildSuffixIcon(),
            fillColor: widget.backgroundColor,
            filled: true,
            contentPadding: EdgeInsets.all(0),
            hintText: widget.queryHint,
            hintStyle: TextStyle(fontSize: 15.sp, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none)),
      ),
      onTap: () {
        widget.onTap!();
      },
    );
  }

  Widget? _buildSuffixIcon() {
    if (_textEditingController == null ||
        _textEditingController!.text.length <= 0) {
      return null;
    } else {
      return IconButton(
          padding: EdgeInsets.all(0),
          icon: Icon(
            widget.suffixIcon,
            color: Colors.grey,
          ),
          onPressed: widget.onPressed);
    }
  }
}
