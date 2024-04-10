---
title: What belongs in Flutter?
description: Let's talk about the bounds of Flutter's responsibility.
publishDate: 2024-04-08
headerImageUrl: /images/posts/what-belongs-in-flutter/header.png
previewImageUrl: /images/posts/what-belongs-in-flutter/preview.png
---

Recently, on X/Twitter, I joined a conversation about what kind of features Flutter should ship. Mike Rydstrom posted an example of Swift UI automatically parsing Markdown in a `Text` view. He suggested that it's an example of doing things right, and Flutter should offer that affordance and similar niceties in the Flutter framework.

![](/images/posts/what-belongs-in-flutter/tweet.png)

The conversation included some people who agreed, and some people like me who disagreed. It's always much easier to start a disagreement on X/Twitter than it is to resolve a disagreement. Therefore, I'm writing this post to capture some important details about the premise behind this debate.

The conversation revolved around a single example, which illustrates a broader discontent among some Flutter developers. The specific example shows some level of Markdown parsing support in Swift UI's standard `Text` view. The broader complaint is that Flutter fails to ship small but useful tools for improved developer experience (DevX). I'll begin by addressing the specific Markdown situation, and then I'll zoom out to discuss this desire to have Flutter do lots of arbitrary things in the interest of making app development easier for the average developer.

## Parsing and Displaying Markdown
First, let's discuss the specific example of parsing and displaying Markdown in a `Text` widget. This example drove a lot of the conversation, so it's worth a breakdown.

### Solutions already exist
The first thing to know about this debate is that there are a number of packages on Pub that are fully capable of parsing a line of Markdown and displaying it in a `Text` widget.

