
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import '../utils/color_utils.dart';
import '../utils/font_utils.dart';
import 'image_utils.dart';

class MyButton extends StatelessWidget {
  String text;
  Color? color;
  Color? textColor;
  Color? borderColor;
  VoidCallback onPress;
  double height, circularRadius;
  Widget? child;
  bool isEnabled;
  double? Elevatioon;
  double? textSize;

  MyButton(
      {this.text = "No text given",
      required this.onPress,
      this.color,
      this.borderColor,
      this.textColor,
      this.height = 60,
      this.circularRadius = 17,
      this.child,
        this.Elevatioon,
        this.textSize,
      this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    Color disableColor = Color(0x1d2b3990);
    Color normalColor = ColorUtils.dividerColor;
    return MaterialButton(
      elevation: Elevatioon ?? 0,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      minWidth: double.infinity,
      hoverElevation: 0,
      focusElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      color: color ?? normalColor,
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(circularRadius),
        // side:
        //     BorderSide(color: color ?? (isEnabled ? normalColor : borderColor)),
        side:
        BorderSide(color: borderColor ?? Colors.transparent),
      ),
      onPressed: isEnabled ? onPress : null,
      disabledColor: disableColor,
      textColor: Colors.white,
      child: child ??
          Text(
            text,
            style: TextStyle(
              fontSize: textSize ?? 20.sp,
              color: textColor ?? (isEnabled ? Colors.white : Colors.white),
              fontFamily: FontUtils.almarenaRegular,
            ),
          ),
    );
  }
}

void toast(message) {
  if (message != null) {
    showToast(
      message,
      duration: Duration(seconds: 2),
      position: ToastPosition.bottom,
      backgroundColor: Colors.grey[800],
      radius: 5.0,
      textStyle: TextStyle(fontSize: 16.0, color: Colors.white),
    );
  }
}

void NotImplemented() {
  toast('Not Implemented Yet');
}


class EditText extends StatelessWidget {
  Function(String?)? onChange, onSaved;
  String? Function(String?)? validator;
  final String? hintText,
      errorText,
      prefixIcon,
      suffixIcon,
      fontFamily,
      labelText;
  IconData? icon, prefixiconData;
  bool setEnable, showBorder;
  bool obscure;
  bool isDropDown, isPassword;
  TextInputAction? textInputAction;
  TextInputType? textInputType;
  List<TextInputFormatter>? inputFormatter;
  FocusNode? currentFocus, nextFocus;
  BuildContext context;
  Function(String)? onFieldSubmitted;
  TextEditingController? controller;
  VoidCallback? suffixClick;
  int? maxLines, maxLength, minLines;
  Color? filledcolor;
  Color bordercolor;
  Color? labelcolor;
  VoidCallback? ONTAP;
  bool? TExtAlign;
  bool? readonly;
  TextCapitalization textCapitalization;
  double? borderradius;

  EditText({
    required this.context,
    this.onChange,
    this.hintText,
    this.errorText,
    this.icon,
    this.prefixiconData,
    this.prefixIcon,
    this.suffixIcon,
    this.fontFamily,
    this.onSaved,
    this.validator,
    this.setEnable = true,
    this.obscure = false,
    this.isDropDown = false,
    this.isPassword = false,
    this.showBorder = true,
    this.currentFocus,
    this.nextFocus,
    this.textInputAction,
    this.textInputType,
    this.inputFormatter,
    this.onFieldSubmitted,
    this.controller,
    this.suffixClick,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.filledcolor,
    this.labelText,
    this.labelcolor,
    this.ONTAP,
    this.TExtAlign,
    this.readonly,
    this.borderradius,
    this.textCapitalization = TextCapitalization.none,
    required this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          validator: validator,
          controller: controller,
          textCapitalization: textCapitalization,
          enabled: setEnable,
          onChanged: onChange,
          onSaved: onSaved,
          maxLines: maxLines ?? 2,
          readOnly: readonly ?? false,
          maxLength: maxLength,
          textAlign: TExtAlign!= null ? TextAlign.center : TextAlign.start,
          minLines: minLines ?? 1,
          cursorColor: ColorUtils.black,
          focusNode: currentFocus,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          inputFormatters: inputFormatter,
          obscureText: obscure,
          style: TextStyle(
            height: 1.2,
            fontSize:  18.sp,
            color: ColorUtils.dividerColor,
            fontFamily:  FontUtils.almarenaRegular,
          ),
          textAlignVertical: TextAlignVertical.center,
          onTap: ONTAP,
          onFieldSubmitted: onFieldSubmitted ??
                  (value) {
                _fieldFocusChange(currentFocus, nextFocus);
              },
          decoration: InputDecoration(
              counterText: "",
              isCollapsed:
              prefixIcon != null || prefixiconData != null || suffixIcon != null,
            contentPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
              hintText: hintText,
              errorStyle: TextStyle(
                fontSize: 14.0,
              ),
              errorMaxLines: 2,
              isDense: true,
              // filled: true,
              // fillColor: (currentFocus?.hasFocus ?? false)
              //     ? ColorUtils.white
              //     : ((controller?.text?.isEmpty ?? true)
              //     ? ColorUtils.white
              //     : ColorUtils.white),
              prefixStyle: TextStyle(color: Colors.blue, fontSize: 16),
              hintStyle: TextStyle(
                  fontFamily: FontUtils.almarenaRegular,
                  color: ColorUtils.hintColor,
                  fontSize: 16.sp, height: 1),
              // labelText: labelText,
              alignLabelWithHint: true,
              // labelStyle: TextStyle(
              //     color: (currentFocus?.hasFocus ?? false)
              //         ? ColorUtils.marigold
              //         : ((controller?.text?.isEmpty ?? true)
              //         ? ColorUtils.hint_color
              //         : ColorUtils.marigold),
              //     fontSize: 14.sp,
              //     fontFamily: FontUtils.aventaSemiBold,
              //     height: 1.2),
              suffixIcon: isPassword
                  ? IconButton(
                splashColor: Colors.transparent,
                icon: (obscure ?? false)
                    ? ImageIcon(AssetImage(ImageUtils.eyecross),size: 25, color: ColorUtils.black.withOpacity(0.5),)
                    : ImageIcon(AssetImage(ImageUtils.eyecross),size: 25, color: ColorUtils.black.withOpacity(0.5),),
                // color:
                //     (obscure ?? false) ? ColorUtils.charcoalGrey : ColorUtils.marigold,
                onPressed: suffixClick,
              )
                  : isDropDown
                  ? SizedBox(
                width: 1.w,
                height: 15,
                child: Image.asset(
                  suffixIcon!,
                  color:  ColorUtils.black,
                  scale: 3.5,
                ),
              )
                  : suffixIcon != null
                  ? GestureDetector(
                onTap: suffixClick,
                child: Image.asset(
                  suffixIcon!,
                  scale: 2,
                  // color: ColorUtils.black,
                ),
              )
                  : null,
              prefixIcon: prefixiconData != null
                  ? Icon(
                prefixiconData,
                color:  ColorUtils.black,
                size: 20,
              )
                  : prefixIcon != null
                  ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 5.w),
                  Image.asset(
                    prefixIcon!,
                    color: (currentFocus?.hasFocus ?? false)
                        ? ColorUtils.dividerColor
                        : ((controller?.text?.isEmpty ?? true)
                        ?  ColorUtils.dividerColor
                        : ColorUtils.dividerColor),
                    scale: 2,
                  )
                ],
              )
                  : null,
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorUtils.dividerColor),),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorUtils.dividerColor),),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorUtils.dividerColor),),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorUtils.dividerColor),),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorUtils.dividerColor),),
          ),
        )
      ],
    );
  }

  _fieldFocusChange(
      /*BuildContext context,*/ FocusNode? currentFocus, FocusNode? nextFocus) {
    currentFocus?.unfocus();
    if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
  }
}





