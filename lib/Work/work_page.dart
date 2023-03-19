import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

final jobs = [
  WorkCard(
    title: 'Flutter Mobile Developer',
    company: 'BelayTrader',
    dates: 'Nov 2021 - March 2022',
    image: 'assets/belayTrader.png',
  ),
  WorkCard(
    title: 'Flutter Mobile Developer',
    company: 'Kokoro Academy',
    dates: 'March 2022 - June 2022',
    image: 'assets/kokoro_logo.png',
  ),
  WorkCard(
    title: 'Flutter Mobile Developer',
    company: 'ABC Kids Climbing',
    dates: 'July 2022 - August 2022',
    image: 'assets/abc_climbing.png',
  ),
  WorkCard(
    title: 'Fullstack Flutter Developer',
    company: 'Eqalink',
    dates: 'November 2022 - Now',
    image: 'assets/eqalink_logo.png',
  )
];

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Timeline.tileBuilder(
        scrollDirection: Axis.horizontal,
        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.alternating,
          contentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: jobs[index],
          ),
          itemCount: jobs.length,
        ),
      ),
    );
  }
}

class WorkCard extends StatelessWidget {
  const WorkCard({
    super.key,
    required this.title,
    required this.company,
    required this.dates,
    required this.image,
  });

  final String title;
  final String company;
  final String dates;
  final String image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("I'm working on it"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/alien.png',
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Come back soon for more details, media, and demos "),
                      ),
                    ],
                  ),
                )),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: Colors.blue)),
                Text(company,
                    style: theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w600)),
                Text(dates),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Material(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          image,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

class MobileWorkPage extends StatefulWidget {
  const MobileWorkPage({super.key});

  @override
  State<MobileWorkPage> createState() => _MobileWorkPageState();
}

class _MobileWorkPageState extends State<MobileWorkPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Timeline.tileBuilder(
        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.alternating,
          contentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: jobs[index],
          ),
          itemCount: jobs.length,
        ),
      ),
    );
  }
}
