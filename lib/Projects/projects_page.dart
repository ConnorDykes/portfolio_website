import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              children: projects,
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
    return const Placeholder();
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard(
      {super.key,
      required String this.title,
      required String this.description,
      required String this.image});

  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: Colors.white,
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium,
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
          Material(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                height: 200,
                width: 200,
              ),
            ),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

List<ProjectCard> projects = [
  ProjectCard(
      title: 'BelayTrader',
      description: 'A social platform for rock climbers looking for climbing'
          ' partners.',
      image: 'belayTrader.png'),
  ProjectCard(
      title: 'BelayTrader',
      description: 'A social platform for rock climbers looking for climbing'
          ' partners.',
      image: 'belayTrader.png'),
  ProjectCard(
      title: 'BelayTrader',
      description: 'A social platform for rock climbers looking for climbing'
          ' partners.',
      image: 'belayTrader.png'),
  ProjectCard(
      title: 'BelayTrader',
      description: 'A social platform for rock climbers looking for climbing'
          ' partners.',
      image: 'belayTrader.png'),
  ProjectCard(
      title: 'BelayTrader',
      description: 'A social platform for rock climbers looking for climbing'
          ' partners.',
      image: 'belayTrader.png'),
];