// class EditText extends StatelessWidget {
//   Function(String?)? onChange, onSaved;
//   String? Function(String?)? validator;
//   final String? hintText,
//       errorText,
//       fontFamily,
//       labelText;
//   bool setEnable;
//   bool obscure;
//   TextInputAction? textInputAction;
//   TextInputType? textInputType;
//   List<TextInputFormatter>? inputFormatter;
//   FocusNode? currentFocus, nextFocus;
//   BuildContext context;
//   Function(String)? onFieldSubmitted;
//   TextEditingController? controller;
//   int? maxLines, maxLength, minLines;
//   Color? labelcolor;
//   bool? readonly;
//   TextCapitalization textCapitalization;
//
//   EditText({
//     required this.context,
//     this.onChange,
//     this.hintText,
//     this.errorText,
//     this.fontFamily,
//     this.onSaved,
//     this.validator,
//     this.setEnable = true,
//     this.obscure = false,
//     this.currentFocus,
//     this.nextFocus,
//     this.textInputAction,
//     this.textInputType,
//     this.inputFormatter,
//     this.onFieldSubmitted,
//     this.controller,
//     this.maxLength,
//     this.minLines,
//     this.maxLines = 1,
//     this.labelText,
//     this.labelcolor,
//     this.readonly,
//     this.textCapitalization = TextCapitalization.none,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     this.context = context;
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextFormField(
//           validator: validator,
//           controller: controller,
//           textCapitalization: textCapitalization,
//           enabled: setEnable,
//           onChanged: onChange,
//           onSaved: onSaved,
//           maxLines: maxLines ?? 2,
//           readOnly: readonly ?? false,
//           maxLength: maxLength,
//           // textAlign: TExtAlign!= null ? TextAlign.center : TextAlign.start,
//           minLines: minLines ?? 1,
//           cursorColor: ColorUtils.black,
//           focusNode: currentFocus,
//           textInputAction: textInputAction,
//           keyboardType: textInputType,
//           inputFormatters: inputFormatter,
//           obscureText: obscure,
//           style: TextStyle(
//             height: 1.2,
//             fontSize:  18.sp,
//             color: ColorUtils.black,
//             fontFamily:  FontUtils.almarenaRegular,
//           ),
//           textAlignVertical: TextAlignVertical.center,
//           onFieldSubmitted: onFieldSubmitted ??
//                   (value) {
//                 _fieldFocusChange(currentFocus, nextFocus);
//               },
//           decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
//               hintText: hintText,
//               errorStyle: TextStyle(
//                 fontSize: 14.0,
//               ),
//               errorMaxLines: 2,
//               isDense: true,
//               hintStyle: TextStyle(
//                   fontFamily: FontUtils.almarenaRegular,
//                   color: ColorUtils.hintColor,
//                   fontSize: 18.sp, height: 1),
//               // alignLabelWithHint: true,
//               disabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: ColorUtils.dividerColor),),
//               enabledBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: ColorUtils.dividerColor),),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: ColorUtils.dividerColor),),
//               errorBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: ColorUtils.dividerColor),),
//               focusedErrorBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: ColorUtils.dividerColor),),
//           ),
//         )
//       ],
//     );
//   }
//
//   _fieldFocusChange(
//       /*BuildContext context,*/ FocusNode? currentFocus, FocusNode? nextFocus) {
//     currentFocus?.unfocus();
//     if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
//   }
// }


class RadioGroup extends StatefulWidget {
  String? title;
  List<String> list;
  Color color;
  String? initValue;
  Function(String)? onChanged;

  RadioGroup(
      {this.title,
      required this.list,
      this.initValue,
      this.color = Colors.black,
      this.onChanged});

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (String item in widget.list)
          _myRadioButton(
            title: item,
            value: item,
//          selected: item==_groupValue?true:false,
            onChanged: (newValue) =>
                newValue ??
                setState(() {
                  widget.initValue = newValue;
                  widget.onChanged ?? widget.onChanged!(newValue!);
                }),
          ),
      ],
    );
  }

  Widget _myRadioButton(
      {required String title,
      required String value,
      bool selected = false,
      Function(String?)? onChanged}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.black, width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.black),
      child: RadioListTile(
        activeColor: widget.color,
        value: value,
        groupValue: widget.initValue,
        selected: selected,
        onChanged: onChanged,
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ChoiceChip(
        label: Text(
          isSelected ? "Interested" : "Not Interested",
          style: TextStyle(color: Colors.white),
        ),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            isSelected = selected;
          });
        },
      ),
    );
  }
}

class BackBtn extends StatelessWidget {
  const BackBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.only(left: 5.w),
      icon: Image.asset(ImageUtils.eyecross, scale: 2.8,),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}

