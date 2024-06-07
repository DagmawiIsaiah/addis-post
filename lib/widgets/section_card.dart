import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text(
            "Sport",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.red),
          ),
          const Spacer(),
          Text(
            "Rugby World Cup: Steve Jackson nkows the frastration of being Samoa's coach",
            style: Theme.of(context).textTheme.titleLarge
          ),
          const Spacer(),
          Text(
            "'I think there's about 67 if the eligbility and thinings like that change'",
            style: Theme.of(context)
                .textTheme
                .bodyLarge
          ),
          const Spacer(flex: 3),
          Row(
            children: [
              Text(
                "9 Oct, 2024",
                style: Theme.of(context).textTheme.bodySmall
              ),
              const SizedBox(width: 40),
              const Icon(
                Icons.timer,
                size: 14,
                color: Colors.black54,
              ),
              Text(
                "5",
                style: Theme.of(context).textTheme.bodySmall
              ),
              Text(
                "min read",
                style: Theme.of(context).textTheme.bodySmall
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
