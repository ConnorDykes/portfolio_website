/// Shared content data for all portfolio designs.
/// All personal information, projects, work, education, and skills
/// consolidated in one place for easy reuse across designs.

import 'package:portfolio_website/Projects/project_modle.dart';

// ─── Personal Info ───────────────────────────────────────────────────────────

class PortfolioData {
  static const String name = 'Connor Dykes';
  static const String title = 'Fullstack Flutter Developer';
  static const String shortTitle = 'Flutter Developer';
  static const String location = 'Longmont, Colorado';
  static const String email = 'connormdykes@gmail.com';
  static const String phone = '4178611985';
  static const String phoneFormatted = '(417) 861-1985';
  static const String githubUrl = 'https://github.com/ConnorDykes';
  static const String githubHandle = 'ConnorDykes';
  static const String resumePath = 'assets/Connor Dykes - Resume.pdf';
  static const String profilePhoto = 'assets/profile_photo.png';

  static const String heroTagline = 'I am a Fullstack Flutter Developer.';
  static const String heroSubtitle = 'I build apps, like this website!';

  static const String aboutParagraph1 =
      'I am a driven self taught Fullstack Flutter Developer. I make apps for iOS, Android, Web, Windows, Mac & Linux. I love turning ideas into interactive experiences. I have worked at several start ups as well as developed apps for personal and professional use.';

  static const String aboutParagraph2 =
      'I live in Longmont Colorado with my wife, daughter, two dogs, and three cats. In my free time I explore the mountains as a rock climber. I am a nerd at heart. You can catch me playing Dungeons and Dragons or Magic The Gathering.';

  static const String selfTaughtStory =
      'I began by learning Swift and SwiftUI to develop mobile applications for iOS and macOS. Then turned my focus to Java and Kotlin for Android apps. After that I dove into web development with HTML, CSS, and JavaScript. I was eager to begin developing some of my ideas but it was very time consuming to develop for all these platforms at once. Which led me to dabble in React and React Native. Once I got comfortable there I stumbled upon Flutter and have been completely in love with it ever since.';

  // ─── Skills ──────────────────────────────────────────────────────────────

  static const List<SkillItem> platforms = [
    SkillItem(name: 'Flutter', assetIcon: null, isFlutterLogo: true),
    SkillItem(name: 'Firebase', assetIcon: 'assets/firebase.png'),
    SkillItem(name: 'iOS, WatchOS, & macOS', assetIcon: null, faIcon: 'apple'),
    SkillItem(
        name: 'Android & Wear OS', assetIcon: null, faIcon: 'android'),
    SkillItem(
        name: 'Windows & Desktop', assetIcon: null, faIcon: 'windows'),
    SkillItem(name: 'Web', assetIcon: null, faIcon: 'code'),
  ];

  static const List<SkillItem> languages = [
    SkillItem(name: 'Dart', assetIcon: 'assets/dart.png'),
    SkillItem(name: 'Kotlin', assetIcon: 'assets/kotlin.png'),
    SkillItem(name: 'Swift', assetIcon: 'assets/swift.png'),
    SkillItem(name: 'HTML 5', assetIcon: null, faIcon: 'html5'),
    SkillItem(name: 'CSS 3', assetIcon: null, faIcon: 'css3'),
    SkillItem(name: 'JavaScript', assetIcon: null, faIcon: 'js'),
  ];

  // ─── Work Experience ─────────────────────────────────────────────────────

  static const List<WorkItem> softwareJobs = [
    WorkItem(
      title: 'Senior Flutter Developer',
      company: 'goTenna',
      dates: 'September 2025 - Present',
      image: 'assets/gotenna_icon.png',
    ),
    WorkItem(
      title: 'Lead Mobile Developer',
      company: 'Immersion Neuroscience',
      dates: 'March 2024 - September 2025',
      image: 'assets/immersion.jpg',
    ),
    WorkItem(
      title: 'Flutter Developer',
      company: 'M Genio',
      dates: 'June 2023 - March 2024',
      image: 'assets/Mgenio.png',
    ),
    WorkItem(
      title: 'Flutter Developer',
      company: 'Eqalink',
      dates: 'November 2022 - June 2023',
      image: 'assets/eqalink_logo.png',
    ),
    WorkItem(
      title: 'Flutter Developer',
      company: 'ABC Kids Climbing',
      dates: 'July 2022 - August 2022',
      image: 'assets/abc_climbing.png',
    ),
    WorkItem(
      title: 'Flutter Developer',
      company: 'Kokoro Academy',
      dates: 'March 2022 - June 2022',
      image: 'assets/kokoro_logo.png',
    ),
    WorkItem(
      title: 'Flutter Developer',
      company: 'BelayTrader',
      dates: 'Nov 2021 - March 2022',
      image: 'assets/belayTrader.png',
    ),
  ];