class WhiteBackBtn extends StatelessWidget {
  const WhiteBackBtn({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.only(left: 15.w),
      icon: Image.asset(ImageUtils.eyecross, scale: 2.4,),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}


class CrossBtn extends StatelessWidget {
  const CrossBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SizedBox(
          width: 24,
          height: 24,
          child: Image.asset(
            ImageUtils.eyecross,
            fit: BoxFit.cover,
          )),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
class CrossBlackBtn extends StatelessWidget {
  const CrossBlackBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SizedBox(
          width: 24,
          height: 24,
          child: Image.asset(
            ImageUtils.eyecross,
            fit: BoxFit.cover,
          )),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}

class SimpleEditText extends StatefulWidget {
  Function(String?)? onChange, onSaved;
  String? Function(String?)? validator;
  final String? hintText, errorText, prefixIcon, suffixIcon, fontFamily;
  IconData? icon, prefixiconData;
  bool setEnable, showBorder;
  bool obscure;
  bool isDropDown, isPassword, isFilled, isLabelHidden, readOnly;
  Color filledColor, borderColor;
  TextInputAction? textInputAction;
  TextInputType? textInputType;
  List<TextInputFormatter>? inputFormatter;
  FocusNode? currentFocus, nextFocus;
  BuildContext context;
  Function(String)? onFieldSubmitted;
  TextEditingController? controller;
  VoidCallback? suffixClick;
  int? maxLines, maxLength;
  String? value;
  VoidCallback? ONTAP;

  SimpleEditText({
    required this.context,
    this.value,
    this.onChange,
    this.hintText,
    this.errorText,
    this.icon,
    this.prefixiconData,
    this.prefixIcon,
    this.suffixIcon,
    this.fontFamily,
    this.onSaved,
    this.validator,
    this.setEnable = true,
    this.obscure = false,
    this.isDropDown = false,
    this.isPassword = false,
    this.showBorder = true,
    this.isFilled = false,
    this.isLabelHidden = false,
    this.filledColor = const Color(0x0f0a3746),
    this.borderColor = Colors.transparent,
    this.currentFocus,
    this.nextFocus,
    this.textInputAction,
    this.textInputType,
    this.inputFormatter,
    this.onFieldSubmitted,
    this.controller,
    this.suffixClick,
    this.maxLength,
    this.maxLines = 1,
    this.ONTAP,
    this.readOnly = false,
  });

  @override
  State<SimpleEditText> createState() => _SimpleEditTextState();
}

class _SimpleEditTextState extends State<SimpleEditText> {
  @override
  Widget build(BuildContext context) {
    //this.context = context;
    return TextFormField(
      validator: widget.validator,
//      autovalidate: true,
      controller: widget.controller,
      enabled: widget.setEnable,
      onChanged: (val) {
        setState(() {
          if (val != null && val.length > 0) {
            widget.value = val;
            if (widget.onChange != null) widget.onChange!(val);
          } else
            widget.value = null;
        });
      },
      onSaved: widget.onSaved,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
//      autofocus: true,
      focusNode: widget.currentFocus,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      inputFormatters: widget.inputFormatter,
      obscureText: widget.obscure,
      readOnly: widget.readOnly,
//      cursorColor: accentColor,
      style: TextStyle(
        height: 1.2,
        fontSize:  16.sp,
        color: ColorUtils.black,
        fontFamily:  FontUtils.almarenaRegular,
      ),
      textAlignVertical: TextAlignVertical.center,
      onTap: widget.ONTAP,
      //textAlign: TextAlign.justify,
      onFieldSubmitted: widget.onFieldSubmitted ??
          (value) {
            _fieldFocusChange(widget.currentFocus, widget.nextFocus);
          },
      decoration: InputDecoration(
        isCollapsed: widget.prefixIcon != null ||
            widget.prefixiconData != null ||
            widget.suffixIcon != null,
        contentPadding: EdgeInsets.fromLTRB(20, 15, 15, 15),
        hintText: widget.hintText,
        // filled: this.widget.isFilled,
        // fillColor: this.widget.filledColor,
        filled: true,
        // fillColor: Color(0x0f0a3746),
        fillColor: ColorUtils.greyish.withOpacity(0.16),
        // prefixStyle: TextStyle(color: Colors.blue, fontSize: 16),
        labelStyle: TextStyle(
            fontFamily: FontUtils.almarenaRegular,
            color: Color.fromARGB(255, 69, 79, 99),
            fontSize: 16,
            height: 1.2),
        // labelText: this.widget.isLabelHidden ? null : this.widget.hintText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        // labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(
            fontFamily: FontUtils.almarenaRegular,
            color: ColorUtils.charcoalGrey.withOpacity(0.5),
            fontSize: 14.sp),
        suffixIcon: widget.isPassword
            ? IconButton(
                splashColor: Colors.transparent,
                icon: Icon(widget.icon),
                color: Color(0xff7c849c),
                onPressed: widget.suffixClick,
              )
            : widget.isDropDown
                ? SizedBox(
                    width: 0,
                    height: 15,
                    child: Image.asset(
                      widget.suffixIcon!,
                      scale: 2.5,
                    ),
                  )
                : widget.suffixIcon != null
                    ? GestureDetector(
                        onTap: widget.suffixClick,
                        child: Image.asset(
                          widget.suffixIcon!,
                          scale: 2.5,
                          color: ColorUtils.hint_color,
                        ),
                      )
                    : null,
        prefixIcon: widget.prefixiconData != null
            ? Icon(
                widget.prefixiconData,
                color: Color(0xff838EA9),
                size: 20,
              )
            : widget.prefixIcon != null
                ? Image.asset(
                    widget.prefixIcon!,
                    scale: 2.5,
                  )
                : null,
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: this.widget.borderColor),
            borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: this.widget.borderColor),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: this.widget.borderColor),
            borderRadius: BorderRadius.circular(15)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: this.widget.borderColor),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  _fieldFocusChange(
      /*BuildContext context,*/ FocusNode? currentFocus, FocusNode? nextFocus) {
    currentFocus?.unfocus();
    if (nextFocus != null)
      FocusScope.of(widget.context).requestFocus(nextFocus);
  }
}

class MyButtonSecondary extends StatelessWidget {
  String text;
  Color? color;
  Color? textColor;
  Color? borderColor;
  VoidCallback onPress;
  double height, circularRadius;
  Widget? child;
  bool isEnabled;

  MyButtonSecondary(
      {this.text = "No text given",
      required this.onPress,
      this.color,
      this.borderColor,
      this.textColor,
      this.height = 52,
      this.circularRadius = 15,
      this.child,
      this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    Color disableColor = ColorUtils.black.withOpacity(0.2);
    Color normalColor = ColorUtils.marigold;
    return MaterialButton(
      color: color ?? normalColor,
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(circularRadius),
        // side: BorderSide(
        //     color: color ??
        //         (isEnabled ? normalColor : Colors.transparent!)),
      ),
      onPressed: isEnabled ? onPress : null,
      disabledColor: disableColor,
      textColor: Colors.white,
      child: child ??
          Text(
            text,
            style: TextStyle(
              fontSize: 17.sp,
              color: textColor ??
                  (isEnabled
                      ? Colors.white
                      : ColorUtils.black.withOpacity(0.5)),
              fontFamily: FontUtils.almarenaRegular,
            ),
          ),
    );
  }
}

class MyDialogButton extends StatelessWidget {
  String text;
  Color? color;
  Color? textColor;
  Color? borderColor;
  VoidCallback onPress;
  double height, circularRadius;
  Widget? child;
  bool isEnabled;

  MyDialogButton(
      {this.text = "No text given",
      required this.onPress,
      this.color,
      this.borderColor,
      this.textColor,
      this.height = 20,
      this.circularRadius = 20,
      this.child,
      this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    Color disableColor = ColorUtils.black.withOpacity(0.2);
    Color normalColor = ColorUtils.white;
    return MaterialButton(
      color: color ?? normalColor,
      height: height,
      minWidth: 120,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(circularRadius),
        side: BorderSide(
            color: borderColor ??
                (isEnabled ? normalColor : Colors.transparent!)),
      ),
      onPressed: isEnabled ? onPress : null,
      disabledColor: disableColor,
      textColor: Colors.white,
      child: child ??
          Text(
            text,
            style: TextStyle(
              fontSize: 20.sp,
              color: textColor ??
                  (isEnabled
                      ? Colors.white
                      : ColorUtils.black.withOpacity(0.5)),
              fontFamily: FontUtils.almarenaRegular,
            ),
          ),
    );
  }
}

class Spinner extends StatefulWidget {
  var array, hint;
  String? value;
  String? heading;
  String? icon;
  String? dropdownValue;
  Function onChange;
  Color borderColor, filledColor, placeholderTextColor;
  IconData arrowIcon;

  Spinner(
      {this.hint,
      this.value,
      this.array,
      this.icon,
      this.heading,
      this.dropdownValue,
      this.borderColor = Colors.transparent,
      this.filledColor = Colors.transparent,
      this.placeholderTextColor = const Color(0xff78849e),
      this.arrowIcon = Icons.arrow_drop_down,
      required this.onChange});

