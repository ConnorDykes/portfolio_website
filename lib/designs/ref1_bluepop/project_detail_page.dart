import 'package:flutter/material.dart';
import 'package:portfolio_website/Projects/project_modle.dart';
import 'package:portfolio_website/designs/portfolio_data.dart';

import 'bluepop_app.dart';

class BluepopProjectDetailPage extends StatefulWidget {
  const BluepopProjectDetailPage({super.key, required this.project});
  final ProjectModel project;

  @override
  State<BluepopProjectDetailPage> createState() =>
      _BluepopProjectDetailPageState();
}

class _BluepopProjectDetailPageState extends State<BluepopProjectDetailPage> {
  late final PageController _pageController;
  int _page = 0;

  List<String> get _images => widget.project.images ?? const [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _jump(int page) {
    final target = page.clamp(0, _images.length - 1);
    _pageController.animateToPage(target,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < BP.mobileBreak;
    return Scaffold(
      backgroundColor: BP.paper,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(mobile),
            _body(mobile),
            _gallery(mobile),
            _footerStrip(mobile),
          ],
        ),
      ),
    );
  }

  Widget _constrained(Widget child, bool mobile) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: BP.pageMax),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 40),
          child: child,
        ),
      ),
    );
  }

  // Blue header band — nav row, giant ALL-CAPS name, summary, platform tags.
  Widget _header(bool mobile) {
    final p = widget.project;
    final platforms = (p.platforms ?? [])
        .map((x) => switch (x) {
              Platforms.iOS => 'IOS',
              Platforms.android => 'ANDROID',
              Platforms.web => 'WEB',
            })
        .join('  •  ');
    return Container(
      color: BP.blue,
      child: _constrained(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: Row(
                children: [
                  Text('CONNOR', style: bpLabel(16, color: Colors.white)),
                  Text('.DEV', style: bpLabel(16, color: BP.yellow)),
                  const Spacer(),
                  YellowPill(
                    label: 'Back',
                    fontSize: 11,
                    showArrow: false,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 11),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            SizedBox(height: mobile ? 18 : 44),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (p.icon != null)
                  Container(
                    width: mobile ? 54 : 78,
                    height: mobile ? 54 : 78,
                    margin: const EdgeInsets.only(right: 22),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(p.icon!, fit: BoxFit.contain),
                    ),
                  ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(p.name!.toUpperCase(),
                        style:
                            bpDisplay(mobile ? 34 : 72, color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: 640,
              child: Text(
                (p.summary ?? '').toUpperCase(),
                style: bpLabel(mobile ? 11 : 13,
                    color: Colors.white, weight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 16),
            Text(platforms, style: bpLabel(11, color: BP.yellow)),
            SizedBox(height: mobile ? 40 : 64),
          ],
        ),
        mobile,
      ),
    );
  }

  // White body — description + store/web link pills.
  Widget _body(bool mobile) {
    final p = widget.project;
    final links = <(String, String)>[
      if (p.iOSLink != null) ('App Store', p.iOSLink!),
      if (p.androidLink != null) ('Google Play', p.androidLink!),
      if (p.webLink != null) ('Visit Website', p.webLink!),
    ];

    final description = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ABOUT THE PROJECT', style: bpLabel(12, color: BP.blue)),
        const SizedBox(height: 18),
        Text(p.description ?? '',
            style: bpBody(mobile ? 15 : 16.5, color: const Color(0xFF333333))),
      ],
    );

    final linkColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(links.isEmpty ? 'AVAILABILITY' : 'GET THE APP',
            style: bpLabel(12, color: BP.blue)),
        const SizedBox(height: 18),
        if (links.isEmpty)
          Text(
            'PRIVATE / INTERNAL RELEASE',
            style: bpLabel(10.5, color: BP.grey, weight: FontWeight.w700),
          ),
        for (final (label, url) in links)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: YellowPill(label: label, onTap: () => bpLaunch(url)),
          ),
      ],
    );

    return _constrained(
      Padding(
        padding: EdgeInsets.symmetric(vertical: mobile ? 44 : 80),
        child: mobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  description,
                  const SizedBox(height: 40),
                  linkColumn,
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 7, child: description),
                  const SizedBox(width: 70),
                  Expanded(flex: 3, child: linkColumn),
                ],
              ),
      ),
      mobile,
    );
  }

  // Screenshot gallery — pale-blue stage, yellow circular prev/next arrows,
  // page counter, and a duotone thumbnail rail with every screenshot.
  Widget _gallery(bool mobile) {
    if (_images.isEmpty) return const SizedBox.shrink();
    return _constrained(
      Padding(
        padding: EdgeInsets.only(bottom: mobile ? 50 : 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SCREENSHOTS', style: bpLabel(12, color: BP.blue)),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Container(
                height: mobile ? 420 : 620,
                color: BP.blueTint,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (i) => setState(() => _page = i),
                  itemCount: _images.length,
                  itemBuilder: (context, i) => Padding(
                    padding: EdgeInsets.all(mobile ? 20 : 36),
                    child: Image.asset(_images[i], fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Text(
                  '${(_page + 1).toString().padLeft(2, '0')} / ${_images.length.toString().padLeft(2, '0')}',
                  style: bpDisplay(18),
                ),
                const Spacer(),
                YellowCircleButton(
                    icon: Icons.west, onTap: () => _jump(_page - 1)),
                const SizedBox(width: 12),
                YellowCircleButton(
                    icon: Icons.east, onTap: () => _jump(_page + 1)),
              ],
            ),
            if (_images.length > 1) ...[
              const SizedBox(height: 24),
              SizedBox(
                height: 92,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _images.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, i) {
                    final selected = i == _page;
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => _jump(i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 92,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: selected ? BP.yellow : Colors.transparent,
                              width: 3,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: selected
                                ? Image.asset(_images[i],
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter)
                                : DuotoneImage(
                                    asset: _images[i], hoverReveal: false),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
      mobile,
    );
  }

  // Compact blue footer strip in the same system.
  Widget _footerStrip(bool mobile) {
    return Container(
      color: BP.blue,
      child: _constrained(
        Padding(
          padding: EdgeInsets.symmetric(vertical: mobile ? 36 : 56),
          child: Flex(
            direction: mobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: mobile
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: mobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('EMAIL ME FOR ANY QUERIES',
                        style: bpLabel(11, color: BP.yellow)),
                    const SizedBox(height: 10),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () =>
                              bpLaunch('mailto:${PortfolioData.email}'),
                          child: Text(PortfolioData.email.toUpperCase(),
                              style: bpDisplay(mobile ? 18 : 26,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (mobile) const SizedBox(height: 24),
              YellowPill(
                label: 'All Projects',
                fontSize: 11,
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
        mobile,
      ),
    );
  }
}
