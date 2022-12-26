// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import 'custom_text.dart';

class CustomProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productPastPrice;
  final String productPastPresentPrice;
  final String productPastFloatingprice;
  final VoidCallback onTap;
  final VoidCallback incrementFunction;
  final VoidCallback decrementFuncton;
  const CustomProductCard({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.productPastPrice,
    required this.productPastPresentPrice,
    required this.productPastFloatingprice,
    required this.onTap,
    required this.incrementFunction,
    required this.decrementFuncton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var util = ScreenUtil();
    var src =
        "https://w7.pngwing.com/pngs/723/938/png-transparent-t-shirt-denim-jeans-sleeve-women-s-jeans-blue-women-accessories-indian-nude-women.png";
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12.r,
            ),
            color: Colors.grey.shade300),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              height: util.screenHeight * .05,
              width: util.screenWidth * .1,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textValue: productName,
                    textSize: 14.sp,
                    color: AppColors.scaffoldBgColor,
                  ),
                  CustomText(
                    textValue: "\$ ${productPastPrice}",
                    textSize: 12.sp,
                    color: Colors.red,
                  ),
                  CustomText(
                    textValue: "\$ $productPastPresentPrice",
                    textSize: 14.sp,
                    color: AppColors.scaffoldBgColor,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Bounce(
                    duration: const Duration(milliseconds: 300),
                    onPressed: () => incrementFunction,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  CustomText(
                    textValue: productPastFloatingprice,
                    textSize: 14.sp,
                    color: AppColors.scaffoldBgColor,
                  ),
                  Bounce(
                    duration: const Duration(milliseconds: 300),
                    onPressed: () => decrementFuncton,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.remove,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }
}