  @override
  _SpinnerState createState() => _SpinnerState();
}
class _SpinnerState extends State<Spinner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.heading ?? "",
          style: TextStyle(
              fontFamily: FontUtils.almarenaRegular,
              color: ColorUtils.black,
              fontSize: 12.sp,
              fontStyle: FontStyle.normal),
        ),
        SizedBox(height: 4.h,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: widget.dropdownValue != null ? ColorUtils.darkGrey.withOpacity(0.2) : Colors.transparent),
            color: widget.dropdownValue != null ? ColorUtils.white : ColorUtils.filled,
            // boxShadow: Colors.grey,
          ),
          child: DropdownButton<String>(
            dropdownColor: ColorUtils.white,
            hint: Row(
              children: <Widget>[
                if (widget.icon != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0, left: 4),
                    child: Image.asset(
                      widget.icon!,
                      color:  ColorUtils.charcoalGrey.withOpacity(0.5),
                      scale: 3.3,
                    )
                  ),
                SizedBox(
                  width: widget.icon != null ? 13 : 0,
                ),
                Text(
                  widget.hint,
                  style: TextStyle(
                      fontFamily: FontUtils.almarenaRegular,
                      color: ColorUtils.charcoalGrey.withOpacity(0.4),
                      fontSize: 14.sp, height: 1),
                ),
              ],
            ),
            isExpanded: true,
            value: widget.dropdownValue,
            iconEnabledColor: ColorUtils.main_black,
            borderRadius:
            BorderRadius.circular(20),
            // icon: Icon(
            //   widget.arrowIcon,
            //   color: ColorUtils.black,
            // ),
            icon: SizedBox(
              width: 25.w,
              height: 15,
              child: Image.asset(
                ImageUtils.eyecross,
                scale: 3.5,
                color: Colors.black,
              ),
            ),
            elevation: 16,
            style: TextStyle(
              height: 1.2,
              fontSize:  14.sp,
              color: ColorUtils.darkGreyTwo.withOpacity(0.7),
              fontFamily:  FontUtils.almarenaRegular,
            ),
            underline: Container(
              height: 1,
              color: Colors.transparent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                widget.borderColor = Colors.black;
                widget.dropdownValue = newValue;
                widget.value = newValue;
                widget.onChange(newValue);
              });
            },
            items: widget.array.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: <Widget>[
                    if (widget.icon != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0, left: 4),
                        child: Image.asset(
                          widget.icon!,
                          scale: 3.3,
                        ),
                      ),
                    SizedBox(
                      width: (widget.icon != null) ? 13 : 0,
                    ),
                    Text(
                      value,
                      style: TextStyle(
                        height: 1.2,
                        fontSize:  14.sp,
                        color: ColorUtils.darkGreyTwo.withOpacity(0.7),
                        fontFamily:  FontUtils.almarenaRegular,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class CustomAppBarr extends StatelessWidget {
  Color? BackgroundColor;
  double? Elevation;
  Widget? Leading;
  double? TitleSpacing;
  String? title;
  bool? CenterTile;
  List<Widget>? Options;

  CustomAppBarr(
      {this.BackgroundColor,
      this.Elevation,
      this.Leading,
      this.TitleSpacing,
      this.title,
      this.CenterTile,
      this.Options});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: BackgroundColor ?? ColorUtils.main_black,
      elevation: Elevation ?? 0,
      leading: Leading ?? BackBtn(),
      titleSpacing: TitleSpacing ?? -5,
      title: Text(
        title!,
        style: TextStyle(
            color: ColorUtils.black,
            fontFamily: FontUtils.almarenaRegular,
            fontSize: 18.sp),
      ),
      centerTitle: CenterTile ?? false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: Options,
    );
  }
}

Future bottomSheet(
    {@required Widget? dialogName,
      @required String? title,
      onConfirm,
      Function? onCancel,
      context}) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: ColorUtils.hint_color,
      builder: (BuildContext builder) {
        return Container(
            color: ColorUtils.hint_color,
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 10.w),
                  child: Text(title.toString(),
                      style: TextStyle(
                        fontFamily: FontUtils.almarenaRegular,
                        color: ColorUtils.white,
                        fontSize: 14.sp,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.7,
                      )),
                ),
                Flexible(child: dialogName!),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel',
                            style: TextStyle(
                                color: ColorUtils.white,
                                fontFamily: FontUtils.almarenaRegular,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: onConfirm,
                        child: Text('Confirm',
                            style: TextStyle(
                                color: ColorUtils.white,
                                fontFamily: FontUtils.almarenaRegular,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp)),
                      ),
                    ],
                  ),
                ),
              ],
            ));
      });
}

Widget SpinnerPicker({required List? list, required onSelectedItemChanged}) {
  return CupertinoPicker(
    backgroundColor: ColorUtils.hint_color,
    onSelectedItemChanged: onSelectedItemChanged,
    itemExtent: 32.0,
    children: list!.map((e) {
      return Text(e.toString(), style: TextStyle(color: ColorUtils.white),);
    }).toList(),
  );
}

List<dynamic> monthList = [];
List<dynamic> yearList = [];
var month;
var year;





class CommonEditText extends StatefulWidget {
  Function(String?)? onChange, onSaved;
  String? Function(String?)? validator;
  final String? hintText, errorText, prefixIcon, suffixIcon, fontFamily, suffixText;
  IconData? icon, prefixiconData;
  bool setEnable, showBorder;
  bool obscure;
  bool isDropDown, isPassword, isFilled, isLabelHidden, readOnly, isText;
  Color filledColor, borderColor;
  TextInputAction? textInputAction;
  TextInputType? textInputType;
  List<TextInputFormatter>? inputFormatter;
  FocusNode? currentFocus, nextFocus;
  BuildContext context;
  Function(String)? onFieldSubmitted;
  TextEditingController? controller;
  VoidCallback? suffixClick;
  int? maxLines, maxLength;
  String? value;
  VoidCallback? ONTAP;

  CommonEditText({
    required this.context,
    this.value,
    this.suffixText,
    this.onChange,
    this.hintText,
    this.errorText,
    this.icon,
    this.prefixiconData,
    this.prefixIcon,
    this.suffixIcon,
    this.fontFamily,
    this.onSaved,
    this.isText = false,
    this.validator,
    this.setEnable = true,
    this.obscure = false,
    this.isDropDown = false,
    this.isPassword = false,
    this.showBorder = true,
    this.isFilled = false,
    this.isLabelHidden = false,
    this.filledColor = const Color(0x0f0a3746),
    this.borderColor = const Color(0x0f0a3746),
    this.currentFocus,
    this.nextFocus,
    this.textInputAction,
    this.textInputType,
    this.inputFormatter,
    this.onFieldSubmitted,
    this.controller,
    this.suffixClick,
    this.maxLength,
    this.maxLines = 1,
    this.ONTAP,
    this.readOnly = false,
  });

  @override
  State<CommonEditText> createState() => _CommonEditTextState();
}

