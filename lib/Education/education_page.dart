import 'package:flutter/material.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:portfolio_website/theme.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<EnhanceStep> steps = [
      EnhanceStep(
        icon: const Icon(Icons.school),
        title: Text(
          "High School",
          style: theme.textTheme.headlineSmall,
        ),
        subtitle: const Text(
          "2009 - 2013",
        ),
        content: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Kickapoo High School',
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
                  Text('Springfield, MO'),
                ],
              ),
              Image.asset(
                'Kickapoo.png',
                height: 200,
              )
            ],
          ),
        ),
      ),
      EnhanceStep(
        icon: Icon(Icons.school),
        title: Text(
          "Accociates Degree",
          style: theme.textTheme.headlineSmall,
        ),
        subtitle: Text(
          "2013 - 2015",
        ),
        content: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Ozarks Technical Community College',
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
                  Text('Springfield, MO'),
                ],
              ),
              Image.asset(
                'otc.png',
                height: 200,
              )
            ],
          ),
        ),
      ),
      EnhanceStep(
        icon: Icon(Icons.school),
        title: Text(
          "Bachelors Degree",
          style: theme.textTheme.headlineSmall,
        ),
        subtitle: Text(
          "2015 - 2018",
        ),
        content: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Missouri State University',
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
                  Text('Springfield, MO'),
                ],
              ),
              Image.asset(
                'missouri_state.png',
                height: 200,
              )
            ],
          ),
        ),
      )
    ];

    return Expanded(
      child: Row(
        children: [
          Flexible(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Education",
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
                EnhanceStepper(
                    stepIconSize: 30,
                    type: StepperType.vertical,
                    // horizontalTitlePosition: HorizontalTitlePosition.bottom,
                    // horizontalLinePosition: HorizontalLinePosition.top,
                    currentStep: _index,
                    physics: const ClampingScrollPhysics(),
                    steps: steps,
                    onStepTapped: (index) {
                      setState(() {
                        _index = index;
                      });
                    },
                    controlsBuilder:
                        (BuildContext context, ControlsDetails details) {
                      return const Row(
                        children: [],
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
