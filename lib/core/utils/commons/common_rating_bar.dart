import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../module/chat/chat.dart';

class CommonRatingBar extends StatelessWidget {
  final double? iconSize;
  final double itemGap;
  final double? initialRating;
  final bool? ignoreGestures;
  final void Function(double) onRatingUpdate;
  const CommonRatingBar({
    super.key,
    this.iconSize,
    required this.onRatingUpdate,
    required this.itemGap,
    this.initialRating,
    this.ignoreGestures,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating ?? 0,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ignoreGestures: ignoreGestures ?? false,
      glow: false,
      itemSize: iconSize ?? 14,
      itemPadding: EdgeInsets.symmetric(horizontal: itemGap),
      onRatingUpdate: onRatingUpdate,
      itemBuilder: (BuildContext context, int index) {
        return Icon(
          Icons.star,
          color: MyColors.appTxtColor,
        );
      },
    );
  }
}
