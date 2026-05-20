import 'package:flutter/painting.dart' show TextStyle;
import 'package:re_highlight/styles/a11y-dark.dart';
import 'package:re_highlight/styles/a11y-light.dart';
import 'package:re_highlight/styles/agate.dart';
import 'package:re_highlight/styles/an-old-hope.dart';
import 'package:re_highlight/styles/androidstudio.dart';
import 'package:re_highlight/styles/arduino-light.dart';
import 'package:re_highlight/styles/arta.dart';
import 'package:re_highlight/styles/ascetic.dart';
import 'package:re_highlight/styles/atom-one-dark-reasonable.dart';
import 'package:re_highlight/styles/atom-one-dark.dart';
import 'package:re_highlight/styles/atom-one-light.dart';
import 'package:re_highlight/styles/brown-paper.dart';
import 'package:re_highlight/styles/codepen-embed.dart';
import 'package:re_highlight/styles/color-brewer.dart';
import 'package:re_highlight/styles/dark.dart';
import 'package:re_highlight/styles/devibeans.dart';
import 'package:re_highlight/styles/docco.dart';
import 'package:re_highlight/styles/far.dart';
import 'package:re_highlight/styles/felipec.dart';
import 'package:re_highlight/styles/foundation.dart';
import 'package:re_highlight/styles/github-dark-dimmed.dart';
import 'package:re_highlight/styles/github-dark.dart';
import 'package:re_highlight/styles/github.dart';
import 'package:re_highlight/styles/gml.dart';
import 'package:re_highlight/styles/googlecode.dart';
import 'package:re_highlight/styles/gradient-dark.dart';
import 'package:re_highlight/styles/gradient-light.dart';
import 'package:re_highlight/styles/grayscale.dart';
import 'package:re_highlight/styles/hybrid.dart';
import 'package:re_highlight/styles/idea.dart';
import 'package:re_highlight/styles/intellij-light.dart';
import 'package:re_highlight/styles/ir-black.dart';
import 'package:re_highlight/styles/isbl-editor-dark.dart';
import 'package:re_highlight/styles/isbl-editor-light.dart';
import 'package:re_highlight/styles/kimbie-dark.dart';
import 'package:re_highlight/styles/kimbie-light.dart';
import 'package:re_highlight/styles/lightfair.dart';
import 'package:re_highlight/styles/lioshi.dart';
import 'package:re_highlight/styles/magula.dart';
import 'package:re_highlight/styles/mono-blue.dart';
import 'package:re_highlight/styles/monokai-sublime.dart';
import 'package:re_highlight/styles/monokai.dart';
import 'package:re_highlight/styles/night-owl.dart';
import 'package:re_highlight/styles/nnfx-dark.dart';
import 'package:re_highlight/styles/nnfx-light.dart';
import 'package:re_highlight/styles/nord.dart';
import 'package:re_highlight/styles/obsidian.dart';
import 'package:re_highlight/styles/panda-syntax-dark.dart';
import 'package:re_highlight/styles/panda-syntax-light.dart';
import 'package:re_highlight/styles/paraiso-dark.dart';
import 'package:re_highlight/styles/paraiso-light.dart';
import 'package:re_highlight/styles/pojoaque.dart';
import 'package:re_highlight/styles/purebasic.dart';
import 'package:re_highlight/styles/qtcreator-dark.dart';
import 'package:re_highlight/styles/qtcreator-light.dart';
import 'package:re_highlight/styles/rainbow.dart';
import 'package:re_highlight/styles/routeros.dart';
import 'package:re_highlight/styles/school-book.dart';
import 'package:re_highlight/styles/shades-of-purple.dart';
import 'package:re_highlight/styles/srcery.dart';
import 'package:re_highlight/styles/stackoverflow-dark.dart';
import 'package:re_highlight/styles/stackoverflow-light.dart';
import 'package:re_highlight/styles/sunburst.dart';
import 'package:re_highlight/styles/tokyo-night-dark.dart';
import 'package:re_highlight/styles/tokyo-night-light.dart';
import 'package:re_highlight/styles/tomorrow-night-blue.dart';
import 'package:re_highlight/styles/tomorrow-night-bright.dart';
import 'package:re_highlight/styles/vs.dart';
import 'package:re_highlight/styles/vs2015.dart';
import 'package:re_highlight/styles/xcode.dart';
import 'package:re_highlight/styles/xt256.dart';

