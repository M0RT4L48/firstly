import 'package:flutter/material.dart';
import 'package:quiz/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg"),
          SafeArea(
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 2),
            Text(
            "Let's Play Quiz," ,
            style: Theme.of(context).textTheme.headline4?.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text("Enter your informations below"),
            Spacer(),
            TextField(
              decoration: InputDecoration(
                fillColor: Color(0xFF1C2341),
                hintText: "Full Name",
                border: OutlineInputBorder (
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                  
              ),
            ),
            Spacer(),
            InkWell(
              onTap: (){},
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.all(kDefaultPadding * 0.75),
                decoration: BoxDecoration(gradient: kPrimaryGradient, borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Text("Lets Start Quiz", style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(color: Colors.black),),
              ),
            ),
            Spacer(flex: 2),
            ],
          ),
          ),
      ),
      ],
    ),
    );
  }
}