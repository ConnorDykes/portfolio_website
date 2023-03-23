import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/Projects/project_dialog.dart';
import 'package:portfolio_website/Projects/project_modle.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Projects',
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
          Flexible(
            child: GridView.count(
              shrinkWrap: true,
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
    final theme = Theme.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(shrinkWrap: true, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Projects',
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
        ...projectCards
      ]),
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: MouseRegion(
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
          transitionDuration: Duration(milliseconds: 600),
          openColor: Colors.transparent,
          middleColor: Colors.transparent,
          closedColor: Colors.transparent,
          openBuilder: (context, action) => ProjectDialog(
            project: widget.project,
          ),
          closedBuilder: (context, open) => Card(
            elevation: 3,
            child: AnimatedContainer(
              height: 350,
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
        'assets/belaytrader_mockup.png',
        'assets/belaytrader1.png',
        'assets/belaytrader2.png',
        'assets/belaytrader3.png',
        'assets/belaytrader4.png',
        'assets/belaytrader5.png',
      ],
      platfroms: [
        Platforms.iOS,
        Platforms.android,
      ]),

  //* Eqalink
  ProjectModel(
      name: 'Eqalink',
      summary: 'Social Media that puts the control back in your hands.',
      icon: 'assets/eqalink_logo.png',
      description:
          'Eqalink is is a Social Network that puts the control back in your hands.'
          ' Control what you see and who your interact with using advanced settings.'
          ' Create Groups with shared interests and get exclusive content.'
          ' Share photos, videos , group conversations, and more',
      images: [
        'assets/eqalink/screenshot1.jpeg',
        'assets/eqalink/screenshot2.jpeg',
        'assets/eqalink/screenshot3.jpeg',
        'assets/eqalink/screenshot4.jpeg',
        'assets/eqalink/screenshot5.jpeg',
        'assets/eqalink/screenshot6.jpeg',
      ],
      platfroms: [
        Platforms.iOS,
        Platforms.android,
        Platforms.web
      ]),

  //* ABC Climbing
  ProjectModel(
      name: 'ABC Climbing',
      summary:
          'An app that provides accessible curriculum for the Olympic Youth Climbing Program at ABC Kids Climbing in Boulder CO.',
      icon: 'assets/abc_climbing.png',
      description: 'Coaches and Athletes can access their daily curriculum.'
          ' They can add new workouts and remove bad ones.'
          ' Climbers can sort byt activity or by which zone of the gym they are in.'
          " Detailed instructions and how to's",
      images: [
        'assets/abc_climbing/mockup.png',
        'assets/abc_climbing/screenshot1.jpeg',
        'assets/abc_climbing/screenshot2.jpeg',
        'assets/abc_climbing/screenshot3.jpeg',
      ],
      platfroms: [
        Platforms.iOS,
        Platforms.android,
      ]),

  //* Kokoro Academy
  ProjectModel(
      name: 'Kokoro Academy',
      summary:
          'A platfrom for the members of Kokoro Academy, A Jui Jitsu Studio in Springfield MO. ',
      icon: 'assets/kokoro_logo.png',
      description:
          'Members can stay up-to-date on whats happening in the gym from convenience of their phones.'
          ' Any new updates come in as a notification so members get it the minute its public.'
          ' Access to exclusive video content and lessons.'
          ' Shop for merch, view up coming classes, and book lessons, all from one location.'
          ' Also features a robust admin panel',
      images: [
        'assets/kokoro_academy/mockup.png',
        'assets/kokoro_academy/screenshot1.png',
        'assets/kokoro_academy/screenshot2.png',
        'assets/kokoro_academy/screenshot3.png',
      ],
      platfroms: [
        Platforms.iOS,
        Platforms.android,
      ]),

  //* PotLucky
  ProjectModel(
      name: 'Potlucky',
      summary: 'Organize potlucks, group dinner, or food for any event.',
      icon: 'assets/potlucky_logo.png',
      description:
          'Integrated recipe book allows you to share your favorites and always have the recipes of any event you have been to.'
          ' Share recipes, get ingredients, and always know whats for dinner'
          ' Keep track of who is bring what to the event, assign dishes or request a menu of recipe they people can choose from'
          ' never forget a dish, ans always have access to the recipes from past events'
          ' Dietary restriction friendly',
      images: [
        'assets/potlucky/mockup.png',
        'assets/potlucky/screenshot1.png',
        'assets/potlucky/screenshot2.png',
        'assets/potlucky/screenshot3.png',
        'assets/potlucky/screenshot4.png',
        'assets/potlucky/screenshot5.png',
      ],
      platfroms: [
        Platforms.iOS,
        Platforms.android,
      ]),

  //* TrainingLog
  ProjectModel(
      name: 'Training Log',
      summary:
          'An hassle free way to record, categorize, and view your training session. Fully customizable for any sport.',
      icon: 'assets/training_log_logo.png',
      description:
          'Track your training sessions with a convenient calender view'
          ' Customizable for any sport'
          ' Color coded sessions types for easy tracking',
      images: [
        'assets/training_log.png',
      ],
      platfroms: [
        Platforms.iOS,
        Platforms.android,
      ]),
];

List<ProjectCard> projectCards = projects
    .map((project) => ProjectCard(
          project: project,
        ))
    .toList();

// [
//  
//  
//   
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
