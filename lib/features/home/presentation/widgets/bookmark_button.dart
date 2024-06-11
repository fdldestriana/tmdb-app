import 'package:flutter/material.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Image.asset("assets/icon/unbookmarked.png"),
    );
  }
}
