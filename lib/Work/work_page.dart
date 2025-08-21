import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Removed dependency on the timelines package to ensure Dart 3 compatibility

final softwareJobs = [
  const WorkCard(
    title: 'Lead Mobile Developer',
    company: 'Immersion Neuroscience',
    dates: 'March 2024- Present',
    image: 'assets/immersion.jpg',
  ),
  const WorkCard(
    title: 'Flutter Developer',
    company: 'M Genio',
    dates: 'June 2023 - March 2024',
    image: 'assets/Mgenio.png',
  ),
  const WorkCard(
    title: 'Flutter Developer',
    company: 'Eqalink',
    dates: 'November 2022 - June 2023',
    image: 'assets/eqalink_logo.png',
  ),
  const WorkCard(
    title: 'Flutter Developer',
    company: 'ABC Kids Climbing',
    dates: 'July 2022 - August 2022',
    image: 'assets/abc_climbing.png',
  ),
  const WorkCard(
    title: 'Flutter Developer',
    company: 'Kokoro Academy',
    dates: 'March 2022 - June 2022',
    image: 'assets/kokoro_logo.png',
  ),
  const WorkCard(
    title: 'Flutter Developer',
    company: 'BelayTrader',
    dates: 'Nov 2021 - March 2022',
    image: 'assets/belayTrader.png',
  ),
];

final otherJobs = [
  const WorkCard(
    title: 'Manager',
    company: 'Dynamic Earth Equipment',
    dates: '2014 - April 2016',
    image: 'assets/dynamic_earth.png',
  ),
  const WorkCard(
    title: 'Youth Programs Manager',
    company: 'Zenith Climbing Center',
    dates: 'April 2016 - August 2020',
    image: 'assets/zenith.png',
  ),
  const WorkCard(
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
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CupertinoSlidingSegmentedControl(
          //       thumbColor: theme.colorScheme.primary,
          //       groupValue: index,
          //       children: {
          //         0: Text("Software",
          //             style: TextStyle(
          //                 color: index == 0 ? Colors.white : Colors.black)),
          //         1: Text(
          //           "Other",
          //           style: TextStyle(
          //               color: index == 1 ? Colors.white : Colors.black),
          //         )
          //       },
          //       onValueChanged: (value) {
          //         if (value != null) {
          //           setState(() {
          //             index = value;
          //           });
          //         }
          //       }),
          // ),
          index == 0
              ? Expanded(
                  child: ListView.builder(
                    itemCount: softwareJobs.length,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    itemBuilder: (context, itemIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: softwareJobs[itemIndex],
                      );
                    },
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: otherJobs.length,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    itemBuilder: (context, itemIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: otherJobs[itemIndex],
                      );
                    },
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
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    image,
                    height: 56,
                    width: 56,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      dates,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: softwareJobs.length,
                  itemBuilder: (context, itemIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: softwareJobs[itemIndex],
                    );
                  },
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: otherJobs.length,
                  itemBuilder: (context, itemIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: otherJobs[itemIndex],
                    );
                  },
                ),
              ),
      ]),
    );
  }
}