enum LightCodeTheme {
  a11yLight('a11y-light', a11YLightTheme),
  arduinoLight('arduino-light', arduinoLightTheme),
  ascetic('ascetic', asceticTheme),
  atomOneLight('atom-one-light', atomOneLightTheme),
  github('github', githubTheme),
  gradientLight('gradient-light', gradientLightTheme),
  intellijLight('intellij-light', intellijLightTheme),
  isblEditorLight('isbl-editor-light', isblEditorLightTheme),
  kimbieLight('kimbie-light', kimbieLightTheme),
  lightfair('lightfair', lightfairTheme),
  monoBlue('mono-blue', monoBlueTheme),
  nnfxLight('nnfx-light', nnfxLightTheme),
  pandaSyntaxLight('panda-syntax-light', pandaSyntaxLightTheme),
  paraisoLight('paraiso-light', paraisoLightTheme),
  qtcreatorLight('qtcreator-light', qtcreatorLightTheme),
  stackoverflowLight('stackoverflow-light', stackoverflowLightTheme),
  tokyoNightLight('tokyo-night-light', tokyoNightLightTheme),
  vs('vs', vsTheme),
  xcode('xcode', xcodeTheme);

  final String label;
  final Map<String, TextStyle> value;

  const LightCodeTheme(this.label, this.value);

  static const LightCodeTheme defaultTheme = LightCodeTheme.github;
}

enum DarkCodeTheme {
  a11YDark('a11y-dark', a11YDarkTheme),
  agate('agate', agateTheme),
  anOldHope('an-old-hope', anOldHopeTheme),
  androidstudio('androidstudio', androidstudioTheme),
  arta('arta', artaTheme),
  atomOneDarkReasonable('atom-one-dark-reasonable', atomOneDarkReasonableTheme),
  atomOneDark('atom-one-dark', atomOneDarkTheme),
  brownPaper('brown-paper', brownPaperTheme),
  codepenEmbed('codepen-embed', codepenEmbedTheme),
  colorBrewer('color-brewer', colorBrewerTheme),
  dark('dark', darkTheme),
  devibeans('devibeans', devibeansTheme),
  docco('docco', doccoTheme),
  far('far', farTheme),
  felipec('felipec', felipecTheme),
  foundation('foundation', foundationTheme),
  githubDarkDimmed('github-dark-dimmed', githubDarkDimmedTheme),
  githubDark('github-dark', githubDarkTheme),
  gml('gml', gmlTheme),
  googlecode('googlecode', googlecodeTheme),
  gradientDark('gradient-dark', gradientDarkTheme),
  grayscale('grayscale', grayscaleTheme),
  hybrid('hybrid', hybridTheme),
  idea('idea', ideaTheme),
  irBlack('ir-black', irBlackTheme),
  isblEditorDark('isbl-editor-dark', isblEditorDarkTheme),
  kimbieDark('kimbie-dark', kimbieDarkTheme),
  lioshi('lioshi', lioshiTheme),
  magula('magula', magulaTheme),
  monokaiSublime('monokai-sublime', monokaiSublimeTheme),
  monokai('monokai', monokaiTheme),
  nightOwl('night-owl', nightOwlTheme),
  nnfxDark('nnfx-dark', nnfxDarkTheme),
  nord('nord', nordTheme),
  obsidian('obsidian', obsidianTheme),
  pandaSyntaxDark('panda-syntax-dark', pandaSyntaxDarkTheme),
  paraisoDark('paraiso-dark', paraisoDarkTheme),
  pojoaque('pojoaque', pojoaqueTheme),
  purebasic('purebasic', purebasicTheme),
  qtcreatorDark('qtcreator-dark', qtcreatorDarkTheme),
  rainbow('rainbow', rainbowTheme),
  routeros('routeros', routerosTheme),
  schoolBook('school-book', schoolBookTheme),
  shadesOfPurple('shades-of-purple', shadesOfPurpleTheme),
  srcery('srcery', srceryTheme),
  stackoverflowDark('stackoverflow-dark', stackoverflowDarkTheme),
  sunburst('sunburst', sunburstTheme),
  tokyoNightDark('tokyo-night-dark', tokyoNightDarkTheme),
  tomorrowNightBlue('tomorrow-night-blue', tomorrowNightBlueTheme),
  tomorrowNightBright('tomorrow-night-bright', tomorrowNightBrightTheme),
  vs2015('vs2015', vs2015Theme),
  xt256('xt256', xt256Theme);

  final String label;
  final Map<String, TextStyle> value;

  const DarkCodeTheme(this.label, this.value);

  static const DarkCodeTheme defaultTheme = DarkCodeTheme.githubDark;
}
