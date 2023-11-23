import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.onTap,
      this.borderRadius,
      this.buttonColor,
      required this.buttonText,
      this.textColor,
      super.key});
  VoidCallback onTap;
  Color? buttonColor;
  double? borderRadius;
  Color? textColor;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: 374,
        // color: const Color.fromRGBO(35, 64, 143, 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
          color: buttonColor ?? const Color.fromRGBO(35, 64, 143, 1),
        ),
        child: Center(
          child: Text(buttonText,
              style: TextStyle(
                  color: textColor ?? const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Gilroy')),
        ),
      ),
    );
  }
}
/*
 FDottedLine(
                          corner: FDottedLineCorner.all(15.h),
                          color: Colors.blue,
                          height: 200.0.h,
                          width: 100.w,
                          strokeWidth: 1.5.w,
                          dottedLength: 7.0,
                          space: 5.0,
                          child: SizedBox(
                            height: 40.h,
                            width: 140.w,
                            child: Center(
                              child: Text(
                                "Dashboard",
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
 */
