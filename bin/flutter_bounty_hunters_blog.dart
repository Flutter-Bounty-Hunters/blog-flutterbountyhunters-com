import 'package:static_shock/static_shock.dart';

Future<void> main(List<String> arguments) async {
  // Configure the static website generator.
  final staticShock = StaticShock()
    // Here, you can directly hook into the StaticShock pipeline. For example,
    // you can copy an "images" directory from the source set to build set:
    ..pick(DirectoryPicker.parse("images"))
    ..pick(DirectoryPicker.parse("scripts"))
    ..pick(ExtensionPicker("css"))
    // All 3rd party behavior is added through plugins, even the behavior
    // shipped with Static Shock.
    ..plugin(const MarkdownPlugin())
    ..plugin(const JinjaPlugin())
    ..plugin(const PrettyUrlsPlugin())
    ..plugin(const SassPlugin())
    ..plugin(const DraftingPlugin())
    ..plugin(RssPlugin(
      site: RssSiteConfiguration(
        title: "Blog | Flutter Bounty Hunters",
        description: "The Flutter Bounty Hunters blog.",
        homePageUrl: "https://blog.flutterbountyhunters.com",
      ),
      pageToRssItemMapper: (RssSiteConfiguration config, Page page) {
        return defaultPageToRssItemMapper(config, page)?.copyWith(
          author: page.data["author"]?["name"],
        );
      },
    ));

  // Generate the static website.
  await staticShock.generateSite();
}
