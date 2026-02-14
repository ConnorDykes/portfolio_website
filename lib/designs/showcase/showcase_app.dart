/// Design 8 — Showcase
/// Immersive project-first portfolio. Large hero project cards, full-bleed
/// imagery, magazine-style featured projects section, horizontal project
/// carousel, and a clean sidebar/content split on desktop.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website/designs/portfolio_data.dart';
import 'package:portfolio_website/designs/showcase/resume_download.dart';

class _C {
  static const bg = Color(0xFFFBFBFB);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF0D0D0D);
  static const accent = Color(0xFF2563EB); // Vivid blue
  static const accentBg = Color(0xFFEFF6FF);
  static const text = Color(0xFF1E293B);
  static const textSec = Color(0xFF64748B);
  static const textMut = Color(0xFF94A3B8);
  static const border = Color(0xFFE2E8F0);
}

class ShowcaseApp extends StatelessWidget {
  const ShowcaseApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connor Dykes — Senior Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: _C.bg,
          colorScheme: const ColorScheme.light(primary: _C.accent),
          textTheme: GoogleFonts.interTextTheme()),
      home: const _Shell(),
    );
  }
}

class _Shell extends StatefulWidget {
  const _Shell();
  @override
  State<_Shell> createState() => _ShellState();
}

class _ShellState extends State<_Shell> {
  final _sc = ScrollController();
  final _keys = List.generate(5, (_) => GlobalKey());
  bool _scrolled = false;

  void _scrollTo(int i) {
    final ctx = _keys[i].currentContext;
    if (ctx != null)
      Scrollable.ensureVisible(ctx,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic);
  }

  @override
  void initState() {
    super.initState();
    _sc.addListener(() {
      final s = _sc.offset > 40;
      if (s != _scrolled) setState(() => _scrolled = s);
    });
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width > 900;
    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
          controller: _sc,
          child: Column(children: [
            const SizedBox(height: 80),
            _Hero(key: _keys[0], onProjects: () => _scrollTo(3)),
            _AboutSection(key: _keys[1]),
            _WorkSection(key: _keys[2]),
            _FeaturedProjects(key: _keys[3]),
            _AllProjects(),
            _EducationSection(key: _keys[4]),
            _Footer(),
          ])),
      _Nav(scrolled: _scrolled, wide: wide, onNav: _scrollTo),
    ]));
  }
}

// ─── Nav ─────────────────────────────────────────────────────────────────────

class _Nav extends StatelessWidget {
  const _Nav({required this.scrolled, required this.wide, required this.onNav});
  final bool scrolled;
  final bool wide;
  final ValueChanged<int> onNav;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: _C.white,
        border: const Border(bottom: BorderSide(color: _C.border)),
        boxShadow: scrolled
            ? [
                BoxShadow(
                  color: Colors.black.withAlpha(12),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
              color: _C.accent, borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text('CD',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: _C.white))),
        ),
        const SizedBox(width: 12),
        Text(PortfolioData.name,
            style: GoogleFonts.inter(
                fontSize: 16, fontWeight: FontWeight.w700, color: _C.black)),
        const Spacer(),
        if (wide) ...[
          _nl('About', () => onNav(1)),
          _nl('Work', () => onNav(2)),
          _nl('Projects', () => onNav(3)),
          _nl('Education', () => onNav(4)),
          const SizedBox(width: 20),
          _Btn('Get in Touch', true,
              () => _open('mailto:${PortfolioData.email}')),
        ],
      ]),
    );
  }

  Widget _nl(String t, VoidCallback f) => _HLink(t, f);
}

class _HLink extends StatefulWidget {
  const _HLink(this.text, this.onTap);
  final String text;
  final VoidCallback onTap;
  @override
  State<_HLink> createState() => _HLinkState();
}

class _HLinkState extends State<_HLink> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) => setState(() => _h = true),
        onExit: (_) => setState(() => _h = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: widget.onTap,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(widget.text,
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: _h ? _C.accent : _C.textSec)))));
  }
}

class _Btn extends StatefulWidget {
  const _Btn(this.label, this.filled, this.onTap, {this.icon});
  final String label;
  final bool filled;
  final VoidCallback onTap;
  final IconData? icon;
  @override
  State<_Btn> createState() => _BtnState();
}

