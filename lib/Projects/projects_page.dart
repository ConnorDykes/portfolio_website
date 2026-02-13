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
    required this.project,
  });

  final ProjectModel project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hovered = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final String? icon = widget.project.icon;
    if (icon != null) {
      precacheImage(AssetImage(icon), context);
    }
  }

  Widget _fadedAssetImage(
    String asset, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) {
    return Image.asset(
      asset,
      width: width,
      height: height,
      fit: fit,
      filterQuality: FilterQuality.medium,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          child: child,
        );
      },
      errorBuilder: (context, error, stack) {
        debugPrint('Image.asset failed to load: $asset');
        return Container(
          color: Colors.black12,
          alignment: Alignment.center,
          child: Text(
            'Missing asset\n$asset',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        );
      },
    );
  }

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
          transitionDuration: const Duration(milliseconds: 600),
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
              duration: const Duration(milliseconds: 150),
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
                        child: _fadedAssetImage(
                          icon,
                          height: 150,
                          width: 150,
                          fit: BoxFit.contain,
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
  //* VSBL
  ProjectModel(
      name: 'VSBL',
      summary: 'Operations visibility and team execution platform',
      icon: 'assets/vsbl/icon.png',
      description:
          'VSBL helps teams stay aligned with a feature-rich mobile experience for day-to-day operations.'
          ' It includes home screen workflows, team feed communication, checklists and tasks, shift tools, reporting, rewards, waste tracking, and setup management.'
          ' This project entry uses screenshots from the VSBL features page at vsblapp.com.',
      images: [
        'assets/vsbl/screen1.png',
        'assets/vsbl/screen2.png',
        'assets/vsbl/screen3.png',
        'assets/vsbl/screen4.png',
        'assets/vsbl/screen5.png',
        'assets/vsbl/screen6.png',
        'assets/vsbl/screen7.png',
        'assets/vsbl/screen8.png',
      ],
      platforms: [
        Platforms.iOS,
        Platforms.android,
        Platforms.web,
      ],
      iOSLink: null,
      androidLink: null,
      webLink: 'https://vsblapp.com'),

  //* SIX
  ProjectModel(
      name: 'SIX',
      summary: 'Achieve Radical Fulfillment',
      icon: 'assets/six/icon.png',
      description:
          'Track your emotional fitness. Find Key Moments through your day and discover what brings you value.'
          ' Build for all mobile devices including Wear OS and Apple Watch.'
          ' Leverage powerful ai algorithms to gain insight into your life.'
          ' Follow friends and connect over well being.',
      images: [
        'assets/six/screen1.png',
        'assets/six/screen2.png',
        'assets/six/screen3.png',
        'assets/six/screen4.png',
        'assets/six/screen5.png',
        'assets/six/screen6.png',
        'assets/six/screen7.png',
      ],
      platforms: [
        Platforms.iOS,
        Platforms.android,
      ],
      iOSLink:
          'https://apps.apple.com/us/app/six-an-emotional-fitness-app/id6449885349',
      androidLink:
          'https://play.google.com/store/apps/details?id=com.immersionneuro.six'),

  //* Fantasy Climbing
  ProjectModel(
      name: 'Fantasy Climbing',
      summary: 'Fantasy Sports for Competition Sport Climbing',
      icon: 'assets/fantasy_climbing/app_icon.png',
      description:
          'Fantasy Climbing is the only fantasy sports app for real competition  Sport Climbing.'
          ' Create a League, Draft a team of real professional climbers, and watch as you earn real points based on their performance.',
      images: [
        'assets/fantasy_climbing/fantasyClimbing1.png',
        'assets/fantasy_climbing/fantasyClimbing2.png',
        'assets/fantasy_climbing/fantasyClimbing3.png',
        'assets/fantasy_climbing/fantasyClimbing4.png',
        'assets/fantasy_climbing/fantasyClimbing5.png',
      ],
      platforms: [
        Platforms.iOS,
        Platforms.android,
      ],
      iOSLink: '',
      androidLink: ''),

  //* MTA
  ProjectModel(
      name: 'MY MTA',
      summary:
          'The official app for public transportation services in New York City ',
      icon: 'assets/mta/logo.png',
      description:
          'This is the official app for all transportation in the city of New York.'
          ' Create custom trips with step by step maps and instructions.'
          ' See live vehicles and get notified when your vehicles or cars are arriving.',
      images: [
        'assets/mta/mta1.png',
        'assets/mta/mta2.png',
        'assets/mta/mta3.png',
        'assets/mta/mta4.png',
        'assets/mta/mta5.png',
        'assets/mta/mta6.png',
        'assets/mta/mta7.png',
      ],
      platforms: [
        Platforms.iOS,
        Platforms.android,
      ],
      iOSLink: '',
      androidLink: ''),

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
      platforms: [
        Platforms.iOS,
        Platforms.android,
      ],
      iOSLink: 'https://apps.apple.com/us/app/belaytrader/id1604032228',
      androidLink:
          'https://play.google.com/store/apps/details?id=com.BelayTrader'),

  //* The Stack
  ProjectModel(
    name: 'The Stack Marketplace',
    summary: 'A complete one of a kind market place for all trading card games',
    icon: 'assets/the_stack/logo.png',
    description:
        'Buy, sell, and trade all your trading card games in one place. this app features an expansive Postgres database with complex relationships and queries. It has a robust backend server written in Deno for a variety of services. It features intricate integrations with STIPE for payment processs and payouts as well as complete shipment tracking with the USPS. Visit The Stack Marketplace at https://thestackmarketplace.com',
    images: [
      'assets/the_stack/screen1.png',
      'assets/the_stack/screen2.png',
      'assets/the_stack/screen3.png',
      'assets/the_stack/screen4.png',
    ],
    platforms: [Platforms.iOS, Platforms.android, Platforms.web],
    iOSLink: null,
    androidLink: null,
    webLink: 'https://thestackmarketplace.com',
  ),
  //* Longs Peak Parts
  ProjectModel(
    name: 'Longs Peak Parts',
    summary:
        'An internal tool for fast and accurate part recommendations off junked vehicles',
    icon: 'assets/longs_peak_parts/icon.png',
    description:
        'This app was developed for the company Longs Peak Parts. It is an internal tool for fast and accurate part recommendations off junked vehicles. Employees can quickly scan a vehicles vin code to get a match and show high prices parts on that vehicle. This app also includes advances Ebay api integration that interface with the Longs peak parts website. ',
    images: [
      'assets/longs_peak_parts/screen1.png',
      'assets/longs_peak_parts/screen2.png',
      'assets/longs_peak_parts/screen3.png',
    ],
    platforms: [Platforms.iOS, Platforms.android, Platforms.web],
    iOSLink: null,
    androidLink: null,
    webLink: 'https://thestackmarketplace.com',
  ),

  //* SendTrain
  ProjectModel(
    name: 'SendTrain',
    summary: 'AI driven training plans for rock climbers',
    icon: 'assets/sendtrain/icon.png',
    description:
        'Get a once of training plan for your next climbing session. SendTrain uses AI to generate a training plan based on your goals and experience level. Then tracks an reminds you about your works. If you miss a workout, your personalized AI coach can adjust your schedule to get you back on track.  ',
    images: [
      'assets/sendtrain/screen1.png',
      'assets/sendtrain/screen2.png',
      'assets/sendtrain/screen3.png',
      'assets/sendtrain/screen4.png',
    ],
    platforms: [Platforms.iOS, Platforms.android, Platforms.web],
    iOSLink: null,
    androidLink: null,
    webLink: 'https://thestackmarketplace.com',
  ),

  //* Bitmo
  ProjectModel(
    name: 'Bitmo',
    summary: 'Peer to Peer Bitcoin transfer powered by the lightning network',
    icon: 'assets/bitmo/icon.png',
    description: 'instantly send bitcoin to your peers.',
    images: [
      'assets/bitmo/screen1.png',
      'assets/bitmo/screen2.png',
      'assets/bitmo/screen3.png',
      'assets/bitmo/screen4.png',
      'assets/bitmo/screen5.png',
    ],
    platforms: [Platforms.iOS, Platforms.android],
    iOSLink: null,
    androidLink: null,
  ),

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
      platforms: [Platforms.iOS, Platforms.android, Platforms.web],
      iOSLink: 'https://apps.apple.com/us/app/eqalink/id6444545803',
      androidLink: null,
      webLink: 'https://eqalink.com/#/'),

  //* SimpleCart
  ProjectModel(
    name: 'SimpleCart',
    summary: 'Grocery shopping made easy ',
    icon: 'assets/simple_cart/icon.png',
    description:
        'Make recipes, plan your meals and have all the ingredients instantly added to your cart.'
        ' Have all your items delivered right to your door with Walmart deliver.',
    images: [
      'assets/simple_cart/screen1.png',
      'assets/simple_cart/screen2.png',
      'assets/simple_cart/screen3.png',
      'assets/simple_cart/screen4.png',
    ],
    platforms: [
      Platforms.iOS,
      Platforms.android,
    ],
    iOSLink: null,
    androidLink: null,
  ),

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
      platforms: [
        Platforms.iOS,
        Platforms.android,
      ],
      iOSLink: 'https://apps.apple.com/us/app/abc-climbing/id1616366631',
      androidLink:
          'https://play.google.com/store/apps/details?id=com.abc_climbing'),

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
    platforms: [
      Platforms.iOS,
      Platforms.android,
    ],
    iOSLink: null,
    androidLink: null,
  ),

  //* Scry
  ProjectModel(
    name: 'Scry',
    summary: 'Trade magic card and organize games',
    icon: 'assets/scry/icon.png',
    description:
        'Trade Magic the Gathering cards with real people. Organize games with real players',
    images: [
      'assets/scry/screen1.png',
      'assets/scry/screen2.png',
      'assets/scry/screen3.png',
      'assets/scry/screen4.png',
      'assets/scry/screen5.png',
    ],
    platforms: [
      Platforms.iOS,
      Platforms.android,
    ],
    iOSLink: null,
    androidLink: null,
  ),

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
      platforms: [
        Platforms.iOS,
        Platforms.android,
      ],
      iOSLink: 'https://apps.apple.com/us/app/potlucky/id1614754298',
      androidLink:
          'https://play.google.com/store/apps/details?id=com.food_with_friends'),

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
      platforms: [
        Platforms.iOS,
        Platforms.android,
      ],
      iOSLink: null,
      androidLink: null),
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
