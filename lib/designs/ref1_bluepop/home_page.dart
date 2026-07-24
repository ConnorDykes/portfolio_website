import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:portfolio_website/Projects/project_modle.dart';
import 'package:portfolio_website/designs/portfolio_data.dart';

import 'bluepop_app.dart';
import 'project_detail_page.dart';
import 'resume_download.dart';

class BluepopHomePage extends StatefulWidget {
  const BluepopHomePage({super.key});

  @override
  State<BluepopHomePage> createState() => _BluepopHomePageState();
}

class _BluepopHomePageState extends State<BluepopHomePage> {
  final _scroll = ScrollController();
  final _buildKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _goTo(GlobalKey? key) {
    if (key == null) {
      _scroll.animateTo(0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic);
      return;
    }
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(ctx,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic);
    }
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < BP.mobileBreak;
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scroll,
        child: Column(
          children: [
            _Hero(
              mobile: mobile,
              onNav: (i) => _goTo([
                null,
                _buildKey,
                _projectsKey,
                _experienceKey,
                _contactKey
              ][i]),
            ),
            _StatsBand(mobile: mobile),
            _WhatIBuild(key: _buildKey, mobile: mobile),
            _ProjectsSection(key: _projectsKey, mobile: mobile),
            _ExperienceBand(key: _experienceKey, mobile: mobile),
            _EducationSection(mobile: mobile),
            _LetsTalk(mobile: mobile),
            _Footer(
              key: _contactKey,
              mobile: mobile,
              onNav: (i) => _goTo([
                null,
                _buildKey,
                _projectsKey,
                _experienceKey,
                _contactKey
              ][i]),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Shared section scaffolding ──────────────────────────────────────────────

class _Constrained extends StatelessWidget {
  const _Constrained({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < BP.mobileBreak;
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
}

// ─── Hero ────────────────────────────────────────────────────────────────────

class _Hero extends StatelessWidget {
  const _Hero({required this.mobile, required this.onNav});
  final bool mobile;
  final ValueChanged<int> onNav;

  static const _navItems = [
    'Home',
    'What I Build',
    'Projects',
    'Experience',
    'Contact'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BP.blue,
      child: _Constrained(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _nav(context),
            mobile ? _mobileBody(context) : _desktopBody(context),
          ],
        ),
      ),
    );
  }

  Widget _nav(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22),
      child: Row(
        children: [
          Text('CONNOR ', style: bpLabel(16, color: Colors.white)),
          Text('DYKES',
              style: bpLabel(16, color: BP.yellow)),
          const Spacer(),
          if (!mobile) ...[
            for (var i = 0; i < _navItems.length; i++)
              _NavLink(
                  label: _navItems[i],
                  active: i == 0,
                  onTap: () => onNav(i)),
            const Spacer(),
          ],
          const _ContactMenuButton(),
        ],
      ),
    );
  }

  Widget _photo(double width) {
    return SizedBox(
      width: width,
      child: ShaderMask(
        shaderCallback: (rect) => const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.white, Colors.transparent],
          stops: [0, 0.82, 1],
        ).createShader(rect),
        blendMode: BlendMode.dstIn,
        child: Image.asset(PortfolioData.profilePhoto,
            fit: BoxFit.contain, alignment: Alignment.bottomCenter),
      ),
    );
  }

  Widget _desktopBody(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final photoW = math.min(470.0, w * 0.36);
    return SizedBox(
      height: 640,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Left: MOBILE / DEVELOPER + intro
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 90),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text('MOBILE\n& WEB',
                      style: bpDisplay(54, color: Colors.white)),
                ),
                const Spacer(),
                Text('HI, I AM CONNOR', style: bpLabel(14, color: BP.yellow)),
                const SizedBox(height: 14),
                SizedBox(
                  width: 300,
                  child: Text(
                    '${PortfolioData.heroTagline} ${PortfolioData.heroSubtitle}'
                        .toUpperCase(),
                    style: bpLabel(12,
                        color: Colors.white, weight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 46),
              ],
            ),
          ),
          // Center: cut-out photo sitting on the blue
          _photo(photoW),
          // Right: FOLLOW ME + FLUTTER / & NATIVE
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 56),
                SizedBox(
                  width: 250,
                  child: Text(
                    'I BUILD CROSS-PLATFORM APPS FOR IOS, ANDROID, WEB & DESKTOP',
                    textAlign: TextAlign.right,
                    style: bpLabel(11,
                        color: Colors.white, weight: FontWeight.w600),
                  ),
                ),
                const Spacer(),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Text('ENTERPRISE AI\nAUTOMATIONS\n& AGENTIC\nWORKFLOWS',
                      textAlign: TextAlign.right,
                      style: bpDisplay(54, color: Colors.white)),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _mobileBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 26),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child:
              Text('MOBILE\n& WEB', style: bpDisplay(34, color: Colors.white)),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerRight,
            child: Text('ENTERPRISE AI\nAUTOMATIONS\n& AGENTIC\nWORKFLOWS',
                textAlign: TextAlign.right,
                style:
                    bpDisplay(34, color: Colors.white.withValues(alpha: 0.92))),
          ),
        ),
        SizedBox(height: 330, child: _photo(double.infinity)),
        const SizedBox(height: 26),
        Text('HI, I AM CONNOR', style: bpLabel(13, color: BP.yellow)),
        const SizedBox(height: 12),
        Text(
          '${PortfolioData.heroTagline} ${PortfolioData.heroSubtitle}'
              .toUpperCase(),
          style: bpLabel(12, color: Colors.white, weight: FontWeight.w600),
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({required this.label, required this.onTap, this.active = false});
  final String label;
  final VoidCallback onTap;
  final bool active;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final highlight = _hover || widget.active;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            widget.label.toUpperCase(),
            style: bpLabel(11,
                color: highlight ? BP.yellow : Colors.white,
                weight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

/// "Contact Me" nav pill that opens a dropdown card with all contact info
/// and a resume download, anchored under the button.
class _ContactMenuButton extends StatefulWidget {
  const _ContactMenuButton();

  @override
  State<_ContactMenuButton> createState() => _ContactMenuButtonState();
}

class _ContactMenuButtonState extends State<_ContactMenuButton> {
  final _link = LayerLink();
  OverlayEntry? _entry;

  void _close() {
    _entry?.remove();
    _entry = null;
  }

  void _toggle() {
    if (_entry != null) {
      _close();
      return;
    }
    _entry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
                behavior: HitTestBehavior.opaque, onTap: _close),
          ),
          CompositedTransformFollower(
            link: _link,
            targetAnchor: Alignment.bottomRight,
            followerAnchor: Alignment.topRight,
            offset: const Offset(0, 12),
            child: _ContactMenuCard(onAction: _close),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(_entry!);
  }

  @override
  void dispose() {
    _close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: YellowPill(
        label: 'Contact Me',
        fontSize: 11,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
        onTap: _toggle,
      ),
    );
  }
}