class _BtnState extends State<_Btn> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) => setState(() => _h = true),
        onExit: (_) => setState(() => _h = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: widget.filled
                    ? (_h ? _C.black : _C.accent)
                    : Colors.transparent,
                border: widget.filled
                    ? null
                    : Border.all(color: _h ? _C.accent : _C.border),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                if (widget.icon != null) ...[
                  Icon(widget.icon,
                      size: 16,
                      color: widget.filled
                          ? _C.white
                          : (_h ? _C.accent : _C.text)),
                  const SizedBox(width: 8)
                ],
                Text(widget.label,
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: widget.filled
                            ? _C.white
                            : (_h ? _C.accent : _C.text))),
              ]),
            )));
  }
}

// ─── Helpers ─────────────────────────────────────────────────────────────────

class _W extends StatelessWidget {
  const _W({required this.child, this.bg});
  final Widget child;
  final Color? bg;
  @override
  Widget build(BuildContext context) => Container(
      color: bg,
      child: Center(
          child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
                  child: child))));
}

class _Tag extends StatelessWidget {
  const _Tag(this.label);
  final String label;
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
            color: _C.accentBg, borderRadius: BorderRadius.circular(6)),
        child: Text(label,
            style: GoogleFonts.inter(
                fontSize: 11, fontWeight: FontWeight.w600, color: _C.accent)),
      );
}

// ─── Hero ────────────────────────────────────────────────────────────────────

class _Hero extends StatelessWidget {
  const _Hero({super.key, required this.onProjects});
  final VoidCallback onProjects;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width > 900;
    return _W(
        child: wide
            ? Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(flex: 3, child: _text()),
                const SizedBox(width: 48),
                Expanded(flex: 2, child: _photo()),
              ])
            : Column(
                children: [_photo(), const SizedBox(height: 32), _text()]));
  }

  Widget _photo() => Container(
        constraints: const BoxConstraints(maxWidth: 300, maxHeight: 450),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(
              color: _C.accent.withAlpha(30),
              blurRadius: 40,
              offset: const Offset(0, 16))
        ]),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:
                Image.asset(PortfolioData.profilePhoto, fit: BoxFit.fitHeight)),
      );

  Widget _text() =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const _Tag('Open to opportunities'),
        const SizedBox(height: 20),
        Text('Building apps\nthat people love.',
            style: GoogleFonts.inter(
                fontSize: 52,
                fontWeight: FontWeight.w800,
                color: _C.black,
                height: 1.1)),
        const SizedBox(height: 16),
        Text('${PortfolioData.title} · ${PortfolioData.location}',
            style: GoogleFonts.inter(fontSize: 16, color: _C.textSec)),
        const SizedBox(height: 20),
        Text(PortfolioData.aboutParagraph1,
            style: GoogleFonts.inter(
                fontSize: 16, color: _C.textSec, height: 1.7)),
        const SizedBox(height: 28),
        Wrap(spacing: 12, runSpacing: 12, children: [
          _Btn('View Projects', true, onProjects, icon: Icons.apps_rounded),
          _Btn(
            'Resume',
            false,
            () => downloadResume(
              PortfolioData.resumePath,
              fileName: 'Connor Dykes - Resume.pdf',
            ),
            icon: Icons.description_outlined,
          ),
          _Btn('GitHub', false, () => _open(PortfolioData.githubUrl),
              icon: FontAwesomeIcons.github),
        ]),
      ]);
}

// ─── About ───────────────────────────────────────────────────────────────────

