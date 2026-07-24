/// Ref 1 — "Bluepop" (Dribbble shot 25237947, "Alex — UI/UX Designer").
/// Bold poster-style landing page: saturated periwinkle-blue blocks
/// alternating with white, near-black condensed-bold ALL-CAPS display type,
/// yellow rounded-pill CTAs with arrow glyphs, cut-out hero photo flanked by
/// two huge stacked headlines, blue stats band, duotone-blue image cards,
/// giant black typographic "let's talk" section, and a blue footer.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_page.dart';

// ─── Palette (sampled from the reference) ────────────────────────────────────

class BP {
  static const blue = Color(0xFF5B7CE8); // saturated periwinkle section blocks
  static const blueDeep = Color(0xFF4A69D2); // pressed / tint layer on blue
  static const blueDuo = Color(0xFF3D5BC4); // duotone image wash
  static const blueTint = Color(0xFFDCE4FB); // pale blue card backgrounds
  static const yellow = Color(0xFFF4E04D); // pill CTAs
  static const ink = Color(0xFF111111); // near-black display type
  static const paper = Color(0xFFFFFFFF);
  static const grey = Color(0xFF5B5B5B); // secondary body text on white

  static const pageMax = 1240.0;
  static const mobileBreak = 800.0;
}

// ─── Type system ─────────────────────────────────────────────────────────────
// Archivo Black for the condensed-bold poster display type,
// Archivo for wide-tracked small-caps labels, Inter for body copy.

TextStyle bpDisplay(double size, {Color color = BP.ink}) =>
    GoogleFonts.archivoBlack(
      fontSize: size,
      color: color,
      height: 0.96,
      letterSpacing: size * -0.015,
    );

TextStyle bpLabel(double size,
        {Color color = BP.ink, FontWeight weight = FontWeight.w800}) =>
    GoogleFonts.archivo(
      fontSize: size,
      color: color,
      fontWeight: weight,
      height: 1.25,
      letterSpacing: size * 0.14,
    );

TextStyle bpBody(double size, {Color color = BP.grey, double height = 1.65}) =>
    GoogleFonts.inter(fontSize: size, color: color, height: height);

// ─── Static Font Awesome glyphs ──────────────────────────────────────────────
// Only const IconData — dynamically selected FA glyphs get tree-shaken to
// tofu in web builds, so every icon used is a compile-time constant. The
// bundled Font Awesome fonts ship via the font_awesome_flutter package.