class _ContactMenuCard extends StatelessWidget {
  const _ContactMenuCard({required this.onAction});
  final VoidCallback onAction;

  Widget _row(IconData icon, String label, String value, VoidCallback onTap) {
    return _ContactMenuRow(icon: icon, label: label, value: value, onTap: () {
      onAction();
      onTap();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: BP.ink.withValues(alpha: 0.18),
                blurRadius: 30,
                offset: const Offset(0, 12)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _row(Icons.alternate_email, 'EMAIL', PortfolioData.email,
                () => bpLaunch('mailto:${PortfolioData.email}')),
            const SizedBox(height: 6),
            _row(Icons.phone, 'PHONE', PortfolioData.phoneFormatted,
                () => bpLaunch('tel:${PortfolioData.phone}')),
            const SizedBox(height: 6),
            _row(bpGithubIcon, 'GITHUB', PortfolioData.githubHandle,
                () => bpLaunch(PortfolioData.githubUrl)),
            const SizedBox(height: 14),
            YellowPill(
              label: 'Download Resume',
              fontSize: 11,
              padding:
                  const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
              onTap: () {
                onAction();
                downloadResume(PortfolioData.resumePath,
                    fileName: 'Connor_Dykes_Resume.pdf');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactMenuRow extends StatefulWidget {
  const _ContactMenuRow(
      {required this.icon,
      required this.label,
      required this.value,
      required this.onTap});
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  State<_ContactMenuRow> createState() => _ContactMenuRowState();
}

class _ContactMenuRowState extends State<_ContactMenuRow> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
          decoration: BoxDecoration(
            color: _hover ? BP.blueTint : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                    color: BP.yellow, shape: BoxShape.circle),
                child: Icon(widget.icon, size: 16, color: BP.ink),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.label, style: bpLabel(8.5, color: BP.grey)),
                  const SizedBox(height: 2),
                  Text(widget.value,
                      style: bpBody(13, color: BP.ink, height: 1.2)
                          .copyWith(fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialDot extends StatefulWidget {
  const _SocialDot({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<_SocialDot> createState() => _SocialDotState();
}

class _SocialDotState extends State<_SocialDot> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _hover ? BP.yellow : Colors.transparent,
            border: Border.all(
                color: _hover ? BP.yellow : Colors.white.withValues(alpha: 0.6)),
          ),
          child: Icon(widget.icon,
              size: 16, color: _hover ? BP.ink : Colors.white),
        ),
      ),
    );
  }
}

// ─── Stats band ──────────────────────────────────────────────────────────────

class _StatsBand extends StatelessWidget {
  const _StatsBand({required this.mobile});
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    final stats = [
      ('0${PortfolioData.yearsExperience}', '+', 'YEARS OF\nEXPERIENCE'),
      ('${PortfolioData.projects.length}', '', 'PROJECTS\nBUILT'),
      (
        '${PortfolioData.skillCategories.fold<int>(0, (n, c) => n + c.skills.length)}',
        '+',
        'SKILLS\nUSED'
      ),
    ];
    return Padding(
      padding: EdgeInsets.fromLTRB(mobile ? 12 : 28, mobile ? 12 : 28,
          mobile ? 12 : 28, 0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: BP.pageMax),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: mobile ? 26 : 56, vertical: mobile ? 34 : 52),
            decoration: BoxDecoration(
              color: BP.blue,
              borderRadius: BorderRadius.circular(28),
            ),
            child: mobile
                ? Wrap(
                    runSpacing: 30,
                    children: [
                      for (final s in stats)
                        FractionallySizedBox(
                            widthFactor: 0.5, child: _stat(s, 42)),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [for (final s in stats) _stat(s, 68)],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _stat((String, String, String) s, double size) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(s.$1, style: bpDisplay(size, color: Colors.white)),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(s.$2.isEmpty ? ' ' : s.$2,
                style: bpDisplay(size * 0.32, color: BP.yellow)),
            const SizedBox(height: 4),
            Text(s.$3,
                style: bpLabel(size * 0.16,
                    color: Colors.white, weight: FontWeight.w700)),
          ],
        ),
      ],
    );
  }
}

