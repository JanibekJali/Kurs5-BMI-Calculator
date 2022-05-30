import 'package:bmi_calculator/app_data/repos/app_repo.dart';
import 'package:bmi_calculator/constants/colors/app_color.dart';
import 'package:bmi_calculator/constants/text_styles/app_text_style.dart';
import 'package:bmi_calculator/constants/texts/app_text.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navigation.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key key,
    this.bmiResult,
  }) : super(key: key);
  final double bmiResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 27.0),
          child: Text(
            AppTexts.result.toUpperCase(),
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: AppColors.secondary,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.65,
          width: MediaQuery.of(context).size.width * 0.9,
          color: AppColors.secondaryLight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                appRepos.getResult(bmiResult),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.green,
                ),
              ),
              Text(bmiResult.toStringAsFixed(1), style: AppTextStyle.bidText),
              Text(appRepos.getInterpretation(bmiResult)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavgation(
          text: AppTexts.recalculate,
          onTap: () {
            Navigator.pop(context);
          }),
    );
  }
}
