import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends GetView {
  final String content;
  final String? fontFamily;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  CustomText({
    required this.content,
    this.fontFamily,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      content,
      style: GoogleFonts.getFont(
        fontFamily ?? "Lato",
        fontSize: fontSize ?? 16,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
        wordSpacing: 2,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

// #################### Icon Widget ###############

class CustomIcon extends GetView {
  final IconData? icon;
  final Color? color;
  final double? iconWeight, size;

  CustomIcon({required this.icon, this.color, this.iconWeight, this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color ?? Colors.red,
      size: size ?? 10,
      weight: iconWeight ?? 0,
    );
  }
}

// ################## list Items ##########

class ItemBox extends GetView {
  final String itemTitle;
  final IconData icon;

  ItemBox({required this.itemTitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CustomIcon(
              icon: icon,
              color: Color(0XFF1B5E20),
              iconWeight: 20,
              size: 30,
            ),
            SizedBox(width: 10),
            CustomText(
              content: itemTitle,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// ################## list Items ##########

class CustomButton extends GetView {
  final String buttonText;
  final VoidCallback? action;
  final IconData? icon;
  final Color? backGroundColor, iconColor,color;

  CustomButton({
    required this.buttonText,
    this.action,
    this.icon,
    this.backGroundColor,
    this.iconColor,
    this.color
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Expanded(
          child: TextButton(
            
            style: TextButton.styleFrom(
              
              backgroundColor: backGroundColor ?? Color(0XFF33691E),
              // foregroundColor: Colors.red
            ),

            onPressed: action,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (icon != null
                    ? CustomIcon(
                        icon: icon,
                        color: iconColor??Colors.black,
                        size: 40,
                        iconWeight: 2,
                      )
                    : SizedBox()),
                CustomText(
                  content: buttonText,
                  color: color??Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//################ image Widget ########

class ImageWidget extends StatelessWidget {
  final String imagePath;
  final double? imgHeight;
  final double? imgWidth;
  const ImageWidget({required this.imagePath, this.imgHeight, this.imgWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imgHeight ?? Get.height,
      width: imgWidth ?? Get.width,
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}
