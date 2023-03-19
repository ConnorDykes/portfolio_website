import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/Projects/project_dialog.dart';
import 'package:portfolio_website/Projects/project_modle.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Flexible(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 32,
              crossAxisSpacing: 32,
              crossAxisCount: 2,
              children: projectCards,
            ),
          ),
        ],
      ),
    );
  }
}

class MobileProjectsPage extends StatefulWidget {
  const MobileProjectsPage({super.key});

  @override
  State<MobileProjectsPage> createState() => _MobileProjectsPageState();
}

class _MobileProjectsPageState extends State<MobileProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(32),
      mainAxisSpacing: 8,
      crossAxisSpacing: 32,
      crossAxisCount: 1,
      children: projectCards,
    );
  }
}

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required ProjectModel this.project,
  });

  final ProjectModel project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final String name = widget.project.name ?? "";
    final String summary = widget.project.summary ?? "";
    final String icon = widget.project.icon ?? "";
    final theme = Theme.of(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (val) => setState(() {
        hovered = true;
      }),
      onExit: (event) => setState(() {
        hovered = false;
      }),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        openElevation: 0,
        closedElevation: 0,
        openShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        transitionDuration: Duration(milliseconds: 1000),
        openColor: Colors.transparent,
        middleColor: Colors.transparent,
        closedColor: Colors.transparent,
        openBuilder: (context, action) => ProjectDialog(
          project: widget.project,
        ),
        closedBuilder: (context, open) => Card(
          elevation: 3,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 150),
            decoration: BoxDecoration(
              color: hovered
                  ? Colors.black12.withOpacity(.05)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      name,
                      style: theme.textTheme.headlineMedium,
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
                  const Spacer(),
                  Material(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        icon,
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      summary,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<ProjectModel> projects = [
  //* BelayTrader
  ProjectModel(
      name: 'BelayTrader',
      summary: 'A platform for rock climbers looking for climbing'
          ' partners.',
      icon: 'assets/belayTrader.png',
      description:
          'BelayTrader is a social network for rock climbers. Climbers create a profile and include there preferences and statistics.'
          ' They can filter other users based on these criteria and find the perfect climbing partner.'
          ' Climbers can leave reviews on other climbers to keep each other safe and accountable.'
          ' Eager Climbers can create posts letting locals know they are looking for a partner.'
          ' Climbers can create meet up groups and find friends in the comfort ans safety of a group setting',
      images: [
        'assets/belaytrader_mockup.png'
      ],
      features: [
        '• Integrated Messaging',
        '• Friend System',
        '• Push Notifications',
        '• Firebase Backend',
        '• Dynamic Link App Sharing'
      ])
];

List<ProjectCard> projectCards = projects
    .map((project) => ProjectCard(
          project: project,
        ))
    .toList();

// [
//   const ProjectCard(
//       title: 'BelayTrader',
//       description: 'A platform for rock climbers looking for climbing'
//           ' partners.',
//       image: 'assets/belayTrader.png'),
//   const ProjectCard(
//       title: 'Eqalink',
//       description:
//           'A social network centered around privacy that gives control to you. ',
//       image: 'assets/eqalink_logo.png'),
//   const ProjectCard(
//       title: 'ABC Climbing',
//       description:
//           'An app that provides accessile cirriculum for the Olympic Youth Climbing Program at ABC Kids Climbing in Boulder CO. This app also functions as an oboarding tool for training coaches and instructors.',
//       image: 'assets/abc_climbing.png'),
//   const ProjectCard(
//       title: 'Kokoro Academy',
//       description:
//           'A platfrom for the members of Kokoro Academy, A Jui Jitsu Studio in Springfield MO. Members can share notifications, view class schedule, exclusive video content and more.',
//       image: 'assets/kokoro_logo.png'),
//   const ProjectCard(
//       title: 'Training Log',
//       description:
//           'An hassle free way to record, categorize, and view your training session. Fully customizeable for any sport.',
//       image: 'assets/training_log_logo.png'),
//   const ProjectCard(
//       title: 'Potlucky',
//       description:
//           'Organize potlucks, group dinner, or food for any event. Integrated recipie book allows you to share your favorites and always have the recipies of any event you have been to. ',
//       image: 'assets/potlucky_logo.png'),
// ];
