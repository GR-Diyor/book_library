import 'package:book_library/core/config/dimension.dart';
import 'package:book_library/core/config/string.dart';
import 'package:flutter/material.dart';
import '../../../core/config/color.dart';

class GetStartedWidget extends StatelessWidget {
  final VoidCallback callback;
  const GetStartedWidget({required this.callback,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(

                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(),
                      color: AppColor.background,
                    ),
                  ),
                  Container(
                    decoration:  BoxDecoration(
                        image: DecorationImage(
                            opacity: (0.3),
                            image: AssetImage(AppString.overlay),
                            fit: BoxFit.cover
                        )

                    ),
                  ),
                  Center(
                    child: Image.asset(AppString.books),
                  ),

                ],
              )),
          Expanded(
            flex: 2,
            child: Container(
              width: AppDimension.width(context),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.sp,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Text(
                          AppString.discover,
                          style:
                          TextStyle(
                              color: Colors.black,
                              fontSize: AppDimension.textSize(context).headlineMedium!.fontSize,
                              fontWeight: FontWeight.bold),
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Text(
                          AppString.newWorld,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: AppDimension.textSize(context).headlineMedium!.fontSize,
                              fontWeight: FontWeight.bold),
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Text(
                          AppString.diveinto,
                          style:  TextStyle(color: Colors.grey[600],fontSize: AppDimension.textSize(context).bodyMedium!.fontSize,),
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Text(
                          AppString.explorestudy,
                          style:
                          TextStyle(color: Colors.grey[600],fontSize: AppDimension.textSize(context).bodyMedium!.fontSize),
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Text(
                          AppString.getinto,
                          style:  TextStyle(color: Colors.grey[600],fontSize: AppDimension.textSize(context).bodyMedium!.fontSize),
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap:
                        callback,
                        child: Container(
                          alignment: Alignment.center,
                          width: AppDimension.width(context)*0.8,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          child:  Text(
                            AppString.explore,
                            style:  TextStyle(
                                fontSize: AppDimension.LargeText(context),
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

