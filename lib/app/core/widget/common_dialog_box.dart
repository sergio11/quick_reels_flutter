import 'package:flutter/material.dart';
import 'package:quickreels/app/core/values/app_colors.dart';
import 'package:quickreels/app/core/values/app_values.dart';
import 'package:quickreels/app/core/widget/common_button.dart';

class CommonDialogBox extends StatefulWidget {
  final String title, descriptions, acceptText;
  final Widget img;
  final String? cancelledText;
  final Function()? onAccepted;
  final Function()? onCancelled;

  const CommonDialogBox(
      {Key? key,
        required this.title,
        required this.descriptions,
        required this.acceptText,
        required this.img,
        this.cancelledText,
        this.onAccepted,
        this.onCancelled})
      : super(key: key);

  @override
  CommonDialogBoxState createState() => CommonDialogBoxState();
}

class CommonDialogBoxState extends State<CommonDialogBox> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: scaleAnimation,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.padding),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: contentBox(context),
        ));
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: AppValues.padding,
              top: AppValues.avatarRadius + AppValues.padding,
              right: AppValues.padding,
              bottom: AppValues.padding),
          margin: const EdgeInsets.only(top: AppValues.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppValues.padding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppColors.colorPrimary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColors.colorPrimary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildDialogButtons(),
              ),
            ],
          ),
        ),
        Positioned(
          left: AppValues.padding,
          right: AppValues.padding,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.colorPrimary,
                  width: 4.0,
                ),
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.colorPrimary,
                      offset: Offset(0, 10),
                      blurRadius: 20),
                ]),
            child: CircleAvatar(
              backgroundColor: AppColors.colorPrimary,
              radius: AppValues.avatarRadius,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(AppValues.avatarRadius)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: widget.img,
                  )),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildDialogButtons() {
    final List<Widget> buttons = [];
    if (widget.cancelledText != null && widget.cancelledText!.isNotEmpty) {
      buttons.add(Flexible(
          child: CommonButton(
            text: widget.cancelledText!,
            textColor: AppColors.colorWhite,
            borderColor: AppColors.colorWhite,
            sizeType: CommonButtonSizeType.small,
            onPressed: () {
              widget.onCancelled?.call();
              Navigator.pop(context);
            },
          )));
    }
    buttons.add(Flexible(
      child: CommonButton(
        text: widget.acceptText,
        textColor: AppColors.colorWhite,
        borderColor: AppColors.colorWhite,
        styleType: CommonButtonStyleType.reverse,
        sizeType: CommonButtonSizeType.small,
        onPressed: () {
          widget.onAccepted?.call();
          Navigator.pop(context);
        },
      ),
    ));
    return buttons;
  }
}