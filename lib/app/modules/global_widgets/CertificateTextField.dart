import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui.dart';

class CertificateTitleTextFieldWidget extends StatelessWidget {
  const CertificateTitleTextFieldWidget({
    Key key,
    this.onSaved,
    this.onTap,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.iconData,
    this.labelText,
    this.obscureText,
    this.suffixIcon,
    this.isFirst,
    this.isLast,
    this.style,
    this.textAlign,
    this.suffix,
  }) : super(key: key);

  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final String initialValue;
  final String hintText;
  final String errorText;
  final TextAlign textAlign;
  final String labelText;
  final TextStyle style;
  final IconData iconData;
  final bool obscureText;
  final bool isFirst;
  final bool isLast;
  final Function onTap;
  final Widget suffixIcon;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 14, left: 10, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            labelText ?? "",
            style: Get.textTheme.bodyText1,
            textAlign: textAlign ?? TextAlign.start,
          ),
          TextFormField(
            maxLines: keyboardType == TextInputType.multiline ? null : 1,
            key: key,
            keyboardType: keyboardType ?? TextInputType.text,
            onSaved: onSaved,
            onChanged: onChanged,
            validator: validator,
            initialValue: initialValue ?? '',
            style: style ?? Get.textTheme.bodyText2,
            obscureText: obscureText ?? false,
            textAlign: textAlign ?? TextAlign.start,
            onTap: onTap,
            decoration: Ui.getInputDecoration(
              hintText: hintText ?? '',
              iconData: iconData,
              suffixIcon: suffixIcon,
              suffix: suffix,
              errorText: errorText,
            ),
          ),
        ],
      ),
    );
  }

  BorderRadius get buildBorderRadius {
    if (isFirst != null && isFirst) {
      return BorderRadius.vertical(top: Radius.circular(10));
    }
    if (isLast != null && isLast) {
      return BorderRadius.vertical(bottom: Radius.circular(10));
    }
    if (isFirst != null && !isFirst && isLast != null && !isLast) {
      return BorderRadius.all(Radius.circular(0));
    }
    return BorderRadius.all(Radius.circular(10));
  }

  double get topMargin {
    if ((isFirst != null && isFirst)) {
      return 20;
    } else if (isFirst == null) {
      return 20;
    } else {
      return 0;
    }
  }

  double get bottomMargin {
    if ((isLast != null && isLast)) {
      return 10;
    } else if (isLast == null) {
      return 10;
    } else {
      return 0;
    }
  }
}