At the Flutter Bounty Hunters, we built [`super_editor`](https://github.com/superlistapp/super_editor/tree/main), which is a document editing toolkit. Along with that package we have `super_editor_markdown`, which lets you convert an entire Markdown document into an editable document, and then take the final document and serialize it back to Markdown. That said, we're focused on the document level, not necessarily a single line or paragraph of Markdown.

A quick search of Pub reveals a number of options. A package called [fancy_richtext](https://pub.dev/packages/fancy_richtext) supposedly offers the following:

```dart
const FancyRichText(
  text: "Visit the [Flutter](https://flutter.dev) website",
);
```

I can't speak to the robustness of that package, but if it's insufficient you could use [flutter_markdown](https://pub.dev/packages/flutter_markdown), which is published by the Flutter team:

```dart
const Markdown(
  data: "Visit the [Flutter](https://flutter.dev) website",
);
```

If those packages still seem a bit verbose, or require too much configuration, then my team could have a new package published in a day or two that would provide the desired API. The point is, the problem is solved, and even if it's not solved perfectly, the perfect solution would be trivial. This is something that a community package can do for you, and can do it as well as the Flutter framework could hope to do it.

The only cost here is that you need to add the package to your app's dependencies. That's it.

Nonetheless, a number of people on X/Twitter believe that Flutter should include this capability. Let's look at the can of worms that such a feature request would open.

### Yak Shave Analysis
The Flutter team (supposedly) follows a principle of embracing the yak shave. This means that a developer should discover the full problem, and solve the full problem. The Flutter team isn't in the business of solving half a problem. So what kinds of questions would a member of the Flutter team ask as he works to determine the final scope of the new feature?

#### How much Markdown?
The motivating example shows a link encoded in a short, single line of text. What are the implications of this? Should Flutter only support Markdown link encoding? Surely if Flutter ships Markdown link encoding then it's only a matter of minutes before somebody requests support for bold, italics, and strikethrough - for the exact same reason that someone requested link parsing.

The example shows inline Markdown syntax, but a `Text` widget might contain multiple paragraphs. Should Flutter support block-level syntax, such as headers, list items, and block quotes? What about horizontal rules and images, where do they fit in? How much of the Markdown spec should be supported, and why?

#### Markdown flavors
It turns out that the core Markdown spec, while useful, rarely meets the needs of an application. There are many capabilities that the core syntax doesn't support. For example, at the inline syntax level, changing the color of text isn't supported. Underlines also aren't a part of the core syntax. For these reasons, various flavors of Markdown exist, such as the "GitHub" flavor. Should Flutter ship support for these flavors, too?

#### Markdown extensions
No matter how much syntax Flutter ships, someone will want a custom syntax. This happens all the time with apps that make significant use of Markdown. Should Flutter offer hooks to add custom syntax parsers?

#### Why is Markdown special?
We've given a lot of thought to Markdown parsing. But why? I mean what's special about Markdown? Sure, Markdown is popular, but so is HTML. In fact there's much more HTML in the world than Markdown. If Flutter is going to parse Markdown, shouldn't it also parse HTML? And if Flutter is going to parse HTML, then that means that Flutter essentially knows how to parse XML, too.

#### Where we end up
By the time we chase down all the reasonable developer requests and use-cases, we end up shipping a fully-featured Markdown parser and HTML parser. That's a lot of new responsibility for the Flutter team, and none of that responsibility is actually about user interfaces. Imagine joining a team to work on a graphics system and instead you end up writing a Markdown parser!

Moreover, these parsers would then bloat the binary size of every Flutter app in the world, despite the fact that most of the apps don't need this functionality.

This is a pretty silly place to end up.

#### Then don't implement that much stuff!
The counterargument to the yak shave above is the idea that Flutter can just sprinkle in support for a few inline Markdown syntaxes and then call it a day. Flutter could ship support for links, bold, and italics, and then stop the work. It would be a small development effort and minor maintenance. So why not do it?!

It's technically possible to implement just a few inline Markdown syntaxes. I can't argue against that. Flutter absolutely could make that decision. And it would piss off a bunch of people.

You see, just because you might be one of the developers who's content with links, bold, and italics, doesn't mean there aren't many other developers who aren't. You're satisfied - they're not. Other developers will file issues to add support for things like underlines and text color. When they do, they'll refer back to this work on links, bold, and italics. They'll point out that if Flutter was willing to solve those problems, then Flutter should be willing to solve functionally identical problems like underline and color. And you know what? Those developers would be right!

Asking Flutter to implement an arbitrary piece of a larger problem is to say that your needs are the definition of Flutter's bounds and other peoples' needs aren't relevant. That's obviously an approach that can't last for any time at all. It's totally unacceptable. There must be a guiding principle that explains why one thing gets implemented and another thing doesn't.

An evolution of the "solve only my needs" perspective is the "solve the needs of the 80%" perspective. In other words, if 80% or more of the community wants something, then Flutter should build it. But this is just a repackaged version of "solve my needs" which is aimed at the common belief that a majority vote somehow makes something correct. The reality is that the other 20% matters, too. The other 20% bet on Flutter, just like you. They have a product and customers, just like you. They deserve service, just like you. Just because you were lucky enough to end up with a product that sits in some kind of majority position doesn't mean that you deserve special application APIs and others don't. Moreover, the future power of Flutter is based on how people push the bounds of Flutter, today. If Flutter focuses on the 80% majority, then by definition, Flutter will fail to facilitate every app and package that's working to expand the capabilities of Flutter. Because those apps and packages, by definition, will be among the fringe use-cases, because they're innovating. 

The partial support approach sounds good at first, but it quickly becomes a disaster. Which is why, by the way, Flutter tries to embrace the yak shave.

### Embrace community packages
The obvious answer here is to stop fixating on the seconds that it takes to add a package to your app. The solution is out there - use it! It's really not a big deal.

Over time, as you collect a number of packages, you might find some packages don't get enough updates, or they're so narrow in focus that your pubspec becomes messy. These frustrations are real, and I get it. It's still a relatively small price to pay, and these are frustrations that can be resolved through community engagement.

## The broader DevX problem
The inline Markdown example represents a broader discontent in the Flutter community about this concept of a UI toolkit providing a great developer experience (DevX). This debate specifically focuses on the availability of simple APIs that implement abilities beyond that of core user interface concerns.

For example, the Markdown parsing use-case wasn't really about rendering text. It was about parsing a particular text markup syntax. The result of that parsing operation would be the same `TextSpan` structure that's always used to render links, bold, italics, etc. Parsing Markdown might be an "app" feature, but it's not a "UI" feature, and Flutter is a UI toolkit.

This situation and rationale plays out again and again with topics like theming, databases, local storage, notifications, payments, etc. When taking all complaints into consideration, we end up with a simple demand:

> I want Flutter to make everything about app development easy, simple, and concise.

That demand cannot be met.

#### Appreciate the scope of the problem
The Android team is responsible for the full vertical DevX related to Android app development. That team is probably 10x larger than the Flutter team (or more). Nonetheless, the Android API experience has always been terrible. The tooling has improved, but still isn't particularly simple or easy to use. The standard development practices include a huge amount of ceremony that takes time, but fails to deliver value.

On the iOS side, there's probably an iOS team and a separate XCode team. I would imagine that each of those teams, individually, are probably larger than the Flutter team. Their collective effort produced many years of horrible `UIView` and `ViewController` based user interfaces. And to this day, XCode is the most error-prone and unintelligible build system around, not to mention an ever-frustrating IDE. Even Swift UI, with all of its fan fare, still quickly reveals the complexity of `UIKit` if you dig just a little beneath the surface of superficial Swift UI `View`s.

Assume a similar pattern for developer experiences on Mac desktop and Windows.

Why do I mention this?

I mention this because if larger teams of developers, focused exclusively on a single tech stack, which they control, can't produce a perfect DevX, then how in the world could Flutter do that for ALL OF THEM? They can't. It's a fool's errand.

#### The community is the only hope
The reality is that the only path to a great DevX across all platforms with Flutter is to fully embrace the community. Use packages, file issues against packages, contribute to packages, build packages, fund others like the [Flutter Bounty Hunters](https://flutterbountyhunters.com) to build packages. Do something to help the cause!

It won't be glamorous, or easy, or quick, but it's the only option if Flutter is to have a future. The same would be true for any other serious attempt at a portable user interface toolkit. We need the core team to ensure that all Flutter developers have the necessary primitives, and then it's the job of the rest of us to deliver use-case-specific packages to help our fellow Flutter developers.

### A meta-package for ease of use
For some developers, this whole issue boils down to the ability to start a new project and immediately start calling a bunch of non-UI behaviors without adding a bunch of packages. To me, this issue seems overblown, but it seems like there's an easy enough solution.

Every project that you create already includes a few dependencies within it. Adding one more to a new project is trivial. So why not create a meta-package in the community, which contains all these smaller packages that do the things you think every app needs to do? In fact, if such a meta-package were created, the Flutter team might consider adding a project generation template that automatically includes the package for you.

Imagine starting a new Flutter project like this:

```shell
flutter create --template=app_devx my_app
```

Then you check the `pubspec.yaml` for your brand new project and you find this:

```yaml
dependencies:
  app_devx: v4.2.5
```

This `app_devx` package includes all the standard stuff you want for a typical app. So you're able to immediately go into your widget tree and do something like this:

```dart
@override
Widget build(BuildContext context) {
  return MdText("Visit the [Flutter](https://flutter.dev) website");
}
```

Now you have your generic app development convenience without needing to find or add any packages. Your project came ready made with the knobs and dials that you previously requested from the Flutter framework. From your perspective, it's as if these capabilities were implemented by Flutter.

So let's get creative. Instead of always arriving back at the conclusion that this one team has to figure out everything, let's instead figure out how to use the community to get to an equivalent result. If we spent as much time building as we do complaining, I bet a lot of these problems would already be resolved.