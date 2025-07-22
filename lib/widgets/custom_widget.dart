import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      
      // overflow: TextOverflow.fade,
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
  final Color? backGroundColor, iconColor, color;

  CustomButton({
    required this.buttonText,
    this.action,
    this.icon,
    this.backGroundColor,
    this.iconColor,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
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
                      color: iconColor ?? Colors.black,
                      size: 40,
                      iconWeight: 2,
                    )
                  : SizedBox()),
              CustomText(
                content: buttonText,
                color: color ?? Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
       
    );
  }
}

//################ Fa Icon##############

class CustomFaButton extends GetView {
  final String buttonText;
  final VoidCallback? action;
  final Widget? icon;
  final Color? backGroundColor, iconColor, color;

  CustomFaButton({
    required this.buttonText,
    this.action,
    this.icon,
    this.backGroundColor,
    this.iconColor,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
          style: TextButton.styleFrom(
            side: BorderSide(
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            backgroundColor: backGroundColor ?? Color(0XFF33691E),
            elevation: 2,
            
            // foregroundColor: Colors.red
          ),

          onPressed: action,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (icon != null
                  ? SvgPicture.asset('images/google.svg', width: 30,)
                  // CustomIcon(
                  //     icon: icon,
                  //     color: iconColor ?? Colors.black,
                  //     size: 40,
                  //     iconWeight: 2,
                  //   )
                  : SizedBox()),
                  SizedBox(width: 10,),
              CustomText(
                content: buttonText,
                color: color ?? Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
       
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


// ############# styled bg image############

class RoundedBgImage extends GetView {
  final Widget bgImage;
  final Widget widgetActions;
  const RoundedBgImage({required this.bgImage, required this.widgetActions});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: Positioned.fill(
        child: Stack(
          children: [
            bgImage,
            Positioned(top: 0, bottom: 0, child: widgetActions),
          ],
        ),
      ),
    );
  }
}

class WidgetActions extends GetView {
  final CustomText? title;
  final String? tags;
  final BotomInfo? windowsAction;
  final double? width;
  final CustomButton? butons;
  WidgetActions({this.title,  this.tags, this.width, this.windowsAction,this.butons});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: MediaQuery.of(context).size.height, // Makes it full screen height
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // top column
              Row(
                children: [
                  title ?? SizedBox(),
                  (tags == null) ? SizedBox(): CustomButton(
                  buttonText:tags!,
                  backGroundColor: Color(0XFFF5F5F5),
                  color: Color(0XFF1B5E20),
                  ),
                ],
              ),
              // bottom Column
              Column(children: [
                  Row(
                    children: [
                      butons??SizedBox(),
                    ],
                  ),
                  windowsAction?? SizedBox()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BotomInfo extends GetView {
  final Widget? buton;
  final Widget? icon;
  final Widget? location;

  BotomInfo({this.buton, this.icon,this.location});

  @override
  Widget build(BuildContext context) {
    // print("hereis$title");
    return Row(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buton ?? SizedBox(),
            icon ?? SizedBox(),
            SizedBox(width: 10),

            location??SizedBox()
            // CustomText(
            //   content: "hello",
            //   color: Colors.white,
            //   fontWeight: FontWeight.w700,
            //   fontSize: 20,
            // ),
          ],
        ),
      ],
    );
  }
}

class NewsBox extends GetView {
  final Widget artTitle,time,iconn;

  // final Widget iconn;

  const NewsBox({
    
    required this.artTitle,
    required this.time,
    required this.iconn
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     artTitle,
                      time
                              
                    ],
                  ),
                ),
                iconn
              ],
            ),
          )

        ],
    );
  }
}