import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/Homepage/what_I_do.dart';
import 'package:portfolio_website/Projects/project_modle.dart';
import 'package:portfolio_website/theme.dart';

class ProjectDialog extends StatefulWidget {
  const ProjectDialog({
    super.key,
    required ProjectModel this.project,
  });

  final ProjectModel project;

  @override
  State<ProjectDialog> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProjectDialog> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ProjectModel project = widget.project;

    final platformButtons = [
      //* if platform is iOS
      if (project.platfroms!.contains(Platforms.iOS))
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: 3,
          child: InkWell(
            onTap: project.iOSLink == null ? null : () {},
            child: Container(
              height: 75,
              width: 75,
              child: GridViewItem(
                  color: Colors.transparent,
                  icon: FaIcon(
                    FontAwesomeIcons.apple,
                    color: Colors.black,
                    size: 48,
                  ),
                  title: Text("iOS")),
            ),
          ),
        ),

      //* if platfrom is android
      if (project.platfroms!.contains(Platforms.android))
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: 3,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 75,
              width: 75,
              child: GridViewItem(
                  color: Colors.transparent,
                  icon: FaIcon(
                    FontAwesomeIcons.android,
                    color: Colors.lightGreen,
                    size: 48,
                  ),
                  title: Text("Android")),
            ),
          ),
        ),

      //* if platfrom os web
      if (project.platfroms!.contains(Platforms.web))
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: 3,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 75,
              width: 75,
              child: GridViewItem(
                  color: Colors.transparent,
                  icon: FaIcon(
                    FontAwesomeIcons.code,
                    size: 48,
                    color: Colors.lightBlue,
                  ),
                  title: Text("Web")),
            ),
          ),
        ),
    ];

    final rowChildren = [
      Flexible(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Summary',
                    style: theme.textTheme.headlineSmall,
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
                  Text(
                    project.description ?? '',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Text(
                  'Platforms',
                  style: theme.textTheme.headlineSmall,
                  textAlign: TextAlign.center,
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: platformButtons)
              ]),
            ),
          ),
        ),
      ),
    ];

    final columnChildren = [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 700),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Summary',
                    style: theme.textTheme.headlineSmall,
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
                    child: Text(
                      project.description ?? '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 700),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Text(
                  'Platforms',
                  style: theme.textTheme.headlineSmall,
                  textAlign: TextAlign.center,
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: platformButtons)
              ]),
            ),
          ),
        ),
      ),
      Padding(padding: EdgeInsets.all(16))
    ];

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(project.name.toString()),
        titleTextStyle: theme.textTheme.headlineLarge,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FloatingActionButton.small(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close)),
          )
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    project.icon ?? '',
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: 350, maxWidth: MediaQuery.of(context).size.width),
              child: RawScrollbar(
                crossAxisMargin: 2,
                thumbColor: theme.colorScheme.primaryContainer,
                trackColor: Colors.grey[400]!.withOpacity(.75),
                radius: Radius.circular(15),
                trackRadius: Radius.circular(15),
                thumbVisibility: true,
                trackVisibility: true,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...project.images?.map(
                            (image) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: OpenContainer(
                                closedColor: Colors.transparent,
                                openColor: theme.scaffoldBackgroundColor,
                                closedShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                transitionType:
                                    ContainerTransitionType.fadeThrough,
                                openBuilder: (context, action) => Stack(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      child: Image.asset(
                                        image ?? '',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: FloatingActionButton.small(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Icon(Icons.close)),
                                    ),
                                  ],
                                ),
                                closedBuilder: (context, action) => MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      image ?? '',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ) ??
                          [Text('no image')]
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        // Styling.isLargeScreen(context)
        //     ? Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 16),
        //         child: Row(
        //           children: rowChildren,
        //         ))
        //     :
        Column(
          children: columnChildren,
        ),
      ]),
    );
  }
}
