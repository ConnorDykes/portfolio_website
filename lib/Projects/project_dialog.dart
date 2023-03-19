import 'package:flutter/material.dart';
import 'package:portfolio_website/Projects/project_modle.dart';

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
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      // floatingActionButton: FloatingActionButton.small(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: Icon(Icons.close)),
      appBar: AppBar(
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Summay',
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Text(
                            'Features',
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
                          ...project.features?.map((feature) => Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    feature,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ))) ??
                              []
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
