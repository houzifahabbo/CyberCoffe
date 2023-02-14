import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'color_scheme.dart';
import 'image_constants.dart';

 Widget textFormFieldConstant (String label,bool hideText,Function onChanged,Function onPressed,Function validator){
   Widget visibilityIcon = SvgPicture.asset(ImageConstants.visibilityIcon);
   return TextFormField(
     validator: (val) => val!.isEmpty ? 'Enter an email' : null,
     obscureText: hideText,
     onChanged: (val) {
       onChanged;
     },
     decoration: InputDecoration(
         labelStyle: const TextStyle(
             color: AppColorScheme.lightGrey, fontSize: 20),
         filled: true,
         fillColor: Colors.white,
         focusedBorder: const OutlineInputBorder(
             borderSide:
             BorderSide(color: AppColorScheme.lightGrey)),
         enabledBorder: const OutlineInputBorder(
             borderSide:
             BorderSide(color: AppColorScheme.lightGrey)),
         labelText: label,
         suffixIcon: hideText ?
         IconButton(
               icon: visibilityIcon,
               onPressed: () {onPressed;},)
             : null));
 }