class _CommonEditTextState extends State<CommonEditText> {
  @override
  Widget build(BuildContext context) {
    //this.context = context;
    return TextFormField(
      validator: widget.validator,
//      autovalidate: true,
      controller: widget.controller,
      enabled: widget.setEnable,
      onChanged: (val) {
        setState(() {
          if (val != null && val.length > 0) {
            widget.value = val;
            if (widget.onChange != null) widget.onChange!(val);
          } else
            widget.value = null;
        });
      },
      onSaved: widget.onSaved,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
//      autofocus: true,
      focusNode: widget.currentFocus,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      inputFormatters: widget.inputFormatter,
      obscureText: widget.obscure,
      readOnly: widget.readOnly,
//      cursorColor: accentColor,
      style: TextStyle(
        height: 1.2,
        fontSize: 16,
        color: Colors.white,
        fontFamily: FontUtils.almarenaRegular,
      ),
      textAlignVertical: TextAlignVertical.center,
      onTap: widget.ONTAP,
      //textAlign: TextAlign.justify,
      onFieldSubmitted: widget.onFieldSubmitted ??
              (value) {
            _fieldFocusChange(widget.currentFocus, widget.nextFocus);
          },
      decoration: InputDecoration(
        isCollapsed: widget.prefixIcon != null ||
            widget.prefixiconData != null ||
            widget.suffixIcon != null,
        contentPadding: EdgeInsets.all(10),
        hintText: widget.hintText,
        // filled: this.widget.isFilled,
        // fillColor: this.widget.filledColor,
        filled: true,
        // fillColor: Color(0x0f0a3746),
        fillColor: ColorUtils.field_background,
        // prefixStyle: TextStyle(color: Colors.blue, fontSize: 16),
        labelStyle: TextStyle(
            fontFamily: FontUtils.almarenaRegular,
            color: Color.fromARGB(255, 69, 79, 99),
            fontSize: 16,
            height: 1.2),
        // labelText: this.widget.isLabelHidden ? null : this.widget.hintText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        // labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(
            fontFamily: FontUtils.almarenaRegular,
            color: ColorUtils.hint_color,
            fontSize: 16.sp),
        suffixIconConstraints: widget.isDropDown ? BoxConstraints(minWidth: 30.w) : BoxConstraints(minWidth: 24.w),


        //
        // suffixIcon: widget.isPassword
        //     ? IconButton(
        //   splashColor: Colors.transparent,
        //   icon: Icon(widget.icon),
        //   color: Color(0xff7c849c),
        //   onPressed: widget.suffixClick,
        // )
        //     : widget.isDropDown
        //     ? SizedBox(
        //   width: 0,
        //   height: 15,
        //   child: Image.asset(
        //     widget.suffixIcon!,
        //     scale: 2.5,
        //   ),
        // )
        //     : widget.suffixIcon != null
        //     ? GestureDetector(
        //   onTap: widget.suffixClick,
        //   child: Image.asset(
        //     widget.suffixIcon!,
        //     scale: 2.5,
        //     color: ColorUtils.hint_color,
        //   ),
        // )
        //     : null,



        suffixIcon: widget.isPassword
            ? IconButton(
          splashColor: Colors.transparent,
          icon: Icon(widget.icon),
          color: Color(0xff7c849c),
          onPressed: widget.suffixClick,
        )
            : widget.isDropDown
            ? SizedBox(
          width: 0,
          height: 15,
          child: Image.asset(
            widget.suffixIcon!,
            scale: 2.5,
          ),
        )
            : widget.isText ? Padding(
          padding: EdgeInsets.only(right: 10.w),
          child:  Text(widget.suffixText ?? "ft",
              style: TextStyle(
                  color: ColorUtils.hint_color,
                  fontFamily: FontUtils.almarenaRegular,
                  fontSize: 14.sp)),
        ) :  widget.suffixIcon != null
            ? GestureDetector(
          onTap: widget.suffixClick,
          child: Image.asset(
            widget.suffixIcon!,
            scale: 2.5,
            color: ColorUtils.hint_color,
          ),
        )
            : null,


        prefixIcon: widget.prefixiconData != null
            ? Icon(
          widget.prefixiconData,
          color: Color(0xff838EA9),
          size: 20,
        )
            : widget.prefixIcon != null
            ? Image.asset(
          widget.prefixIcon!,
          scale: 2.5,
        )
            : null,
        // disabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: this.widget.borderColor),
        //     borderRadius: BorderRadius.circular(18)),
        // enabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: this.widget.borderColor),
        //     borderRadius: BorderRadius.circular(18)),
        // focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: this.widget.borderColor),
        //     borderRadius: BorderRadius.circular(18)),
        // errorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: this.widget.borderColor),
        //     borderRadius: BorderRadius.circular(18)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtils.field_background),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtils.field_background),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtils.field_background),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtils.field_background),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  _fieldFocusChange(
      /*BuildContext context,*/ FocusNode? currentFocus, FocusNode? nextFocus) {
    currentFocus?.unfocus();
    if (nextFocus != null)
      FocusScope.of(widget.context).requestFocus(nextFocus);
  }
}

class CurveEditText extends StatelessWidget {
  Function(String?)? onChange, onSaved;
  String? Function(String?)? validator;
  final String? hintText,
      errorText,
      prefixIcon,
      suffixIcon,
      fontFamily,
      suffixText,
      labelText;
  IconData? icon, prefixiconData;
  bool setEnable, showBorder;
  bool obscure;
  bool isDropDown, isPassword, isText;
  TextInputAction? textInputAction;
  TextInputType? textInputType;
  List<TextInputFormatter>? inputFormatter;
  FocusNode? currentFocus, nextFocus;
  BuildContext context;
  Function(String)? onFieldSubmitted;
  TextEditingController? controller;
  VoidCallback? suffixClick;
  int? maxLines, maxLength, minLines;
  Color? filledcolor;
  Color bordercolor;
  Color? labelcolor;
  VoidCallback? ONTAP;
  bool? TExtAlign;
  bool? readonly;
  TextCapitalization textCapitalization;
  double? borderradius;