  static const List<WorkItem> otherJobs = [
    WorkItem(
      title: 'Manager',
      company: 'Dynamic Earth Equipment',
      dates: '2014 - April 2016',
      image: 'assets/dynamic_earth.png',
    ),
    WorkItem(
      title: 'Youth Programs Manager',
      company: 'Zenith Climbing Center',
      dates: 'April 2016 - August 2020',
      image: 'assets/zenith.png',
    ),
    WorkItem(
      title: 'General Manager',
      company: 'ABC Kids Climbing',
      dates: 'August 2022 - Now',
      image: 'assets/abc_climbing.png',
    ),
  ];

  // ─── Education ───────────────────────────────────────────────────────────

  static const List<EducationItem> education = [
    EducationItem(
      level: 'High School',
      school: 'Kickapoo High School',
      location: 'Springfield, MO',
      dates: '2009 - 2013',
      image: 'assets/kickapoo.png',
    ),
    EducationItem(
      level: "Associate's Degree",
      school: 'Ozarks Technical Community College',
      location: 'Springfield, MO',
      dates: '2013 - 2015',
      image: 'assets/otc.png',
    ),
    EducationItem(
      level: "Bachelor's Degree",
      school: 'Missouri State University',
      location: 'Springfield, MO',
      dates: '2015 - 2018',
      degree: 'Bachelor of Science in Recreation, Sport, & Park Administration',
      image: 'assets/missouri_state.png',
    ),
    EducationItem(
      level: 'Software Development',
      school: 'Self Taught',
      location: '',
      dates: '2020 - Now',
      isSelfTaught: true,
    ),
  ];

  // ─── Projects ────────────────────────────────────────────────────────────

