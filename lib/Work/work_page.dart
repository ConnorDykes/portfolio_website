import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

final softwareJobs = [
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

final otherJobs = [
  WorkCard(
    title: 'Manager',
    company: 'Dynamic Earth Equipment',
    dates: '2014 - April 2016',
    image: 'assets/dynamic_earth.png',
  ),
  WorkCard(
    title: 'Youth Programs Manager',
    company: 'Zenith Climbing Center',
    dates: 'April 2016 - August 2020',
    image: 'assets/zenith.png',
  ),
  WorkCard(
    title: 'General Manager',
    company: 'ABC Kids Climbing',
    dates: 'August 2022 - Now',
    image: 'assets/abc_climbing.png',
  ),
];

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Work',
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200),
            child: Divider(
              indent: 10,
              endIndent: 10,
              thickness: 3,
              color: theme.colorScheme.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSlidingSegmentedControl(
                thumbColor: theme.colorScheme.primary,
                groupValue: index,
                children: {
                  0: Text("Software",
                      style: TextStyle(
                          color: index == 0 ? Colors.white : Colors.black)),
                  1: Text(
                    "Other",
                    style: TextStyle(
                        color: index == 1 ? Colors.white : Colors.black),
                  )
                },
                onValueChanged: (value) {
                  if (value != null) {
                    setState(() {
                      index = value;
                    });
                  }
                }),
          ),
          index == 0
              ? Expanded(
                  child: Timeline.tileBuilder(
                    scrollDirection: Axis.horizontal,
                    builder: TimelineTileBuilder.fromStyle(
                      contentsAlign: ContentsAlign.alternating,
                      contentsBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: softwareJobs[index],
                      ),
                      itemCount: softwareJobs.length,
                    ),
                  ),
                )
              : Expanded(
                  child: Timeline.tileBuilder(
                    scrollDirection: Axis.horizontal,
                    builder: TimelineTileBuilder.fromStyle(
                      contentsAlign: ContentsAlign.alternating,
                      contentsBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: otherJobs[index],
                      ),
                      itemCount: otherJobs.length,
                    ),
                  ),
                ),
        ],
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
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(12)),
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
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Work',
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Divider(
          indent: 100,
          endIndent: 100,
          thickness: 3,
          color: theme.colorScheme.primary,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoSlidingSegmentedControl(
              thumbColor: theme.colorScheme.primary,
              groupValue: index,
              children: {
                0: Text("Software",
                    style: TextStyle(
                        color: index == 0 ? Colors.white : Colors.black)),
                1: Text(
                  "Other",
                  style: TextStyle(
                      color: index == 1 ? Colors.white : Colors.black),
                )
              },
              onValueChanged: (value) {
                if (value != null) {
                  setState(() {
                    index = value;
                  });
                }
              }),
        ),
        index == 0
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Timeline.tileBuilder(
                  theme: TimelineTheme.of(context).copyWith(
                    nodePosition: .9,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  builder: TimelineTileBuilder.fromStyle(
                    contentsAlign: ContentsAlign.reverse,
                    contentsBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: softwareJobs[index],
                    ),
                    itemCount: softwareJobs.length,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Timeline.tileBuilder(
                  theme: TimelineTheme.of(context).copyWith(
                    nodePosition: .1,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  builder: TimelineTileBuilder.fromStyle(
                    contentsAlign: ContentsAlign.basic,
                    contentsBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: otherJobs[index],
                    ),
                    itemCount: otherJobs.length,
                  ),
                ),
              ),
      ]),
    );
  }
}