class _AboutSection extends StatelessWidget {
  const _AboutSection({super.key});
  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width > 900;
    return _W(
        bg: _C.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('About Me',
              style: GoogleFonts.inter(
                  fontSize: 32, fontWeight: FontWeight.w800, color: _C.black)),
          Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  color: _C.accent, borderRadius: BorderRadius.circular(2))),
          Text(PortfolioData.aboutParagraph2,
              style: GoogleFonts.inter(
                  fontSize: 16, color: _C.textSec, height: 1.7)),
          const SizedBox(height: 32),
          if (wide)
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(child: _skillCard('Platforms', PortfolioData.platforms)),
              const SizedBox(width: 16),
              Expanded(child: _skillCard('Languages', PortfolioData.languages)),
              const SizedBox(width: 16),
              Expanded(child: _statsCard()),
            ])
          else ...[
            _skillCard('Platforms', PortfolioData.platforms),
            const SizedBox(height: 16),
            _skillCard('Languages', PortfolioData.languages),
            const SizedBox(height: 16),
            _statsCard()
          ],
        ]));
  }

  Widget _skillCard(String title, List<SkillItem> items) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: _C.bg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _C.border)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style: GoogleFonts.inter(
                  fontSize: 14, fontWeight: FontWeight.w700, color: _C.accent)),
          const SizedBox(height: 12),
          Wrap(
              spacing: 8,
              runSpacing: 8,
              children: items.map((s) => _Tag(s.name)).toList()),
        ]),
      );

  Widget _statsCard() => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: _C.accent, borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('By the Numbers',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white70)),
          const SizedBox(height: 16),
          _row('4+', 'Years of Experience'),
          _row('${PortfolioData.projects.length}', 'Apps Built'),
          _row('6', 'Platforms Supported'),
        ]),
      );

  Widget _row(String v, String l) => Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(children: [
        Text(v,
            style: GoogleFonts.inter(
                fontSize: 28, fontWeight: FontWeight.w800, color: _C.white)),
        const SizedBox(width: 12),
        Expanded(
            child: Text(l,
                style: GoogleFonts.inter(fontSize: 13, color: Colors.white70))),
      ]));
}

// ─── Work ────────────────────────────────────────────────────────────────────

class _WorkSection extends StatelessWidget {
  const _WorkSection({super.key});
  @override
  Widget build(BuildContext context) {
    return _W(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Experience',
          style: GoogleFonts.inter(
              fontSize: 32, fontWeight: FontWeight.w800, color: _C.black)),
      Container(
          width: 40,
          height: 4,
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              color: _C.accent, borderRadius: BorderRadius.circular(2))),
      ...PortfolioData.softwareJobs.map((j) => _WRow(j)),
    ]));
  }
}

class _WRow extends StatelessWidget {
  const _WRow(this.job);
  final WorkItem job;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _C.border)),
      child: Row(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(job.image,
                width: 48, height: 48, fit: BoxFit.cover)),
        const SizedBox(width: 16),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(job.title,
              style: GoogleFonts.inter(
                  fontSize: 16, fontWeight: FontWeight.w600, color: _C.text)),
          Text(job.company,
              style: GoogleFonts.inter(fontSize: 14, color: _C.textSec)),
        ])),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
                color: _C.bg, borderRadius: BorderRadius.circular(6)),
            child: Text(job.dates,
                style: GoogleFonts.inter(fontSize: 12, color: _C.textMut))),
      ]),
    );
  }
}

// ─── Featured Projects (large hero cards) ────────────────────────────────────

class _FeaturedProjects extends StatelessWidget {
  const _FeaturedProjects({super.key});
  @override
  Widget build(BuildContext context) {
    final featured = PortfolioData.projects.take(3).toList();
    final wide = MediaQuery.of(context).size.width > 900;
    return _W(
        bg: _C.bg,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Featured Projects',
              style: GoogleFonts.inter(
                  fontSize: 32, fontWeight: FontWeight.w800, color: _C.black)),
          const SizedBox(height: 8),
          Text('Highlighted work across platforms',
              style: GoogleFonts.inter(fontSize: 16, color: _C.textSec)),
          const SizedBox(height: 40),
          ...featured
              .asMap()
              .entries
              .map((e) => _FeaturedCard(e.value, e.key, wide)),
        ]));
  }
}

