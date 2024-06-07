import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> news = [
      "News",
      "Sport",
      "Business",
      "Life & Style",
    ];

    List<String> subscriptions = [
      "Why Subscribe?",
      "Subscribtion Bundles",
      "Gift Subscription",
      "Home Deilvery",
    ];

    List<String> productsnServices = [
      "ePaper",
      "eBook",
      "Newspaper Archive",
      "Email Alert & Newsletters",
      "Article Archive",
      "Newspaper Archive",
      "Excutive Jobs",
    ];

    List<String> aboutUs = [
      "Advertise",
      "Contact Us",
      "Careers",
    ];

    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      height: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ADDIS POST",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 24,
                    ),
              ),
              const Spacer(),
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/icons/facebook.png",
                      height: 24,
                    ),
                    Image.asset(
                      "assets/icons/linkedin.png",
                      height: 24,
                    ),
                    Image.asset(
                      "assets/icons/twitter.png",
                      height: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...news.map(
                (item) => Text(item),
              ),
            ],
          ),
          (size.width > 979)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Subscribe"),
                    ...subscriptions.map(
                      (item) => Text(item),
                    ),
                  ],
                )
              : Container(),
          (size.width > 979)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product & Services"),
                    ...productsnServices.map(
                      (item) => Text(item),
                    ),
                  ],
                )
              : Container(),
          (size.width > 979)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Us",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    ...aboutUs.map(
                      (item) => Text(item),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
