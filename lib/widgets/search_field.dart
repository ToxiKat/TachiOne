import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? cancelOnTap;
  final String? hintText;
  const SearchField(
      {required this.controller,
      this.onChanged,
      this.cancelOnTap,
      this.hintText,
      super.key});
  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SearchBar(
        constraints: const BoxConstraints(
            minWidth: 360.0, maxWidth: double.infinity, minHeight: 40.0),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
        controller: widget.controller,
        leading: const Icon(Icons.search),
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        hintText: widget.hintText,
        trailing: <Widget>[
          IconButton(
            onPressed: () {
              widget.controller.clear();
              if (widget.cancelOnTap != null) {
                widget.cancelOnTap;
              }
            },
            icon: const Icon(Icons.clear),
          )
        ],
      ),
    );
  }
}