  CurveEditText({
    required this.context,
    this.onChange,
    this.hintText,
    this.errorText,
    this.icon,
    this.prefixiconData,
    this.prefixIcon,
    this.suffixIcon,
    this.fontFamily,
    this.onSaved,
    this.validator,
    this.suffixText,
    this.setEnable = true,
    this.obscure = false,
    this.isDropDown = false,
    this.isText = false,
    this.isPassword = false,
    this.showBorder = true,
    this.currentFocus,
    this.nextFocus,
    this.textInputAction,
    this.textInputType,
    this.inputFormatter,
    this.onFieldSubmitted,
    this.controller,
    this.suffixClick,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.filledcolor,
    this.labelText,
    this.labelcolor,
    this.ONTAP,
    this.TExtAlign,
    this.readonly,
    this.borderradius,
    this.textCapitalization = TextCapitalization.none,
    required this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return TextFormField(
      validator: validator,
//      autovalidate: true,
    textCapitalization: textCapitalization,
      controller: controller,
      enabled: setEnable,
      onChanged: onChange,
      onSaved: onSaved,
      maxLines: maxLines ?? 2,
      readOnly: readonly ?? false,
      maxLength: maxLength,
      textAlign: TExtAlign!= null ? TextAlign.center : TextAlign.start,
      minLines: minLines ?? 1,
      cursorColor: borderradius == null ? ColorUtils.white : ColorUtils.black,


//      autofocus: true,
      focusNode: currentFocus,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      inputFormatters: inputFormatter,
      obscureText: obscure,
//      cursorColor: accentColor,
      style: TextStyle(
        height: 1.2,
        fontSize:  borderradius == null ? 16.sp : 12.sp,
        color: borderradius == null ? ColorUtils.white : ColorUtils.black,
        fontFamily:  borderradius == null ? FontUtils.almarenaRegular : FontUtils.almarenaRegular,
      ),
      textAlignVertical: TextAlignVertical.center,
      onTap: ONTAP,
      onFieldSubmitted: onFieldSubmitted ??
              (value) {
            _fieldFocusChange(currentFocus, nextFocus);
          },
      decoration: InputDecoration(
          counterText: "",
          isCollapsed:
          prefixIcon != null || prefixiconData != null || suffixIcon != null,
          // contentPadding: suffixIcon != null ? EdgeInsets.only(left: 50, right: 3,) : EdgeInsets.all(15),
          contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 15),
          hintText: hintText,
          // suffixIconConstraints: BoxConstraints(maxHeight:  14),
          isDense: true,
          filled: true,
          fillColor: (currentFocus?.hasFocus ?? false)
              ? Colors.transparent
              : ((controller?.text?.isEmpty ?? true)
              ? filledcolor
              : Colors.transparent),
          prefixStyle: TextStyle(color: Colors.blue, fontSize: 16),
          hintStyle: TextStyle(
              fontFamily: FontUtils.almarenaRegular,
              color: borderradius == null ?  ColorUtils.hint_color : ColorUtils.black,
              fontSize: 14.sp, height: 1),
          labelText: labelText,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
              color: (currentFocus?.hasFocus ?? false)
                  ? ColorUtils.marigold
                  : ((controller?.text?.isEmpty ?? true)
                  ? ColorUtils.hint_color
                  : ColorUtils.marigold),
              fontSize: 14.sp,
              fontFamily: FontUtils.almarenaRegular,
              height: 1.2),
          suffixIconConstraints: isDropDown ? BoxConstraints(minWidth: 20.w) : BoxConstraints(minWidth: 24.w),
          suffixIcon: isPassword
              ? IconButton(
            splashColor: Colors.transparent,
            icon: (obscure ?? false)
                ? ImageIcon(AssetImage(ImageUtils.eyecross),size: 25, color: ColorUtils.hint_color,)
                : ImageIcon(AssetImage(ImageUtils.eyecross),size: 25,),
            color:
            (obscure ?? false) ? ColorUtils.hint_color : ColorUtils.marigold,
            onPressed: suffixClick,
          )
              : isDropDown
              ? SizedBox(
            width: 1.w,
            height: 15,
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Image.asset(
                suffixIcon!,
                scale: 3.5,
                color: Colors.white,
              ),
            ),
          )
              : isText ? Padding(
                padding: EdgeInsets.only(right: 10.w),
                child:  Text(suffixText ?? "ft",
                    style: TextStyle(
                        color: ColorUtils.hint_color,
                        fontFamily: FontUtils.almarenaRegular,
                        fontSize: 14.sp)),
              ) :  suffixIcon != null
              ? GestureDetector(
            onTap: suffixClick,
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Image.asset(
                suffixIcon!,
                scale: 2.5,
                // color: ColorUtils.black,
              ),
            ),
          )
              : null,
          prefixIcon: prefixiconData != null
              ? Icon(
            prefixiconData,
            color:  ColorUtils.black,
            size: 20,
          )
              : prefixIcon != null
              ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 17),
              Image.asset(
                prefixIcon!,
                color: (currentFocus?.hasFocus ?? false)
                    ? ColorUtils.white
                    : ((controller?.text?.isEmpty ?? true)
                    ?  ColorUtils.hint_color
                    : ColorUtils.white),
                scale: 3,
              )
            ],
          )
              : null,
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (currentFocus?.hasFocus ?? false)
                      ? borderradius == null ? ColorUtils.marigold : Colors.transparent
                      : ((controller?.text?.isEmpty ?? true)
                      ? Colors.transparent
                      : borderradius == null ? ColorUtils.marigold : Colors.transparent)),
              borderRadius: BorderRadius.circular(borderradius ?? 14)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (currentFocus?.hasFocus ?? false)
                      ? borderradius == null ? ColorUtils.marigold : Colors.transparent
                      : ((controller?.text?.isEmpty ?? true)
                      ? borderradius == null ?  ColorUtils.field_background.withOpacity(0) : Colors.transparent
                      : borderradius == null ? ColorUtils.marigold : Colors.transparent)),
              borderRadius: BorderRadius.circular(borderradius ?? 14)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (currentFocus?.hasFocus ?? false)
                      ? borderradius == null ? ColorUtils.marigold : Colors.transparent
                      : ((controller?.text?.isEmpty ?? true)
                      ? borderradius == null ? ColorUtils.field_background : Colors.transparent
                      : borderradius == null ? ColorUtils.marigold : Colors.transparent)),
              borderRadius: BorderRadius.circular(borderradius ?? 14)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (currentFocus?.hasFocus ?? false)
                      ? borderradius == null ? ColorUtils.marigold : Colors.transparent
                      : ((controller?.text?.isEmpty ?? true)
                      ? Colors.transparent
                      : borderradius == null ? ColorUtils.marigold : Colors.transparent)),
              borderRadius: BorderRadius.circular(borderradius ?? 14)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (currentFocus?.hasFocus ?? false)
                      ? borderradius == null ? ColorUtils.marigold : Colors.transparent
                      : ((controller?.text?.isEmpty ?? true)
                      ? Colors.transparent
                      : borderradius == null ? ColorUtils.marigold : Colors.transparent)),
              borderRadius: BorderRadius.circular(borderradius ?? 14))
      ),
    );
  }

  _fieldFocusChange(
      /*BuildContext context,*/ FocusNode? currentFocus, FocusNode? nextFocus) {
    currentFocus?.unfocus();
    if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
  }
}


class LocationTextField extends StatefulWidget {
  Function(String?)? onChange, onSaved;
  String? Function(String?)? validator;
  final String? hintText, errorText, prefixIcon, suffixIcon, fontFamily;
  IconData? icon, prefixiconData;
  bool setEnable, showBorder;
  bool obscure;
  bool isDropDown, isPassword, isFilled, isLabelHidden, readOnly;
  Color filledColor, borderColor;
  TextInputAction? textInputAction;
  TextInputType? textInputType;
  List<TextInputFormatter>? inputFormatter;
  FocusNode? currentFocus, nextFocus;
  BuildContext context;
  Function(String)? onFieldSubmitted;
  TextEditingController? controller;
  VoidCallback? suffixClick;
  int? maxLines, maxLength;
  String? value;
  VoidCallback? ONTAP;

  LocationTextField({
    required this.context,
    this.value,
    this.onChange,
    this.hintText,
    this.errorText,
    this.icon,
    this.prefixiconData,
    this.prefixIcon,
    this.suffixIcon,
    this.fontFamily,
    this.onSaved,
    this.validator,
    this.setEnable = true,
    this.obscure = false,
    this.isDropDown = false,
    this.isPassword = false,
    this.showBorder = true,
    this.isFilled = false,
    this.isLabelHidden = false,
    this.filledColor = const Color(0x0f0a3746),
    this.borderColor = const Color(0x0f0a3746),
    this.currentFocus,
    this.nextFocus,
    this.textInputAction,
    this.textInputType,
    this.inputFormatter,
    this.onFieldSubmitted,
    this.controller,
    this.suffixClick,
    this.maxLength,
    this.maxLines = 1,
    this.ONTAP,
    this.readOnly = false,
  });