// ─── What I Build (skill categories) ─────────────────────────────────────────

class _WhatIBuild extends StatelessWidget {
  const _WhatIBuild({super.key, required this.mobile});
  final bool mobile;

  static IconData _categoryIcon(String key) {
    switch (key) {
      case 'mobile':
        return Icons.smartphone;
      case 'brain':
        return Icons.psychology;
      case 'web':
        return Icons.language;
      case 'state':
        return Icons.account_tree;
      case 'database':
        return Icons.storage;
      case 'devops':
        return Icons.rocket_launch;
      default:
        return Icons.brush;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _Constrained(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: mobile ? 60 : 110),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle('What I Build'),
            const SizedBox(height: 14),
            Text(
              'SEVEN DISCIPLINES. ONE GOAL: POLISHED, SHIPPED PRODUCT.',
              style: bpLabel(12, color: BP.grey, weight: FontWeight.w700),
            ),
            SizedBox(height: mobile ? 32 : 56),
            LayoutBuilder(builder: (context, c) {
              final cols = mobile ? 1 : (c.maxWidth > 980 ? 3 : 2);
              const gap = 28.0;
              final cardW = (c.maxWidth - gap * (cols - 1)) / cols;
              return Wrap(
                spacing: gap,
                runSpacing: 44,
                children: [
                  for (final cat in PortfolioData.skillCategories)
                    SizedBox(width: cardW, child: _card(cat)),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _card(SkillCategory cat) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: BP.blueTint,
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.center,
              child: Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                    color: BP.yellow, shape: BoxShape.circle),
                child: Icon(_categoryIcon(cat.icon),
                    size: 20, color: BP.ink),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(cat.title.toUpperCase(), style: bpDisplay(19)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            for (final s in cat.skills)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: BP.blueTint,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(s.toUpperCase(),
                    style: bpLabel(9.5,
                        color: BP.blueDuo, weight: FontWeight.w700)),
              ),
          ],
        ),
      ],
    );
  }

}

