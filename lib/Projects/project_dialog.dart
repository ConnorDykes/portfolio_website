import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/Homepage/what_I_do.dart';
import 'package:portfolio_website/Projects/project_modle.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDialog extends StatefulWidget {
  const ProjectDialog({
    super.key,
    required this.project,
  });

  final ProjectModel project;

  @override
  State<ProjectDialog> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProjectDialog> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ProjectModel project = widget.project;
    final List<String> assetsToCache = [
      if (project.icon != null) project.icon!,
      ...?project.images,
    ];
    for (final String assetPath in assetsToCache) {
      precacheImage(AssetImage(assetPath), context);
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
    final theme = Theme.of(context);
    final ProjectModel project = widget.project;

    final platformButtons = [
      //* if platform is iOS
      if (project.platforms!.contains(Platforms.iOS))
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: 3,
          child: InkWell(
            onTap: project.iOSLink == null
                ? null
                : () async {
                    final uri = Uri.parse(project.iOSLink ?? '');
                    if (!await launchUrl(uri)) {
                      throw Exception('Could not launch $uri');
                    }
                  },
            child: const SizedBox(
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
      if (project.platforms!.contains(Platforms.android))
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: 3,
          child: InkWell(
            onTap: project.androidLink == null
                ? null
                : () async {
                    final uri = Uri.parse(project.androidLink ?? '');
                    if (!await launchUrl(uri)) {
                      throw Exception('Could not launch $uri');
                    }
                  },
            child: const SizedBox(
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
      if (project.platforms!.contains(Platforms.web))
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: 3,
          child: InkWell(
            onTap: project.webLink == null
                ? null
                : () async {
                    final uri = Uri.parse(project.webLink ?? '');
                    if (!await launchUrl(uri)) {
                      throw Exception('Could not launch $uri');
                    }
                  },
            child: const SizedBox(
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

    // Removed unused desktop row layout remnants

    final columnChildren = [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
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
          constraints: const BoxConstraints(maxWidth: 700),
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
      const Padding(padding: EdgeInsets.all(16))
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
                child: const Icon(Icons.close)),
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
                  child: _fadedAssetImage(
                    project.icon ?? '',
                    height: 150,
                    width: 150,
                    fit: BoxFit.contain,
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
                trackColor: Colors.transparent,
                radius: const Radius.circular(15),
                trackRadius: const Radius.circular(15),
                thumbVisibility: true,
                trackVisibility: false,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    cacheExtent: 2000,
                    children: [
                      ...project.images?.map(
                            (image) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: OpenContainer(
                                closedColor: Colors.transparent,
                                openColor: Colors.black,
                                closedShape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                                transitionType:
                                    ContainerTransitionType.fadeThrough,
                                openBuilder: (context, action) => Container(
                                  color: Colors.black,
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: _fadedAssetImage(
                                          image,
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
                                            child: const Icon(Icons.close)),
                                      ),
                                    ],
                                  ),
                                ),
                                closedBuilder: (context, action) => MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: _fadedAssetImage(
                                    image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ) ??
                          [const Text('no image')]
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