  @override
  State<LocationTextField> createState() => _LocationTextFieldState();
}

class _LocationTextFieldState extends State<LocationTextField> {
  @override
  Widget build(BuildContext context) {
    //this.context = context;
    return TextFormField(
      validator: widget.validator,
//      autovalidate: true,
      controller: widget.controller,
      enabled: widget.setEnable,
      onChanged: (val) {
        setState(() {
          if (val != null && val.length > 0) {
            widget.value = val;
            if (widget.onChange != null) widget.onChange!(val);
          } else
            widget.value = null;
        });
      },
      onSaved: widget.onSaved,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
//      autofocus: true,
      focusNode: widget.currentFocus,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      inputFormatters: widget.inputFormatter,
      obscureText: widget.obscure,
      readOnly: widget.readOnly,
//      cursorColor: accentColor,
      style: TextStyle(
        height: 1.2,
        fontSize: 16,
        color: Colors.white,
        fontFamily: FontUtils.almarenaRegular,
      ),
      textAlignVertical: TextAlignVertical.center,
      onTap: widget.ONTAP,
      //textAlign: TextAlign.justify,
      onFieldSubmitted: widget.onFieldSubmitted ??
              (value) {
            _fieldFocusChange(widget.currentFocus, widget.nextFocus);
          },
      decoration: InputDecoration(
        isCollapsed: widget.prefixIcon != null ||
            widget.prefixiconData != null ||
            widget.suffixIcon != null,
        contentPadding: EdgeInsets.all(10),
        hintText: widget.hintText,
        // filled: this.widget.isFilled,
        // fillColor: this.widget.filledColor,
        filled: true,
        // fillColor: Color(0x0f0a3746),
        fillColor: ColorUtils.field_background,
        // prefixStyle: TextStyle(color: Colors.blue, fontSize: 16),
        labelStyle: TextStyle(
            fontFamily: FontUtils.almarenaRegular,
            color: Color.fromARGB(255, 69, 79, 99),
            fontSize: 16,
            height: 1.2),
        // labelText: this.widget.isLabelHidden ? null : this.widget.hintText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        // labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(
            fontFamily: FontUtils.almarenaRegular,
            color: ColorUtils.hintColor,
            fontSize: 16.sp),
        suffixIcon: widget.isPassword
            ? IconButton(
          splashColor: Colors.transparent,
          icon: Icon(widget.icon),
          color: Color(0xff7c849c),
          onPressed: widget.suffixClick,
        )
            : widget.isDropDown
            ? SizedBox(
          width: 0,
          height: 15,
          child: Image.asset(
            widget.suffixIcon!,
            scale: 3,
          ),
        )
            : widget.suffixIcon != null
            ? GestureDetector(
          onTap: widget.suffixClick,
          child: Image.asset(
            widget.suffixIcon!,
            scale: 3,
            color: ColorUtils.white,
          ),
        )
            : null,
        prefixIcon: widget.prefixiconData != null
            ? Icon(
          widget.prefixiconData,
          color: Color(0xff838EA9),
          size: 20,
        )
            : widget.prefixIcon != null
            ? Image.asset(
          widget.prefixIcon!,
          scale: 2.5,
          color: ColorUtils.marigold,
        )
            : null,
        // disabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: this.widget.borderColor),
        //     borderRadius: BorderRadius.circular(18)),
        // enabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: this.widget.borderColor),
        //     borderRadius: BorderRadius.circular(18)),
        // focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: this.widget.borderColor),
        //     borderRadius: BorderRadius.circular(18)),
        // errorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: this.widget.borderColor),
        //     borderRadius: BorderRadius.circular(18)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  _fieldFocusChange(
      /*BuildContext context,*/ FocusNode? currentFocus, FocusNode? nextFocus) {
    currentFocus?.unfocus();
    if (nextFocus != null)
      FocusScope.of(widget.context).requestFocus(nextFocus);
  }
}


















class DescriptionEditText extends StatelessWidget {
  Function(String?)? onChange, onSaved;
  String? Function(String?)? validator;
  final String? hintText,
      errorText,
      initialText,
      prefixIcon,
      suffixIcon,
      fontFamily,
      labelText;
  IconData? icon, prefixiconData;
  bool setEnable, showBorder;
  bool obscure;
  bool isDropDown, isPassword;
  TextInputAction? textInputAction;
  TextInputType? textInputType;
  List<TextInputFormatter>? inputFormatter;
  FocusNode? currentFocus, nextFocus;
  BuildContext context;
  Function(String)? onFieldSubmitted;
  TextEditingController? controller;
  VoidCallback? suffixClick;
  int? maxLines, maxLength, minLines;
  Color? filledcolor;
  Color bordercolor;
  Color? labelcolor;
  VoidCallback? ONTAP;
  bool? TExtAlign;
  bool? readonly;
  TextCapitalization textCapitalization;
  double? borderradius;

