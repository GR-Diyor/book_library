import 'package:book_library/feature/data/model/books.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/config/color.dart';
import '../../../../core/config/dimension.dart';
import '../../../../core/config/string.dart';
import 'adventure.dart';
import 'fantasy.dart';
import 'health.dart';
import 'horror.dart';

class HomeBody extends StatelessWidget {
  final Books thriller;
  final Books fantasy;
  final Books horror;
  final Books health;
  final TextEditingController t;
  final VoidCallback callback;
  const HomeBody(
      {required this.thriller,
      required this.fantasy,
      required this.horror,
      required this.health,
        required this.t,
      required this.callback,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration:  BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      AppString.background_2,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.h),
                      child: SizedBox(
                        height: 4.h,
                        child: TextField(
                          controller: t,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.all(10),
                              hintText: AppString.searchbook,
                              hintStyle: TextStyle(
                                  fontSize: AppDimension.textSize(context)
                                      .bodyMedium!
                                      .fontSize),
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(40))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minWidth: 30.w,
                      onPressed: callback,
                      splashColor: AppColor.light,
                      color: Colors.white,
                      child:  Text(
                        AppString.search,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                     SizedBox(
                      height: 2.h,
                    ),
                    Text(AppString.explorethebook,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold))),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                     AppString.findthelight,
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                        child: ListView(
                      children: [
                         SizedBox(
                          height: 1.h,
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppString.adventure,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Adventure(adventure: thriller),
                         Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                AppString.fantasy,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Fantasy(fantasy: fantasy),
                        SizedBox(
                          height: 1.h,
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppString.horror,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Horror(horror: horror),
                         Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppString.health,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Romance(romance: health),
                      ],
                    ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
