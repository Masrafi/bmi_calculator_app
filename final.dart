import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'result_page.dart';
import 'dart:math';


class CalculateBrain{
  CalculateBrain({this.height,this.weight, this.age});
  final int height;
  final int weight;
  final int age;

  double _bmi;

  String getCalculate(){
    _bmi= weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getStatus(){
    if(_bmi >=25){
      return 'Overweight';
    }else if(_bmi >= 18.3){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

  String getMessage(){
    if(_bmi >=25){
      return 'Take Fast Daily More and More';
    }else if(_bmi >= 18.3){
      return 'Very Good Health, Keep Momenturm';
    }else{
      return 'Daily Eat ^ Time For More Weight';
    }
  }
  String getAge(){
    if(age<=12 && age>0){
      return 'Child';
    }else if(age>12 && age<19){
      return 'Adolescence';
    }else if(age>18 && age<60 ){
      return 'Adult';
    }else if(age>60 && age<100){
      return 'Senior Adult';
    }else{
      return 'Please provide Absulate age';
    }
  }
}