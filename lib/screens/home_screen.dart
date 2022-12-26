// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:interview_task/constants/app_colors.dart';
import 'package:interview_task/models/product_model.dart';
import 'package:interview_task/widgets/custom_products_card.dart';
import 'package:interview_task/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBgColor,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chat_bubble_rounded,
                color: Colors.white,
              ))
        ],
        title: ElevatedButton.icon(
          onPressed: () {
            debugPrint("");
          },
          icon: const Icon(Icons.call),
          label: const Text("Call at Store"),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r)),
              backgroundColor: AppColors.callbuttonbgColor,
              foregroundColor: AppColors.scaffoldBgColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _headingWidget(),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: ListView.separated(
              itemCount: productsList.length,
              itemBuilder: (c, i) {
                ProductModel model = productsList[i];
                return CustomProductCard(
                  imageUrl: model.productUrl.toString(),
                  productName: model.productname,
                  productPastPrice: model.pastPrice,
                  productPastPresentPrice: model.pastPrice,
                  productPastFloatingprice: model.floatingPrice,
                  incrementFunction: () =>
                      _showBottomSheetFunction(context, model),
                  decrementFuncton: () => _decrementFunction(),
                  onTap: () => _showBottomSheetFunction(context, model),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.h,
                );
              },
            )),
          ],
        ),
      ),
    ));
  }

  Widget _headingWidget() {
    var util = ScreenUtil();
    return Container(
      width: util.screenWidth,
      height: util.screenHeight * .05,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.scaffoldBgColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: CustomText(textValue: "Product", textSize: 12.sp)),
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(textValue: "Quality", textSize: 12.sp))),
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(textValue: "Remove", textSize: 12.sp))),
        ],
      ),
    );
  }

  Widget _listWidget() {
    var util = ScreenUtil();
    var src =
        "https://w7.pngwing.com/pngs/723/938/png-transparent-t-shirt-denim-jeans-sleeve-women-s-jeans-blue-women-accessories-indian-nude-women.png";
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.r,
          ),
          color: Colors.grey.shade100),
      child: Row(
        children: [
          Image.network(
            src,
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
                  textValue: "Item name",
                  textSize: 14.sp,
                  color: AppColors.scaffoldBgColor,
                ),
                CustomText(
                  textValue: "\$500",
                  textSize: 12.sp,
                  color: Colors.red,
                ),
                CustomText(
                  textValue: "\$700",
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
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                ),
                CustomText(
                  textValue: "50",
                  textSize: 14.sp,
                  color: AppColors.scaffoldBgColor,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.remove,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}

_showBottomSheetFunction(BuildContext context, ProductModel model) {
  var util = ScreenUtil();
  return showModalBottomSheet(
      // backgroundColor: AppColors.scaffoldBgColor,
      context: context,
      enableDrag: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r))),
      builder: (c) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: util.screenHeight * .01,
              ),
              Center(
                child: Container(
                  height: util.screenHeight * .008,
                  width: util.screenWidth * .3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                    color: Colors.black),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      textValue: model.productname,
                      textSize: 14.sp,
                    ),
                    CustomText(
                      textValue: model.floatingPrice + " items",
                      textSize: 14.sp,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: util.screenHeight * .01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.scaffoldBgColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(textValue: "subTotal", textSize: 12.sp),
                        CustomText(textValue: "\$" + "1000", textSize: 12.sp),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(textValue: "Cupon", textSize: 12.sp),
                        CustomText(
                          textValue: "Apply cupon",
                          textSize: 12.sp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            textValue: "Delivery Charges", textSize: 12.sp),
                        CustomText(
                          textValue: "50",
                          textSize: 12.sp,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(textValue: "To Pay", textSize: 12.sp),
                        CustomText(
                          textValue: "900",
                          textSize: 12.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Add Delivery Address"),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(util.screenWidth, 40.h),
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                      shape: StadiumBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Order on table"),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(util.screenWidth, 40.h),
                      backgroundColor: Colors.indigo.shade900,
                      foregroundColor: Colors.white,
                      shape: StadiumBorder(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        );
      });
}

_decrementFunction() {
  Fluttertoast.showToast(msg: "working");
}

_incrementFunction() {}
