import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_fusion/Screen/Widgets/NewsContainer.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        //to start the page from the specific page
        controller: PageController(initialPage: 5),
        itemBuilder: (context, index) {
          return NewsContainer(
              imgUrl: "https://cloudfront-us-east-2.images.arcpublishing.com/reuters/JG4MZ2LKX5MAHEKSPILWEGD3C4.jpg",
              newsHead: "Tesla to lose \$7,500 consumer tax credits for some Model 3 vehicles",
              newsDesc: "The U.S. Treasury issued guidelines earlier this month detailing new battery sourcing restrictions that take effect Jan. 1 aimed at weaning the U.S. electric vehicle supply chain away from China. Tax credit will end for Model 3 Rear-Wheel Drive and Model 3 Long Range on Dec. 31, 2023 based on current view of new IRA guidance. Take delivery by Dec. 31 for full tax credit, the company said in a notice on its website. Tesla did not immediately respond to a Reuters' request for comment. In April, the Treasury said new guidelines will slash the credits for the EV maker's Model 3 RWD by half to \$3,750 but that other Tesla models will retain the entire benefit.",
              newsUrl: "https://www.reuters.com/business/autos-transportation/tesla-lose-7500-consumer-tax-credits-some-model-3-vehicles-2023-12-13/");
        },
        itemCount: 10,
      ),
    );
  }
}
