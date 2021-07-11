import 'package:flutter/material.dart';
import 'package:venko/res/colors.dart';

BottomNavigationBar customBottomNavigationBar({int currentIndex, List<BottomNavigationBarItem> items, void Function(int) onTap}){
  return BottomNavigationBar(
    unselectedItemColor: shandyLady,
    selectedItemColor: white,
    backgroundColor: darkCerulean,
    currentIndex: currentIndex,
    items: items,
    onTap: onTap,
  );
}
