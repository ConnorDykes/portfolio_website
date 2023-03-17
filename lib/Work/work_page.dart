import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final jobs = [
      Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mobile Developer',
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: Colors.blue)),
                Text('BelayTrader',
                    style: theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w600)),
                Text(
                  'Nov 2021 - March 2022',
                  style: TextStyle(color: theme.dividerColor),
                )
              ]),
        ),
      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mobile Developer',
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: Colors.blue)),
                Text('Kokoro Academy',
                    style: theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w600)),
                Text('March 2022 - June 2022')
              ]),
        ),
      ),
      Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mobile Developer',
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: Colors.blue)),
                Text('ABC Kids Climbing',
                    style: theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w600)),
                Text('July 2022 - August 2022')
              ]),
        ),
      ),
      Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fullstack Flutter Developer',
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: Colors.blue)),
                Text('Eqalink',
                    style: theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w600)),
                Text('November 2022 - Now')
              ]),
        ),
      )
    ];

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

class MobileWorkPage extends StatefulWidget {
  const MobileWorkPage({super.key});

  @override
  State<MobileWorkPage> createState() => _MobileWorkPageState();
}

class _MobileWorkPageState extends State<MobileWorkPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final jobs = [
      Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Mobile Developer',
                style:
                    theme.textTheme.titleLarge!.copyWith(color: Colors.blue)),
            Text('BelayTrader',
                style: theme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w600)),
            Text(
              'Nov 2021 - March 2022',
              style: TextStyle(color: theme.dividerColor),
            )
          ]),
        ),
      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Mobile Developer',
                style:
                    theme.textTheme.titleLarge!.copyWith(color: Colors.blue)),
            Text('Kokoro Academy',
                style: theme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w600)),
            Text('March 2022 - June 2022')
          ]),
        ),
      ),
      Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Mobile Developer',
                style:
                    theme.textTheme.titleLarge!.copyWith(color: Colors.blue)),
            Text('ABC Kids Climbing',
                style: theme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w600)),
            Text('July 2022 - August 2022')
          ]),
        ),
      ),
      Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Fullstack Flutter Developer',
                style:
                    theme.textTheme.titleLarge!.copyWith(color: Colors.blue)),
            Text('Eqalink',
                style: theme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w600)),
            Text('November 2022 - Now')
          ]),
        ),
      )
    ];

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
    ;
  }
}