  DescriptionEditText({
    required this.context,
    this.onChange,
    this.hintText,
    this.errorText,
    this.icon,
    this.initialText,
    this.prefixiconData,
    this.prefixIcon,
    this.suffixIcon,
    this.fontFamily,
    this.onSaved,
    this.validator,
    this.setEnable = true,
    this.obscure = false,
    this.isDropDown = false,
    this.isPassword = false,
    this.showBorder = true,
    this.currentFocus,
    this.nextFocus,
    this.textInputAction,
    this.textInputType,
    this.inputFormatter,
    this.onFieldSubmitted,
    this.controller,
    this.suffixClick,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.filledcolor,
    this.labelText,
    this.labelcolor,
    this.ONTAP,
    this.TExtAlign,
    this.readonly,
    this.borderradius,
    this.textCapitalization = TextCapitalization.none,
    required this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return TextFormField(
      validator: validator,
      controller: controller,
      textCapitalization: textCapitalization,
      enabled: setEnable,
      onChanged: onChange,
      onSaved: onSaved,
      maxLines: maxLines ?? 2,
      readOnly: readonly ?? false,
      maxLength: maxLength,
      initialValue: initialText != null ? initialText : "",
      textAlign: TExtAlign!= null ? TextAlign.center : TextAlign.start,
      minLines: minLines ?? 1,
      cursorColor: ColorUtils.black,
      focusNode: currentFocus,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      inputFormatters: inputFormatter,
      obscureText: obscure,
      style: TextStyle(
        height: 1.2,
        fontSize:  14.sp,
        color: ColorUtils.darkGreyTwo.withOpacity(0.7),
        fontFamily:  FontUtils.almarenaRegular,
      ),
      textAlignVertical: TextAlignVertical.center,
      onTap: ONTAP,
      onFieldSubmitted: onFieldSubmitted ??
              (value) {
            _fieldFocusChange(currentFocus, nextFocus);
          },
      decoration: InputDecoration(
          counterText: "",
          isCollapsed:
          prefixIcon != null || prefixiconData != null || suffixIcon != null,
          contentPadding: EdgeInsets.all(15),
          hintText: hintText,
          errorStyle: TextStyle(
            fontSize: 14.0,
          ),
          errorMaxLines: 2,
          isDense: true,
          filled: true,
          fillColor: (currentFocus?.hasFocus ?? false)
              ? ColorUtils.white
              : ((controller?.text?.isEmpty ?? true)
              ? ColorUtils.filled
              : ColorUtils.white),
          prefixStyle: TextStyle(color: Colors.blue, fontSize: 16),
          hintStyle: TextStyle(
              fontFamily: FontUtils.almarenaRegular,
              color: ColorUtils.charcoalGrey.withOpacity(0.4),
              fontSize: 14.sp, height: 1),
          // labelText: labelText,
          alignLabelWithHint: true,
          // labelStyle: TextStyle(
          //     color: (currentFocus?.hasFocus ?? false)
          //         ? ColorUtils.marigold
          //         : ((controller?.text?.isEmpty ?? true)
          //         ? ColorUtils.hint_color
          //         : ColorUtils.marigold),
          //     fontSize: 14.sp,
          //     fontFamily: FontUtils.almarenaRegular,
          //     height: 1.2),
          suffixIcon: isPassword
              ? IconButton(
            splashColor: Colors.transparent,
            icon: (obscure ?? false)
                ? ImageIcon(AssetImage(ImageUtils.eyecross),size: 25, color: ColorUtils.charcoalGrey,)
                : ImageIcon(AssetImage(ImageUtils.eyecross),size: 25, color: ColorUtils.charcoalGrey,),
            // color:
            //     (obscure ?? false) ? ColorUtils.charcoalGrey : ColorUtils.marigold,
            onPressed: suffixClick,
          )
              : isDropDown
              ? SizedBox(
            width: 1.w,
            height: 15,
            child: Image.asset(
              suffixIcon!,
              scale: 3.5,
            ),
          )
              : suffixIcon != null
              ? GestureDetector(
            onTap: suffixClick,
            child: Image.asset(
              suffixIcon!,
              scale: 2.5,
              // color: ColorUtils.black,
            ),
          )
              : null,
          prefixIcon: prefixiconData != null
              ? Icon(
            prefixiconData,
            color:  ColorUtils.black,
            size: 20,
          )
              : prefixIcon != null
              ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 17),
              Image.asset(
                prefixIcon!,
                color: (currentFocus?.hasFocus ?? false)
                    ? ColorUtils.marigold
                    : ((controller?.text?.isEmpty ?? true)
                    ?  ColorUtils.charcoalGrey.withOpacity(0.6)
                    : ColorUtils.marigold),
                scale: 3.3,
              )
            ],
          )
              : null,
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (currentFocus?.hasFocus ?? false)
                      ? ColorUtils.darkGrey.withOpacity(0.2)
                      : ((controller?.text?.isEmpty ?? true)
                      ? Colors.transparent
                      : ColorUtils.darkGrey.withOpacity(0.2))),
              borderRadius: BorderRadius.circular(borderradius ?? 15)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (currentFocus?.hasFocus ?? false)
                      ? ColorUtils.darkGrey.withOpacity(0.2)
                      : ((controller?.text?.isEmpty ?? true)
                      ? Colors.transparent
                      : ColorUtils.darkGrey.withOpacity(0.2))),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (currentFocus?.hasFocus ?? false)
                      ? ColorUtils.darkGrey.withOpacity(0.2)
                      : ((controller?.text?.isEmpty ?? true)
                      ? Colors.transparent
                      : ColorUtils.darkGrey.withOpacity(0.2))),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (currentFocus?.hasFocus ?? false)
                      ? ColorUtils.darkGrey.withOpacity(0.2)
                      : ((controller?.text?.isEmpty ?? true)
                      ? Colors.transparent
                      : ColorUtils.darkGrey.withOpacity(0.2))),
              borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (currentFocus?.hasFocus ?? false)
                      ? ColorUtils.darkGrey.withOpacity(0.2)
                      : ((controller?.text?.isEmpty ?? true)
                      ? Colors.transparent
                      : ColorUtils.darkGrey.withOpacity(0.2))),
              borderRadius: BorderRadius.circular(10))
      ),
    );
  }

  _fieldFocusChange(
      /*BuildContext context,*/ FocusNode? currentFocus, FocusNode? nextFocus) {
    currentFocus?.unfocus();
    if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
  }
}


class SimpleSpinner extends StatefulWidget {
  var array, hint;
  String? value;
  String? heading;
  String? icon, dropdownValue;
  Function onChange;
  Color borderColor, filledColor, placeholderTextColor;
  IconData arrowIcon;

  SimpleSpinner(
      {this.hint,
        this.value,
        this.array,
        this.icon,
        this.heading,
        this.dropdownValue,
        this.borderColor = Colors.transparent,
        this.filledColor = Colors.transparent,
        this.placeholderTextColor = const Color(0xff78849e),
        this.arrowIcon = Icons.arrow_drop_down,
        required this.onChange});

  @override
  _SimpleSpinnerState createState() => _SimpleSpinnerState();
}

class _SimpleSpinnerState extends State<SimpleSpinner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: widget.dropdownValue != null ? ColorUtils.darkGrey.withOpacity(0.2) : Colors.transparent),
        color: widget.dropdownValue != null ? ColorUtils.white : ColorUtils.filled,
        // boxShadow: Colors.grey,
      ),
      child: DropdownButton<String>(
        dropdownColor: ColorUtils.white,
        hint: Row(
          children: <Widget>[
            if (widget.icon != null)
              Padding(
                  padding: const EdgeInsets.only(bottom: 0, left: 4),
                  child: Image.asset(
                    widget.icon!,
                    color:  ColorUtils.charcoalGrey.withOpacity(0.5),
                    scale: 3.3,
                  )
              ),
            SizedBox(
              width: widget.icon != null ? 13 : 0,
            ),
            Text(
              widget.hint,
              style: TextStyle(
                  fontFamily: FontUtils.almarenaRegular,
                  color: ColorUtils.charcoalGrey.withOpacity(0.4),
                  fontSize: 14.sp, height: 1),
            ),
          ],
        ),
        isExpanded: true,
        value: widget.dropdownValue,
        iconEnabledColor: ColorUtils.main_black,
        borderRadius:
        BorderRadius.circular(20),
        // icon: Icon(
        //   widget.arrowIcon,
        //   color: ColorUtils.black,
        // ),
        icon: SizedBox(
          width: 25.w,
          height: 15,
          child: Image.asset(
            ImageUtils.eyecross,
            scale: 3.5,
            color: Colors.black,
          ),
        ),
        elevation: 16,
        style: TextStyle(
          height: 1.2,
          fontSize:  14.sp,
          overflow: TextOverflow.ellipsis,
          color: ColorUtils.darkGreyTwo.withOpacity(0.7),
          fontFamily:  FontUtils.almarenaRegular,
        ),
        underline: Container(
          height: 1,
          color: Colors.transparent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            widget.borderColor = Colors.black;
            widget.dropdownValue = newValue;
            widget.value = newValue;
            widget.onChange(newValue);
          });
        },
        items: widget.array.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Row(
              children: <Widget>[
                if (widget.icon != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0, left: 4),
                    child: Image.asset(
                      widget.icon!,
                      scale: 3.3,
                    ),
                  ),
                SizedBox(
                  width: (widget.icon != null) ? 13 : 0,
                ),
                SizedBox(
                  width: 270.w,
                  child: Text(
                    value,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.2,
                      fontSize:  14.sp,
                      color: ColorUtils.darkGreyTwo.withOpacity(0.7),
                      fontFamily:  FontUtils.almarenaRegular,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}


