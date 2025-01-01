
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../constant/constant.dart';

class CommonButton extends StatelessWidget {
  final Callback onTap;
  final String buttonText;
  const CommonButton(
      {super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.sp),
        child: Container(
          width: double.infinity,
          height: 58.sp,
          color: MyColors.secondaryColor,
          child: Padding(
            padding: EdgeInsets.only(left: 28.sp),
            child: Row(
              children: [
                Text(
                  buttonText,
                  style: Theme.of(context).grayCliff700.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: MyColors.white,
                      letterSpacing: 1.2),
                ),
                const Spacer(),
                Container(
                  height: 58.sp,
                  color: MyColors.secondaryColor,
                  child: Center(
                    child: Image.asset(
                      ImageConstants.iconRightArrow,
                      height: 20.sp,
                      color: MyColors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 36.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
