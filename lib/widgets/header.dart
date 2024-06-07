import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> headerItems = [
      "News",
      "Sport",
      "Bussiness",
      "Life & Style",
    ];

    Size size = MediaQuery.of(context).size;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                (size.width > 767)
                    ? Text(
                        DateFormat.yMMMMEEEEd().format(DateTime.now()),
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    : Icon(Icons.menu),
                const Spacer(),
                Text(
                  "ADDIS POST",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const Spacer(),
                (size.width > 767) ? Container() : Icon(Icons.search),
                (size.width > 767)
                    ? TextButton(
                        onPressed: () {},
                        child: Text("Log in"),
                      )
                    : Container(),
                if (size.width > 767) SizedBox(width: 40),
                (size.width > 767)
                    ? OutlinedButton(
                        onPressed: () {},
                        child: Text("Subscribe"),
                      )
                    : Container(),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: (size.width > 979)
                    ? (size.width * 0.8) - (120 * 3)
                    : size.width * 0.8,
                height: 20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...headerItems.map((item) => headerItem(item, context)),
                  ],
                ),
              ),
              const Spacer(),
              (size.width > 979)
                  ? Row(
                      children: [
                        headerButtons("Search", Icons.search, context),
                        headerButtons(
                            "Podcast", Icons.podcasts_rounded, context),
                        headerButtons(
                            "Video", Icons.videocam_outlined, context),
                      ],
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  Widget headerButtons(String label, IconData icon, context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: 120,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          title: Text(label, style: Theme.of(context).textTheme.bodySmall),
          leading: Icon(icon),
        ),
      ),
    );
  }

  Widget headerItem(String lable, context) {
    return Container(
      margin: const EdgeInsets.only(right: 40),
      width: 80,
      child: Text(lable, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