const IconData bpGithubIcon = IconData(0xf09b,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpAppleIcon = IconData(0xf179,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpAndroidIcon = IconData(0xf17b,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpWindowsIcon = IconData(0xf17a,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpHtml5Icon = IconData(0xf13b,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpCss3Icon = IconData(0xf13c,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpJsIcon = IconData(0xf3b8,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpCodeIcon = IconData(0xf121,
    fontFamily: 'FontAwesomeSolid', fontPackage: 'font_awesome_flutter');
const IconData bpReactIcon = IconData(0xf41b,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpAngularIcon = IconData(0xf420,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpNodeJsIcon = IconData(0xf3d3,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpFigmaIcon = IconData(0xf799,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpJiraIcon = IconData(0xf7b1,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpConfluenceIcon = IconData(0xf78d,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpAwsIcon = IconData(0xf375,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpLaravelIcon = IconData(0xf3bd,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpGitIcon = IconData(0xf841,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpAppStoreIcon = IconData(0xf36f,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpGooglePlayIcon = IconData(0xf3ab,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
const IconData bpBluetoothIcon = IconData(0xf294,
    fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');

/// Maps the PortfolioData `faIcon` string keys to const glyphs.
IconData? bpFaGlyph(String? key) {
  switch (key) {
    case 'apple':
      return bpAppleIcon;
    case 'android':
      return bpAndroidIcon;
    case 'windows':
      return bpWindowsIcon;
    case 'html5':
      return bpHtml5Icon;
    case 'css3':
      return bpCss3Icon;
    case 'js':
      return bpJsIcon;
    case 'code':
      return bpCodeIcon;
  }
  return null;
}

// ─── Helpers ─────────────────────────────────────────────────────────────────

Future<void> bpLaunch(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) await launchUrl(uri);
}

// ─── Shared widgets ──────────────────────────────────────────────────────────

/// The chunky yellow rounded-pill CTA with the ↗ arrow glyph.
class YellowPill extends StatefulWidget {
  const YellowPill({
    super.key,
    required this.label,
    required this.onTap,
    this.fontSize = 13,
    this.padding = const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
    this.showArrow = true,
  });

  final String label;
  final VoidCallback onTap;
  final double fontSize;
  final EdgeInsets padding;
  final bool showArrow;

  @override
  State<YellowPill> createState() => _YellowPillState();
}

class _YellowPillState extends State<YellowPill> {
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
          padding: widget.padding,
          decoration: BoxDecoration(
            color: _hover ? BP.ink : BP.yellow,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label.toUpperCase(),
                style: bpLabel(widget.fontSize,
                    color: _hover ? BP.yellow : BP.ink),
              ),
              if (widget.showArrow) ...[
                const SizedBox(width: 8),
                Icon(Icons.north_east,
                    size: widget.fontSize + 2,
                    color: _hover ? BP.yellow : BP.ink),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Yellow circular arrow button — the reference's gallery prev/next control.
class YellowCircleButton extends StatefulWidget {
  const YellowCircleButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 52,
  });

  final IconData icon;
  final VoidCallback onTap;
  final double size;

  @override
  State<YellowCircleButton> createState() => _YellowCircleButtonState();
}

class _YellowCircleButtonState extends State<YellowCircleButton> {
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
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: _hover ? BP.ink : BP.yellow,
            shape: BoxShape.circle,
          ),
          child: Icon(widget.icon,
              size: widget.size * 0.4, color: _hover ? BP.yellow : BP.ink),
        ),
      ),
    );
  }
}

/// Duotone-blue treatment for screenshots/logos, lifting to full colour on
/// hover — matches the reference's blue-washed image cards.
class DuotoneImage extends StatefulWidget {
  const DuotoneImage({
    super.key,
    required this.asset,
    this.fit = BoxFit.cover,
    this.hoverReveal = true,
    this.alignment = Alignment.topCenter,
  });

  final String asset;
  final BoxFit fit;
  final bool hoverReveal;
  final Alignment alignment;

  @override
  State<DuotoneImage> createState() => _DuotoneImageState();
}

class _DuotoneImageState extends State<DuotoneImage> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      widget.asset,
      fit: widget.fit,
      alignment: widget.alignment,
      width: double.infinity,
      height: double.infinity,
    );
    if (_hover && widget.hoverReveal) {
      return MouseRegion(
          onExit: (_) => setState(() => _hover = false), child: image);
    }
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      // Desaturate to luminance, multiply with the reference blue, then lift
      // the shadows with a translucent blue wash — a proper duotone that
      // forces every screenshot into the blue system regardless of its hue.
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
            BP.blue.withValues(alpha: 0.35), BlendMode.srcOver),
        child: ColorFiltered(
          colorFilter: const ColorFilter.mode(BP.blue, BlendMode.multiply),
          child: ColorFiltered(
            colorFilter: const ColorFilter.matrix([
              0.2126, 0.7152, 0.0722, 0, 0, //
              0.2126, 0.7152, 0.0722, 0, 0, //
              0.2126, 0.7152, 0.0722, 0, 0, //
              0, 0, 0, 1, 0,
            ]),
            child: image,
          ),
        ),
      ),
    );
  }
}

/// Big black ALL-CAPS section title, reference-style ("MY SERVICES").
class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text, {super.key, this.color = BP.ink});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < BP.mobileBreak;
    return Text(text.toUpperCase(), style: bpDisplay(mobile ? 34 : 52, color: color));
  }
}

// ─── App ─────────────────────────────────────────────────────────────────────

class BluepopApp extends StatelessWidget {
  const BluepopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connor Dykes — Senior Mobile Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: BP.paper,
        colorScheme: ColorScheme.fromSeed(seedColor: BP.blue),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const BluepopHomePage(),
    );
  }
}