  static final List<ProjectModel> projects = [
    ProjectModel(
      name: 'VSBL',
      summary: 'Operations visibility and team execution platform',
      icon: 'assets/vsbl/icon.png',
      description:
          'VSBL helps teams stay aligned with a feature-rich mobile experience for day-to-day operations. It includes home screen workflows, team feed communication, checklists and tasks, shift tools, reporting, rewards, waste tracking, and setup management.',
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
      platforms: [Platforms.iOS, Platforms.android, Platforms.web],
      webLink: 'https://vsblapp.com',
    ),
    ProjectModel(
      name: 'SIX',
      summary: 'Achieve Radical Fulfillment',
      icon: 'assets/six/icon.png',
      description:
          'Track your emotional fitness. Find Key Moments through your day and discover what brings you value. Built for all mobile devices including Wear OS and Apple Watch. Leverage powerful AI algorithms to gain insight into your life.',
      images: [
        'assets/six/screen1.png',
        'assets/six/screen2.png',
        'assets/six/screen3.png',
        'assets/six/screen4.png',
        'assets/six/screen5.png',
        'assets/six/screen6.png',
        'assets/six/screen7.png',
      ],
      platforms: [Platforms.iOS, Platforms.android],
      iOSLink:
          'https://apps.apple.com/us/app/six-an-emotional-fitness-app/id6449885349',
      androidLink:
          'https://play.google.com/store/apps/details?id=com.immersionneuro.six',
    ),
    ProjectModel(
      name: 'Fantasy Climbing',
      summary: 'Fantasy Sports for Competition Sport Climbing',
      icon: 'assets/fantasy_climbing/app_icon.png',
      description:
          'Fantasy Climbing is the only fantasy sports app for real competition Sport Climbing. Create a League, Draft a team of real professional climbers, and watch as you earn real points based on their performance.',
      images: [
        'assets/fantasy_climbing/fantasyClimbing1.png',
        'assets/fantasy_climbing/fantasyClimbing2.png',
        'assets/fantasy_climbing/fantasyClimbing3.png',
        'assets/fantasy_climbing/fantasyClimbing4.png',
        'assets/fantasy_climbing/fantasyClimbing5.png',
      ],
      platforms: [Platforms.iOS, Platforms.android],
    ),
    ProjectModel(
      name: 'MY MTA',
      summary:
          'The official app for public transportation services in New York City',
      icon: 'assets/mta/logo.png',
      description:
          'This is the official app for all transportation in the city of New York. Create custom trips with step by step maps and instructions. See live vehicles and get notified when your vehicles or cars are arriving.',
      images: [
        'assets/mta/mta1.png',
        'assets/mta/mta2.png',
        'assets/mta/mta3.png',
        'assets/mta/mta4.png',
        'assets/mta/mta5.png',
        'assets/mta/mta6.png',
        'assets/mta/mta7.png',
      ],
      platforms: [Platforms.iOS, Platforms.android],
    ),
    ProjectModel(
      name: 'BelayTrader',
      summary: 'A platform for rock climbers looking for climbing partners.',
      icon: 'assets/belayTrader.png',
      description:
          'BelayTrader is a social network for rock climbers. Climbers create a profile and include their preferences and statistics. They can filter other users based on these criteria and find the perfect climbing partner.',
      images: [
        'assets/belaytrader_mockup.png',
        'assets/belaytrader1.png',
        'assets/belaytrader2.png',
        'assets/belaytrader3.png',
        'assets/belaytrader4.png',
        'assets/belaytrader5.png',
      ],
      platforms: [Platforms.iOS, Platforms.android],
      iOSLink: 'https://apps.apple.com/us/app/belaytrader/id1604032228',
      androidLink:
          'https://play.google.com/store/apps/details?id=com.BelayTrader',
    ),
    ProjectModel(
      name: 'The Stack Marketplace',
      summary:
          'A complete one of a kind marketplace for all trading card games',
      icon: 'assets/the_stack/logo.png',
      description:
          'Buy, sell, and trade all your trading card games in one place. Features an expansive Postgres database with complex relationships and queries, a robust Deno backend, Stripe payment processing, and USPS shipment tracking.',
      images: [
        'assets/the_stack/screen1.png',
        'assets/the_stack/screen2.png',
        'assets/the_stack/screen3.png',
        'assets/the_stack/screen4.png',
      ],
      platforms: [Platforms.iOS, Platforms.android, Platforms.web],
      webLink: 'https://thestackmarketplace.com',
    ),
    ProjectModel(
      name: 'Longs Peak Parts',
      summary:
          'An internal tool for fast and accurate part recommendations off junked vehicles',
      icon: 'assets/longs_peak_parts/icon.png',
      description:
          'Developed for Longs Peak Parts, this internal tool enables fast and accurate part recommendations off junked vehicles. Employees can quickly scan a vehicle VIN code to get a match and show high-priced parts. Features advanced eBay API integration.',
      images: [
        'assets/longs_peak_parts/screen1.png',
        'assets/longs_peak_parts/screen2.png',
        'assets/longs_peak_parts/screen3.png',
      ],
      platforms: [Platforms.iOS, Platforms.android, Platforms.web],
    ),
    ProjectModel(
      name: 'SendTrain',
      summary: 'AI driven training plans for rock climbers',
      icon: 'assets/sendtrain/icon.png',
      description:
          'Get a unique training plan for your next climbing session. SendTrain uses AI to generate a training plan based on your goals and experience level. Tracks and reminds you about your workouts with a personalized AI coach.',
      images: [
        'assets/sendtrain/screen1.png',
        'assets/sendtrain/screen2.png',
        'assets/sendtrain/screen3.png',
      ],
      platforms: [Platforms.iOS, Platforms.android, Platforms.web],
    ),
    ProjectModel(
      name: 'Bitmo',
      summary: 'Peer to Peer Bitcoin transfer powered by the lightning network',
      icon: 'assets/bitmo/icon.png',
      description: 'Instantly send bitcoin to your peers via the lightning network.',
      images: [
        'assets/bitmo/screen1.png',
        'assets/bitmo/screen2.png',
        'assets/bitmo/screen3.png',
        'assets/bitmo/screen4.png',
        'assets/bitmo/screen5.png',
      ],
      platforms: [Platforms.iOS, Platforms.android],
    ),
    ProjectModel(
      name: 'Eqalink',
      summary: 'Social Media that puts the control back in your hands.',
      icon: 'assets/eqalink_logo.png',
      description:
          'Eqalink is a Social Network that puts the control back in your hands. Control what you see and who you interact with using advanced settings. Create Groups, share photos, videos, group conversations, and more.',
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
      webLink: 'https://eqalink.com/#/',
    ),
    ProjectModel(
      name: 'SimpleCart',
      summary: 'Grocery shopping made easy',
      icon: 'assets/simple_cart/icon.png',
      description:
          'Make recipes, plan your meals and have all the ingredients instantly added to your cart. Have all your items delivered right to your door with Walmart delivery.',
      images: [
        'assets/simple_cart/screen1.png',
        'assets/simple_cart/screen2.png',
        'assets/simple_cart/screen3.png',
        'assets/simple_cart/screen4.png',
      ],
      platforms: [Platforms.iOS, Platforms.android],
    ),
    ProjectModel(
      name: 'ABC Climbing',
      summary:
          'Accessible curriculum for the Olympic Youth Climbing Program at ABC Kids Climbing.',
      icon: 'assets/abc_climbing.png',
      description:
          'Coaches and Athletes can access their daily curriculum. Add new workouts, sort by activity or gym zone, and access detailed instructions.',
      images: [
        'assets/abc_climbing/mockup.png',
        'assets/abc_climbing/screenshot1.jpeg',
        'assets/abc_climbing/screenshot2.jpeg',
        'assets/abc_climbing/screenshot3.jpeg',
      ],
      platforms: [Platforms.iOS, Platforms.android],
      iOSLink: 'https://apps.apple.com/us/app/abc-climbing/id1616366631',
      androidLink:
          'https://play.google.com/store/apps/details?id=com.abc_climbing',
    ),
    ProjectModel(
      name: 'Kokoro Academy',
      summary: 'A platform for the members of Kokoro Academy Jiu Jitsu Studio.',
      icon: 'assets/kokoro_logo.png',
      description:
          'Members can stay up-to-date on gym happenings, access exclusive video content and lessons, shop for merch, view upcoming classes, and book lessons. Features a robust admin panel.',
      images: [
        'assets/kokoro_academy/mockup.png',
        'assets/kokoro_academy/screenshot1.png',
        'assets/kokoro_academy/screenshot2.png',
        'assets/kokoro_academy/screenshot3.png',
      ],
      platforms: [Platforms.iOS, Platforms.android],
    ),
    ProjectModel(
      name: 'Scry',
      summary: 'Trade magic cards and organize games',
      icon: 'assets/scry/icon.png',
      description:
          'Trade Magic the Gathering cards with real people. Organize games with real players.',
      images: [
        'assets/scry/screen1.png',
        'assets/scry/screen2.png',
        'assets/scry/screen3.png',
        'assets/scry/screen4.png',
        'assets/scry/screen5.png',
      ],
      platforms: [Platforms.iOS, Platforms.android],
    ),
    ProjectModel(
      name: 'Potlucky',
      summary: 'Organize potlucks, group dinners, or food for any event.',
      icon: 'assets/potlucky_logo.png',
      description:
          'Integrated recipe book allows you to share favorites. Keep track of who is bringing what, assign dishes, and always have access to recipes from past events. Dietary restriction friendly.',
      images: [
        'assets/potlucky/mockup.png',
        'assets/potlucky/screenshot1.png',
        'assets/potlucky/screenshot2.png',
        'assets/potlucky/screenshot3.png',
        'assets/potlucky/screenshot4.png',
        'assets/potlucky/screenshot5.png',
      ],
      platforms: [Platforms.iOS, Platforms.android],
      iOSLink: 'https://apps.apple.com/us/app/potlucky/id1614754298',
      androidLink:
          'https://play.google.com/store/apps/details?id=com.food_with_friends',
    ),
    ProjectModel(
      name: 'Training Log',
      summary:
          'A hassle free way to record, categorize, and view your training sessions.',
      icon: 'assets/training_log_logo.png',
      description:
          'Track your training sessions with a convenient calendar view. Customizable for any sport. Color coded session types for easy tracking.',
      images: ['assets/training_log.png'],
      platforms: [Platforms.iOS, Platforms.android],
    ),
  ];

  static const int projectCount = 16;
  static const int yearsExperience = 4; // 2021 - present
  static const int appsBuilt = 16;
  static const int platformCount = 6;
}

// ─── Data Models ───────────────────────────────────────────────────────────

class SkillItem {
  final String name;
  final String? assetIcon;
  final String? faIcon;
  final bool isFlutterLogo;

  const SkillItem({
    required this.name,
    this.assetIcon,
    this.faIcon,
    this.isFlutterLogo = false,
  });
}

class WorkItem {
  final String title;
  final String company;
  final String dates;
  final String image;

  const WorkItem({
    required this.title,
    required this.company,
    required this.dates,
    required this.image,
  });
}

class EducationItem {
  final String level;
  final String school;
  final String location;
  final String dates;
  final String? degree;
  final String? image;
  final bool isSelfTaught;

  const EducationItem({
    required this.level,
    required this.school,
    required this.location,
    required this.dates,
    this.degree,
    this.image,
    this.isSelfTaught = false,
  });
}
