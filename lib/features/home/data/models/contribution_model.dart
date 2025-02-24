import 'package:flutter/material.dart';

class ContributionModel {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color textColor;

  ContributionModel({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.textColor,
  });
}

List<ContributionModel> contributionModels = [
  ContributionModel(
    title: "1k+",
    subtitle: "Blood Donner",
    backgroundColor: const Color(0xffecf7fe),
    textColor: const Color(0xff62c0fa),
  ),
  ContributionModel(
    title: "1k+",
    textColor: const Color(0xff63e7a1),
    subtitle: "Blood Donner",
    backgroundColor: const Color(0xffecfcf3),
  ),
  ContributionModel(
    title: "1k+",
    textColor: const Color(0xff7f7dfc),
    subtitle: "Blood Donner",
    backgroundColor: const Color(0xffefeffe),
  ),
  ContributionModel(
    title: "1k+",
    subtitle: "Blood Donner",
    textColor: const Color(0xfff47cef),
    backgroundColor: const Color(0xfffdeffd),
  ),
  ContributionModel(
    title: "1k+",
    textColor: const Color(0xfff88585),
    subtitle: "Blood Donner",
    backgroundColor: const Color(0xfffdeffd),
  ),
  ContributionModel(
    title: "1k+",
    textColor: const Color(0xfffbca59),
    subtitle: "Blood Donner",
    backgroundColor: const Color(0xfffef8eb),
  ),
];
