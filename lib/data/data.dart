import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, Object>> transactionsData = [
  {
    'icon': const FaIcon(FontAwesomeIcons.burger ,color: Colors.white,),
    'color': const Color(0xFFE57373),
    'name': 'อาหารและเครื่องดื่ม',
    'totalAmount':'-\฿20.00' ,
    'date': 'วันนี้' ,
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.bagShopping,color: Colors.white,),
    'color': const Color(0xFF81C784),
    'name': 'Shopping',
    'totalAmount':'-\฿200.00' ,
    'date': 'วันนี้' ,
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.heartCircleCheck,color: Colors.white,),
    'color': const Color(0xFF64B5F6),
    'name': 'สุขภาพและการดูแลตัวเอง',
    'totalAmount':'-\฿790.00' ,
    'date': 'เมื่อวาน' ,
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.plane,color: Colors.white,),
    'color': const Color(0xFF9575CD),
    'name': 'ท่องเที่ยว',
    'totalAmount':'-\฿790.00' ,
    'date': 'เมื่อวาน' ,
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.utensils,color: Colors.white,),
    'color': const Color(0xFF4DB6AC),
    'name': 'อาหารและเครื่องดื่ม',
    'totalAmount':'-\฿790.00' ,
    'date': 'เมื่อวาน' ,
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.house,color: Colors.white,),
    'color': const Color(0xFF4DB6AC),
    'name': 'บ้านและสวน',
    'totalAmount':'-\฿790.00' ,
    'date': 'เมื่อวาน' ,
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.paw,color: Colors.white,),
    'color': const Color(0xFF4DB6AC),
    'name': 'สัตว์เลี้ยง',
    'totalAmount':'-\฿790.00' ,
    'date': 'เมื่อวาน' ,
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.laptop,color: Colors.white,),
    'color': const Color(0xFF4DB6AC),
    'name': 'การทำงาน',
    'totalAmount':'-\฿790.00' ,
    'date': 'เมื่อวาน' ,
  },
  
];