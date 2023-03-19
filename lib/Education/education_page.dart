import 'package:flutter/material.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/kickapoo.png',
                  height: 200,
                ),
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/otc.png',
                    height: 200,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      EnhanceStep(
        icon: Icon(Icons.school),
        title: Text(
          "Bachelor Degree",
          style: theme.textTheme.headlineSmall,
        ),
        subtitle: Text(
          "2015 - 2018",
        ),
        content: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Bachelor of Science',
                        style: theme.textTheme.headlineSmall!
                            .copyWith(color: Colors.black38),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'in',
                          style: theme.textTheme.bodyMedium!
                              .copyWith(color: Colors.black38),
                        ),
                      ),
                      Text(
                        'Recreation, Sport, & Park Administration',
                        style: theme.textTheme.headlineMedium!,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'from',
                          style: theme.textTheme.bodyMedium!
                              .copyWith(color: Colors.black38),
                        ),
                      ),
                      Text(
                        'Missouri State University',
                        style: theme.textTheme.headlineSmall!
                            .copyWith(color: Colors.black38),
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
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/missouri_state.png',
                    // height: 200,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      EnhanceStep(
        icon: FaIcon(FontAwesomeIcons.code),
        title: Text(
          "Software Development",
          style: theme.textTheme.headlineSmall,
        ),
        subtitle: Text(
          "2020 - Now",
        ),
        content: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Self Taught',
                  style: theme.textTheme.headlineMedium!,
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
                  'I began by learning Swift and Swift UI to develope mobile applications for iOS and MacOS. Then turned my focus to Java and Kotlin for Android apps. After that I dove into web development with HTML, CSS, and JavaScript. I was eager to begin developing some of my ideas but though it was very time consuming to develope for all thses platforms at once. Which led me to dabble in React and React Native. Once I got comfortable there I stumbled upon Flutter and have been completly in love with it every since.',
                  maxLines: null,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
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

class MobileEducationPage extends StatefulWidget {
  const MobileEducationPage({super.key});

  @override
  State<MobileEducationPage> createState() => _MobileEducationPageState();
}

class _MobileEducationPageState extends State<MobileEducationPage> {
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
            mainAxisAlignment: MainAxisAlignment.center,
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
                  Image.asset(
                    'assets/kickapoo.png',
                    height: 150,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      EnhanceStep(
        icon: Icon(Icons.school),
        title: Text(
          "Associate's Degree",
          style: theme.textTheme.headlineSmall,
        ),
        subtitle: Text(
          "2013 - 2015",
        ),
        content: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ozarks Technical',
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    'Community College',
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
                  Text(
                    'Springfield, MO',
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/otc.png',
                        height: 150,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      EnhanceStep(
        icon: Icon(Icons.school),
        title: Text(
          "Bachelor's Degree",
          style: theme.textTheme.headlineSmall,
        ),
        subtitle: Text(
          "2015 - 2018",
        ),
        content: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/missouri_state.png',
                      height: 100,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Bachelor of Science',
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: Colors.black38, fontSize: 20),
                      ),
                    ),
                    Text(
                      'in',
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.black38),
                    ),
                    Text(
                      'Recreation, Sport,',
                      style: theme.textTheme.headlineSmall!,
                    ),
                    Text(
                      '& Park Administration',
                      style: theme.textTheme.headlineSmall!,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      EnhanceStep(
        icon: FaIcon(FontAwesomeIcons.code),
        title: Text(
          "Software Development",
          style: theme.textTheme.headlineSmall,
        ),
        subtitle: Text(
          "2020 - Now",
        ),
        content: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Self Taught',
                  style: theme.textTheme.headlineMedium!,
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
                  'I began by learning Swift and Swift UI to develope mobile applications for iOS and MacOS. Then turned my focus to Java and Kotlin for Android apps. After that I dove into web development with HTML, CSS, and JavaScript. I was eager to begin developing some of my ideas but it was very time consuming to develope for all thses platforms at once. Which led me to dabble in React and React Native. Once I got comfortable there I stumbled upon Flutter and have been completly in love with it every since.',
                  maxLines: null,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      )
    ];

    return ListView(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.center,
              "Education",
              style: theme.textTheme.headlineMedium,
            ),
          ),
        ),
        Divider(
          indent: 100,
          endIndent: 100,
          thickness: 3,
          color: theme.colorScheme.primary,
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
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return const Row(
                children: [],
              );
            })
      ],
    );
  }
}