// ─── Projects ────────────────────────────────────────────────────────────────

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({super.key, required this.mobile});
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    final projects = PortfolioData.projects;
    return _Constrained(
      child: Padding(
        padding: EdgeInsets.only(bottom: mobile ? 60 : 110),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Expanded(child: SectionTitle('My Projects')),
                Text('ALL ${projects.length}',
                    style: bpLabel(13, color: BP.blue)),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              '${projects.length} APPS SHIPPED FOR STARTUPS, ENTERPRISES, GOVERNMENT & MYSELF.',
              style: bpLabel(12, color: BP.grey, weight: FontWeight.w700),
            ),
            SizedBox(height: mobile ? 32 : 56),
            LayoutBuilder(builder: (context, c) {
              final cols = mobile ? 1 : (c.maxWidth > 980 ? 3 : 2);
              const gap = 28.0;
              final cardW = (c.maxWidth - gap * (cols - 1)) / cols;
              return Wrap(
                spacing: gap,
                runSpacing: 48,
                children: [
                  for (var i = 0; i < projects.length; i++)
                    SizedBox(
                        width: cardW,
                        child: _ProjectCard(project: projects[i], index: i)),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project, required this.index});
  final ProjectModel project;
  final int index;

  void _open(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => BluepopProjectDetailPage(project: project)));
  }

  @override
  Widget build(BuildContext context) {
    final platforms = (project.platforms ?? [])
        .map((p) => switch (p) {
              Platforms.iOS => 'IOS',
              Platforms.android => 'ANDROID',
              Platforms.web => 'WEB',
            })
        .join('  •  ');
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _open(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: SizedBox(
                height: 280,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: const Color(0xFFEDF1FC),
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 52),
                      child: Image.asset(project.images!.first,
                          fit: BoxFit.contain),
                    ),
                    Positioned(
                      left: 16,
                      bottom: 16,
                      child: YellowPill(
                        label: 'See Details',
                        fontSize: 10,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        onTap: () => _open(context),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      top: 14,
                      child: Text(
                        (index + 1).toString().padLeft(2, '0'),
                        style: bpDisplay(20, color: BP.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(project.name!.toUpperCase(), style: bpDisplay(20)),
            const SizedBox(height: 8),
            Text(project.summary ?? '', style: bpBody(13.5, height: 1.5)),
            const SizedBox(height: 10),
            Text(platforms,
                style:
                    bpLabel(9.5, color: BP.blue, weight: FontWeight.w800)),
          ],
        ),
      ),
    );
  }
}

// ─── Experience (blue band) ──────────────────────────────────────────────────

class _ExperienceBand extends StatelessWidget {
  const _ExperienceBand({super.key, required this.mobile});
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BP.blue,
      child: _Constrained(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: mobile ? 60 : 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle('My Work Experience', color: Colors.white),
              SizedBox(height: mobile ? 28 : 48),
              for (var i = 0; i < PortfolioData.softwareJobs.length; i++)
                _row(PortfolioData.softwareJobs[i], i),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(WorkItem job, int index) {
    final content = Row(
      children: [
        Text((index + 1).toString().padLeft(2, '0'),
            style: bpDisplay(16, color: BP.yellow)),
        const SizedBox(width: 20),
        Container(
          width: 46,
          height: 46,
          padding: const EdgeInsets.all(7),
          decoration: const BoxDecoration(
              color: Colors.white, shape: BoxShape.circle),
          child: ClipOval(
              child: Image.asset(job.image, fit: BoxFit.contain)),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(job.title.toUpperCase(),
                  style: bpDisplay(mobile ? 15 : 21, color: Colors.white)),
              const SizedBox(height: 6),
              Text(job.company.toUpperCase(),
                  style: bpLabel(11,
                      color: Colors.white.withValues(alpha: 0.75),
                      weight: FontWeight.w700)),
              if (mobile) ...[
                const SizedBox(height: 6),
                Text(job.dates.toUpperCase(),
                    style: bpLabel(9.5,
                        color: BP.yellow, weight: FontWeight.w700)),
              ],
            ],
          ),
        ),
        if (!mobile)
          Text(job.dates.toUpperCase(),
              style: bpLabel(11, color: Colors.white)),
      ],
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 22),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Colors.white.withValues(alpha: 0.25))),
      ),
      child: content,
    );
  }
}

