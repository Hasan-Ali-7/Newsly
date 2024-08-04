import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/app_cubit/app_cubit.dart';


Widget cTextFormField(
  context,
  {
    required String hint,

    required TextEditingController controller,
    required TextInputType keybord,
    bool issecured = false,  
    
    Icon? prefex,
    IconButton? suffix,
    
    Color focusColor =  Colors.red,
    Color hoverColor =  Colors.red,
    double borderRadius = 5,
    
    required  myvalidator,
    required Function(String)? onChanged,
    required void Function(String?)? onSaved,
    required Function(String)? onFieldSubmitted,

  } ) => TextFormField(

      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.next, 
      controller: controller,
      keyboardType: keybord,
      obscureText: issecured,

      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      validator: myvalidator, 

      decoration: InputDecoration(

        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0 ),

        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color:  BlocProvider.of<AppCubit>(context).isDark
                  ? Colors.white
                  : Colors.black,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: focusColor,
            )),
        errorBorder:  OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              // color: Colors.red,
            )),
        focusColor: focusColor,
        hoverColor: hoverColor,

        suffix: suffix,
        prefixIcon: prefex,

        hintText: hint,
      ),


      style: TextStyle( 
        fontSize: 18,  
        fontWeight: FontWeight.w500
      ),

    );
