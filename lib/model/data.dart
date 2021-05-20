import 'package:flutter/material.dart';

class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc(
      "Your Dream Creative Career to join our Image Creative Education,Pondicherry.");
  sliderModel.setTitle("Search");
  sliderModel.setImageAssetPath("image/logo.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "Learn 3D animation ,Start your 3D animation career at Image Creative Education");
  sliderModel.setTitle("3D");
  sliderModel.setImageAssetPath("image/kkk.GIF");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "It was very good experience at image pondicherry. The knowledge and support  I got from the staff,");
  sliderModel.setTitle("Our Students SaY");
  sliderModel.setImageAssetPath("image/ss.PNG");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