// ─── Education ───────────────────────────────────────────────────────────────

class _EducationSection extends StatelessWidget {
  const _EducationSection({required this.mobile});
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return _Constrained(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: mobile ? 60 : 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle('Education'),
            SizedBox(height: mobile ? 28 : 48),
            for (final e in PortfolioData.education)
              e.isSelfTaught ? _selfTaught(e) : _row(e),
          ],
        ),
      ),
    );
  }

  Widget _row(EducationItem e) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: BP.blueTint, width: 1.5)),
      ),
      child: Row(
        children: [
          if (e.image != null)
            Container(
              width: 52,
              height: 52,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: BP.blueTint,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Image.asset(e.image!, fit: BoxFit.contain),
            ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(e.level.toUpperCase(),
                    style: bpLabel(10, color: BP.blue)),
                const SizedBox(height: 6),
                Text(e.school.toUpperCase(),
                    style: bpDisplay(mobile ? 15 : 21)),
                if (e.degree != null) ...[
                  const SizedBox(height: 6),
                  Text(e.degree!, style: bpBody(13)),
                ],
                if (e.location.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(e.location.toUpperCase(),
                      style: bpLabel(9.5,
                          color: BP.grey, weight: FontWeight.w700)),
                ],
                if (mobile) ...[
                  const SizedBox(height: 6),
                  Text(e.dates.toUpperCase(),
                      style: bpLabel(9.5,
                          color: BP.blue, weight: FontWeight.w700)),
                ],
              ],
            ),
          ),
          if (!mobile)
            Text(e.dates.toUpperCase(), style: bpLabel(11, color: BP.grey)),
        ],
      ),
    );
  }

  Widget _selfTaught(EducationItem e) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: EdgeInsets.all(mobile ? 26 : 48),
      decoration: BoxDecoration(
        color: BP.blue,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${e.level.toUpperCase()}  •  ${e.dates.toUpperCase()}',
              style: bpLabel(11, color: BP.yellow)),
          const SizedBox(height: 12),
          Text(e.school.toUpperCase(),
              style: bpDisplay(mobile ? 26 : 38, color: Colors.white)),
          const SizedBox(height: 18),
          Text(
            PortfolioData.selfTaughtStory,
            style: bpBody(mobile ? 14 : 15.5,
                color: Colors.white.withValues(alpha: 0.92)),
          ),
        ],
      ),
    );
  }
}

// ─── Have a project? Let's talk ──────────────────────────────────────────────