class _FeaturedCard extends StatefulWidget {
  const _FeaturedCard(this.project, this.index, this.wide);
  final dynamic project;
  final int index;
  final bool wide;
  @override
  State<_FeaturedCard> createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<_FeaturedCard> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    final hasScreenshot = p.images != null && (p.images as List).isNotEmpty;
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _showDetail(context, p),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: _h ? _C.white : const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(color: _h ? _C.accent.withAlpha(140) : _C.border),
            boxShadow: [
              BoxShadow(
                color:
                    _h ? _C.accent.withAlpha(20) : Colors.black.withAlpha(10),
                blurRadius: _h ? 24 : 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: widget.wide
              ? IntrinsicHeight(
                  child: Row(children: [
                  if (hasScreenshot)
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        child: Image.asset((p.images as List<String>).first,
                            width: 280, height: 280, fit: BoxFit.cover)),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(children: [
                                  if (p.icon != null)
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(p.icon!,
                                            width: 48,
                                            height: 48,
                                            fit: BoxFit.contain)),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: Text(p.name ?? '',
                                          style: GoogleFonts.inter(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: _C.text))),
                                ]),
                                const SizedBox(height: 12),
                                Text(p.summary ?? '',
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        color: _C.textSec,
                                        height: 1.5)),
                                const SizedBox(height: 8),
                                Text(p.description ?? '',
                                    style: GoogleFonts.inter(
                                        fontSize: 13,
                                        color: _C.textMut,
                                        height: 1.6),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis),
                                const SizedBox(height: 16),
                                Row(children: [
                                  Icon(Icons.arrow_forward_rounded,
                                      size: 16,
                                      color: _h ? _C.accent : _C.textMut),
                                  const SizedBox(width: 6),
                                  Text('View Project',
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: _h ? _C.accent : _C.textMut)),
                                ]),
                              ]))),
                ]))
              : Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          if (p.icon != null)
                            ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(p.icon!,
                                    width: 44,
                                    height: 44,
                                    fit: BoxFit.contain)),
                          const SizedBox(width: 12),
                          Expanded(
                              child: Text(p.name ?? '',
                                  style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: _C.text))),
                        ]),
                        const SizedBox(height: 8),
                        Text(p.summary ?? '',
                            style: GoogleFonts.inter(
                                fontSize: 14, color: _C.textSec)),
                      ])),
        ),
      ),
    );
  }
}

// ─── All Projects Grid ───────────────────────────────────────────────────────

class _AllProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width > 900;
    return _W(
        bg: _C.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Expanded(
                child: Text('All Projects',
                    style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: _C.black))),
            Text('${PortfolioData.projects.length} total',
                style: GoogleFonts.inter(fontSize: 14, color: _C.textMut)),
          ]),
          const SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: wide ? 3 : 1,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: wide ? 1.1 : 2.8),
            itemCount: PortfolioData.projects.length,
            itemBuilder: (_, i) => _MiniProjCard(PortfolioData.projects[i]),
          ),
        ]));
  }
}

class _MiniProjCard extends StatefulWidget {
  const _MiniProjCard(this.p);
  final dynamic p;
  @override
  State<_MiniProjCard> createState() => _MiniProjCardState();
}

class _MiniProjCardState extends State<_MiniProjCard> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    final p = widget.p;
    final wide = MediaQuery.of(context).size.width > 900;
    return MouseRegion(
        onEnter: (_) => setState(() => _h = true),
        onExit: (_) => setState(() => _h = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () => _showDetail(context, p),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: _C.bg,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: _h ? _C.accent : _C.border)),
              child: wide
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Row(children: [
                            if (p.icon != null)
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(p.icon!,
                                      width: 36,
                                      height: 36,
                                      fit: BoxFit.contain)),
                            const Spacer(),
                            Icon(Icons.arrow_outward,
                                size: 14, color: _h ? _C.accent : _C.textMut),
                          ]),
                          const Spacer(),
                          Text(p.name ?? '',
                              style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: _C.text)),
                          const SizedBox(height: 4),
                          Text(p.summary ?? '',
                              style: GoogleFonts.inter(
                                  fontSize: 12, color: _C.textSec, height: 1.4),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                          const Spacer(),
                        ])
                  : Row(children: [
                      if (p.icon != null)
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(p.icon!,
                                width: 36, height: 36, fit: BoxFit.contain)),
                      const SizedBox(width: 14),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Text(p.name ?? '',
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: _C.text)),
                            Text(p.summary ?? '',
                                style: GoogleFonts.inter(
                                    fontSize: 12, color: _C.textSec),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ])),
                    ]),
            )));
  }
}

// ─── Education ───────────────────────────────────────────────────────────────

