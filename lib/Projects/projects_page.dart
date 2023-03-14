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
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
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
    return GridView.count(
      padding: const EdgeInsets.all(16),
      mainAxisSpacing: 3,
      crossAxisSpacing: 3,
      crossAxisCount: 1,
      children: projects,
    );
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
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Compiling....'),
                    content: Text(
                        "Come back soon for more details, media, and demos "),
                  ));
        },
        child: Column(
          children: [
            const Spacer(),
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
            const Spacer(),
            Material(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  image,
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

List<ProjectCard> projects = [
  const ProjectCard(
      title: 'BelayTrader',
      description: 'A platform for rock climbers looking for climbing'
          ' partners.',
      image: 'assets/belayTrader.png'),
  const ProjectCard(
      title: 'Eqalink',
      description:
          'A social network centered around privacy that gives control to you. '
          ' partners.',
      image: 'assets/eqalink_logo.png'),
  const ProjectCard(
      title: 'ABC Climbing',
      description:
          'An app that provides accessile cirriculum for the Olympic Youth Climbing Program at ABC Kids Climbing in Boulder CO. This app also functions as an oboarding tool for training coaches and instructors.',
      image: 'assets/abc_climbing.png'),
  const ProjectCard(
      title: 'Kokoro Academy',
      description:
          'A platfrom for the members of Kokoro Academy, A Jui Jitsu Studio in Springfield MO. Members can share notifications, view class schedule, exclusive video content and more.',
      image: 'assets/kokoro_logo.png'),
  const ProjectCard(
      title: 'Training Log',
      description:
          'An hassle free way to record, categorize, and view your training session. Fully customizeable for any sport.',
      image: 'assets/training_log_logo.png'),
  const ProjectCard(
      title: 'Potlucky',
      description:
          'Organize potlucks, group dinner, or food for any event. Integrated recipie book allows you to share your favorites and always have the recipies of any event you have been to. ',
      image: 'assets/potlucky_logo.png'),
];
