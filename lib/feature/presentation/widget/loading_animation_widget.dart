import 'package:flutter/material.dart';

import '../../../core/config/color.dart';
import '../../../core/config/dimension.dart';

class LoadingAnimationWidget extends StatelessWidget {
  const LoadingAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 1.h),
        itemCount: 5,
        itemBuilder: (context,int index) {
          return Padding(
            padding:  EdgeInsets.only(bottom: 1.h),
            child: Container(
              width: AppDimension.width(context),
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColor.dark.withOpacity(0.38),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 120,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.light,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(width: AppDimension.width(context)/2,height: 8,color: AppColor.light,),
                              SizedBox(height: 2.h),
                              Container(width: AppDimension.width(context)/2,height: 8,color: AppColor.light,),
                              SizedBox(height: 2.h),
                              Container(width: AppDimension.width(context)/2,height: 8,color: AppColor.light,),
                              SizedBox(height: 2.h),
                              Container(width: AppDimension.width(context)/2,height: 8,color: AppColor.light,),
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}