class _EducationSection extends StatelessWidget {
  const _EducationSection({super.key});
  @override
  Widget build(BuildContext context) {
    return _W(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Education',
          style: GoogleFonts.inter(
              fontSize: 32, fontWeight: FontWeight.w800, color: _C.black)),
      Container(
          width: 40,
          height: 4,
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              color: _C.accent, borderRadius: BorderRadius.circular(2))),
      ...PortfolioData.education.where((e) => !e.isSelfTaught).map(_eduRow),
      const SizedBox(height: 24),
      Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: _C.accentBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _C.accent.withAlpha(30))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const _Tag('Self Taught · 2020 — Present'),
          const SizedBox(height: 12),
          Text(PortfolioData.selfTaughtStory,
              style: GoogleFonts.inter(
                  fontSize: 14, color: _C.textSec, height: 1.7)),
        ]),
      ),
    ]));
  }

  Widget _eduRow(EducationItem edu) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: _C.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: _C.border)),
        child: Row(children: [
          if (edu.image != null) ...[
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(edu.image!,
                    width: 44, height: 44, fit: BoxFit.contain)),
            const SizedBox(width: 16)
          ],
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(edu.level,
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: _C.text)),
                Text(edu.school,
                    style: GoogleFonts.inter(fontSize: 14, color: _C.textSec)),
                if (edu.degree != null)
                  Text(edu.degree!,
                      style:
                          GoogleFonts.inter(fontSize: 12, color: _C.textMut)),
              ])),
          Text(edu.dates,
              style: GoogleFonts.inter(fontSize: 12, color: _C.textMut)),
        ]),
      );
}

// ─── Footer ──────────────────────────────────────────────────────────────────

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: _C.accent,
        padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 32),
        child: Center(
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(children: [
                  Text("Let's build something\nincredible together.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: _C.white,
                          height: 1.1)),
                  const SizedBox(height: 24),
                  Wrap(spacing: 12, alignment: WrapAlignment.center, children: [
                    _Btn('Email Me', true,
                        () => _open('mailto:${PortfolioData.email}'),
                        icon: Icons.email_outlined),
                    _Btn('Call', false,
                        () => _open('tel:${PortfolioData.phone}'),
                        icon: Icons.phone_outlined),
                    _Btn('GitHub', false, () => _open(PortfolioData.githubUrl),
                        icon: FontAwesomeIcons.github),
                  ]),
                  const SizedBox(height: 40),
                  Text('${PortfolioData.name} · ${PortfolioData.title}',
                      style: GoogleFonts.inter(
                          fontSize: 12, color: Colors.white54)),
                ]))),
      );
}

// ─── Detail Dialog ───────────────────────────────────────────────────────────

void _showDetail(BuildContext context, dynamic project) {
  showDialog(
      context: context,
      builder: (ctx) => Dialog(
            backgroundColor: _C.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ConstrainedBox(
                constraints:
                    const BoxConstraints(maxWidth: 720, maxHeight: 600),
                child: Padding(
                    padding: const EdgeInsets.all(28),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            if (project.icon != null)
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(project.icon!,
                                      width: 52,
                                      height: 52,
                                      fit: BoxFit.contain)),
                            const SizedBox(width: 16),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Text(project.name ?? '',
                                      style: GoogleFonts.inter(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800,
                                          color: _C.black)),
                                  Text(project.summary ?? '',
                                      style: GoogleFonts.inter(
                                          fontSize: 13, color: _C.textSec)),
                                ])),
                            IconButton(
                                icon:
                                    const Icon(Icons.close, color: _C.textMut),
                                onPressed: () => Navigator.pop(ctx)),
                          ]),
                          const SizedBox(height: 16),
                          Container(
                              height: 4,
                              width: 32,
                              decoration: BoxDecoration(
                                  color: _C.accent,
                                  borderRadius: BorderRadius.circular(2))),
                          const SizedBox(height: 16),
                          Text(project.description ?? '',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: _C.textSec,
                                  height: 1.7)),
                          const SizedBox(height: 16),
                          if (project.images != null &&
                              (project.images as List).isNotEmpty)
                            Expanded(
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: (project.images as List<String>)
                                        .map((img) => Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.asset(img,
                                                    height: 250,
                                                    fit: BoxFit.contain))))
                                        .toList())),
                        ]))),
          ));
}

Future<void> _open(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri))
    await launchUrl(uri, webOnlyWindowName: '_blank');
}