class _LetsTalk extends StatelessWidget {
  const _LetsTalk({required this.mobile});
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return _Constrained(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: mobile ? 60 : 110),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text('HAVE A PROJECT?', style: bpDisplay(mobile ? 44 : 104)),
            ),
            const SizedBox(height: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Text("LET'S TALK", style: bpDisplay(mobile ? 44 : 104)),
            ),
            SizedBox(height: mobile ? 36 : 64),
            Center(
              child: SizedBox(
                width: 560,
                child: Column(
                  children: [
                    Text(
                      'WHETHER IT IS FLUTTER, REACT NATIVE, OR FULLY NATIVE '
                      'IOS AND ANDROID — I TURN IDEAS INTO POLISHED, '
                      'INTERACTIVE EXPERIENCES.',
                      textAlign: TextAlign.center,
                      style: bpLabel(11.5,
                          color: BP.grey, weight: FontWeight.w700),
                    ),
                    const SizedBox(height: 34),
                    _HireMeCircle(
                        onTap: () =>
                            bpLaunch('mailto:${PortfolioData.email}')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HireMeCircle extends StatefulWidget {
  const _HireMeCircle({required this.onTap});
  final VoidCallback onTap;

  @override
  State<_HireMeCircle> createState() => _HireMeCircleState();
}

class _HireMeCircleState extends State<_HireMeCircle> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 118,
          height: 118,
          decoration: BoxDecoration(
            color: _hover ? BP.ink : BP.yellow,
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('CONTACT ME',
                  style:
                      bpLabel(10.5, color: _hover ? BP.yellow : BP.ink)),
              const SizedBox(height: 4),
              Icon(Icons.north_east,
                  size: 16, color: _hover ? BP.yellow : BP.ink),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Footer ──────────────────────────────────────────────────────────────────

class _Footer extends StatelessWidget {
  const _Footer({super.key, required this.mobile, required this.onNav});
  final bool mobile;
  final ValueChanged<int> onNav;

  static const _pages = [
    'Home',
    'What I Build',
    'Projects',
    'Experience',
    'Contact'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BP.blue,
      child: _Constrained(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: mobile ? 48 : 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flex(
                direction: mobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: mobile ? 0 : 3, child: _emailBlock()),
                  SizedBox(width: mobile ? 0 : 40, height: mobile ? 44 : 0),
                  _linkColumn('PAGES', [
                    for (var i = 0; i < _pages.length; i++)
                      (_pages[i], () => onNav(i)),
                  ]),
                  SizedBox(width: mobile ? 0 : 60, height: mobile ? 36 : 0),
                  _linkColumn('LINKS', [
                    ('GitHub', () => bpLaunch(PortfolioData.githubUrl)),
                    (
                      PortfolioData.email,
                      () => bpLaunch('mailto:${PortfolioData.email}')
                    ),
                    (
                      PortfolioData.phoneFormatted,
                      () => bpLaunch('tel:${PortfolioData.phone}')
                    ),
                    (PortfolioData.location, () {}),
                  ]),
                ],
              ),
              SizedBox(height: mobile ? 44 : 70),
              Container(
                  height: 1, color: Colors.white.withValues(alpha: 0.3)),
              const SizedBox(height: 22),
              Flex(
                direction: mobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: mobile
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Text(
                      '${DateTime.now().year} © ${PortfolioData.name.toUpperCase()}. ALL RIGHTS RESERVED.',
                      style: bpLabel(9.5,
                          color: Colors.white.withValues(alpha: 0.8),
                          weight: FontWeight.w700)),
                  if (!mobile) const Spacer(),
                  if (mobile) const SizedBox(height: 10),
                  Text('BUILT WITH FLUTTER — LIKE EVERYTHING ELSE HERE',
                      style: bpLabel(9.5,
                          color: Colors.white.withValues(alpha: 0.8),
                          weight: FontWeight.w700)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('EMAIL ME FOR ANY QUERIES', style: bpLabel(12, color: BP.yellow)),
        const SizedBox(height: 16),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => bpLaunch('mailto:${PortfolioData.email}'),
              child: Text(PortfolioData.email.toUpperCase(),
                  style: bpDisplay(mobile ? 22 : 34, color: Colors.white)),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text('OR CALL ${PortfolioData.phoneFormatted}',
            style: bpLabel(11,
                color: Colors.white.withValues(alpha: 0.8),
                weight: FontWeight.w700)),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            YellowPill(
              label: 'Download Resume',
              fontSize: 11,
              padding:
                  const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
              onTap: () => downloadResume(PortfolioData.resumePath,
                  fileName: 'Connor_Dykes_Resume.pdf'),
            ),
            _SocialDot(
                icon: bpGithubIcon,
                onTap: () => bpLaunch(PortfolioData.githubUrl)),
          ],
        ),
      ],
    );
  }

  Widget _linkColumn(String title, List<(String, VoidCallback)> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: bpLabel(12, color: BP.yellow)),
        const SizedBox(height: 16),
        for (final (label, onTap) in links)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _FooterLink(label: label, onTap: onTap),
          ),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  const _FooterLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label.toUpperCase(),
          style: bpLabel(10.5,
              color: _hover ? BP.yellow : Colors.white,
              weight: FontWeight.w600),
        ),
      ),
    );
  }
}
