import 'package:flutter/material.dart';

class ImageTile extends StatefulWidget {
  final double? width;
  final double? height;
  final String? coverImage;
  final void Function()? onTap;
  final String title;
  const ImageTile(
      {this.coverImage,
      required this.title,
      this.width,
      this.height,
      this.onTap,
      super.key});

  @override
  State<ImageTile> createState() => _ImageTileState();
}

class _ImageTileState extends State<ImageTile> {
  double width = 100, height = 150;
  @override
  void initState() {
    super.initState();
    if (widget.width != null) {
      width = widget.width!;
    }
    if (widget.height != null) {
      height = widget.height!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0x7D303030),
              image: _coverImage(),
            ),
            width: width,
            height: height,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width),
            child: Text(
              widget.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  DecorationImage _coverImage() {
    try {
      if (widget.coverImage != null) {
        return DecorationImage(
          image: NetworkImage(widget.coverImage!),
          fit: BoxFit.cover,
        );
      } else {
        return const DecorationImage(
          image: AssetImage("assets/placeholder.png"),
          fit: BoxFit.contain,
        );
      }
    } catch (e) {
      print(e);
      return const DecorationImage(
        image: AssetImage("assets/placeholder.png"),
        fit: BoxFit.contain,
      );
    }
  }
}
