import 'package:flutter/material.dart';
import 'package:signup_page/colors.dart';
import 'package:signup_page/custom_button.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // DatePickerController _controller = DatePickerController();
  // DateTime _selectedValue = DateTime.now();
  int sliderval = 0;

  bool isselected = false; 

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // var now = DateTime.now();
    // DateTime startDate = now.subtract(Duration(days: 14));
    // DateTime endDate = now.add(Duration(days: 7));
    // print('startDate = $startDate ; endDate = $endDate');

    return Scaffold(
      backgroundColor: ColorsClass.whiteC,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            color: ColorsClass.blackC,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: ColorsClass.whiteC,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: ColorsClass.greyC.withOpacity(0.1),
                )
              ],
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: ColorsClass.redC,
                size: 15.sp,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: ColorsClass.whiteC,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: ColorsClass.greyC.withOpacity(0.1),
                  )
                ],
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.mail_rounded,
                    color: ColorsClass.redC,
                    size: 19.sp,
                  )),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                        top: 5,
                      ),
                      child: Text(
                        "Apr 08,2022",
                        style: TextStyle(
                          color: ColorsClass.greyC,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                        top: 5,
                      ),
                      child: Text(
                        "Today",
                        style: TextStyle(
                          color: ColorsClass.blackC,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.sp, right: 5),
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.25,
                    decoration: BoxDecoration(
                      color: ColorsClass.redC,
                      borderRadius: BorderRadius.circular(16.sp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: ColorsClass.whiteC,
                          size: 13.sp,
                        ),
                        Text(
                          "Add",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorsClass.whiteC,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            isselected == isselected ;
                          });
                        }, child: isselected  ? selectedContainer(height, width) : UnselectedContainer(height, width));
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Schedule Today",
                  style: TextStyle(
                    color: ColorsClass.blackC,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "09:00",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: ColorsClass.greyC,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 5),
                  child: SizedBox(
                    width: width * 0.82,
                    child: Slider(
                        inactiveColor: ColorsClass.redC,
                        activeColor: ColorsClass.redC,
                        thumbColor: ColorsClass.redC,
                        min: 0,
                        max: 100,
                        value: sliderval.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            sliderval = value.round();
                          });
                        }),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "10:00",
                style: TextStyle(
                  color: ColorsClass.greyC,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.w),
              child: Container(
                height: height * 0.11,
                width: width * 0.75,
                decoration: BoxDecoration(
                    color: ColorsClass.redlightC,
                    borderRadius: BorderRadius.circular(16.sp)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cardiologist",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsClass.blackC,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              letterSpacing: 0.3,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.sp, right: 10.sp),
                            child: CircleAvatar(
                              radius: 10.sp,
                              backgroundImage:
                                  AssetImage("images/profilepic.jpg"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 8),
                      child: Text(
                        "Sami Javed",
                        style: TextStyle(
                          color: ColorsClass.blackC,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "11:00",
                style: TextStyle(
                  color: ColorsClass.greyC,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Reminder",
                style: TextStyle(
                  color: ColorsClass.blackC,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Dont forget schedule for upcoming appointment",
                style: TextStyle(
                  color: ColorsClass.greyC,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                width: width * 2,
                decoration: BoxDecoration(
                  color: ColorsClass.whiteC,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: ColorsClass.greyC.withOpacity(0.1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(16.sp),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 3.w),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.sp),
                            child: Image.asset(
                              "images/profilepic.jpg",
                              height: height * 0.12,
                              width: width * 0.22,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Text(
                            "Dr. Maria Sultan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsClass.blackC,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w, top: 0.5.h),
                          child: Text(
                            "Pediatrician",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsClass.blackC,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 5.w, top: 2.h, right: 15.w),
                          child: Row(
                            children: [
                              Container(
                                height: height * 0.047,
                                width: width * 0.076,
                                decoration: BoxDecoration(
                                  color: ColorsClass.orangeC.withOpacity(0.1),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      color: ColorsClass.greyC.withOpacity(0.1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(5.sp),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.star_rate_rounded,
                                    color: ColorsClass.orangeC,
                                    size: 25.sp,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.w),
                                    child: Text(
                                      "Rating",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorsClass.blackC,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 2.w, top: 0.5.h),
                                    child: Text(
                                      "4.78 out of 5",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorsClass.blackC,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.h,
                          ),
                          child: Center(
                            child: Container(
                              height: height * 0.07,
                              width: width * 0.85,
                              decoration: BoxDecoration(
                                color: ColorsClass.lightblue2C,
                                borderRadius: BorderRadius.circular(16.sp),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("images/timing_table.png"),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.w),
                                    child: Text(
                                      "Monday, Dec 23",
                                      style: TextStyle(
                                        color: ColorsClass.blackC,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.1,
                                  ),
                                  Icon(
                                    Icons.watch_later_rounded,
                                    color: ColorsClass.redC,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.w),
                                    child: Text(
                                      "12:00-13:00",
                                      style: TextStyle(
                                        color: ColorsClass.blackC,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.sp, bottom: 1.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: SizedBox(
                                  height: height * 0.065,
                                  width: width * 0.4,
                                  child: CustomButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.sp),
                                      ),
                                      borderclr:
                                          BorderSide(color: ColorsClass.redC),
                                      backgroundColor: ColorsClass.redC,
                                      title: Text(
                                        "Reshedule",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorsClass.whiteC,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      onPress: () {}),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              Center(
                                child: SizedBox(
                                  height: height * 0.065,
                                  width: width * 0.4,
                                  child: CustomButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.sp),
                                      ),
                                      borderclr:
                                          BorderSide(color: ColorsClass.redC),
                                      backgroundColor: ColorsClass.whiteC,
                                      title: Text(
                                        "Cancel",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorsClass.redC,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      onPress: () {}),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding selectedContainer(double height, double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.4,
        width: width * 0.15,
        decoration: BoxDecoration(
          color: ColorsClass.lightblueC,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Column(
          children: [
            Text(
              "15",
              style: TextStyle(
                color: ColorsClass.redC,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
            Text(
              "Thu",
              style: TextStyle(
                color: ColorsClass.redC,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding UnselectedContainer(double height, double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "15",
            style: TextStyle(
              color: ColorsClass.blackC,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
          Text(
            "Thu",
            style: TextStyle(
              color: ColorsClass.blackC,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
