---
title: 10 Things the Flutter Team Should do in 2023
description: Here's our selection of the top 10 things that we think the Flutter team should do in 2023.
publishDate: 2022-12-20
oldPublishDate: December 20, 2022
author:
  name: Matt Carroll
  role: Chief
  avatarUrl: https://secure.gravatar.com/avatar/2b519036dc508c11b0db3463fffbd8ff
headerImageUrl: https://firebasestorage.googleapis.com/v0/b/flutter-bounty-hunters.appspot.com/o/blog%2Ften-things-flutter-should-do-in-2023%2Fheader.png?alt=media&token=46b8aa95-e6dc-4ba8-9741-e7c62ccaeb54
previewImageUrl: https://firebasestorage.googleapis.com/v0/b/flutter-bounty-hunters.appspot.com/o/blog%2Ften-things-flutter-should-do-in-2023%2Fpreview.png?alt=media&token=ba36bb3e-7bf4-41f9-b314-6932632d95f7
podcastEpisodeId: c3d5d1e6-7957-4f53-b588-4b6152a6c942
---
It's nearly the end of 2022. That means it's time to take inventory of what we'd like to see come to Flutter in 2023. At the Flutter Bounty Hunters, we work on a variety of [open source projects,](https://flutterbountyhunters.com) which put us face to face with a diverse set of Flutter limitations. Here's what we think the Flutter team should deliver in 2023.

## 1. Full fragment shader support
Fragment shaders are the ultimate escape hatch for UI rendering. Any painting that doesn't fit in Flutter's standard framework pipeline can be painted to a texture, with a shader. Shaders offer unparalleled rendering performance, pixel-level access, and modification of existing textures, which were painted by other shaders.

Flutter currently ships partial support for custom shaders. However, there are many aspects of common shader languages that Flutter doesn't support. Additionally, Flutter has shied away from runtime shader compilation, which is necessary for shader effects that depend upon details that you discover at runtime.

Shaders are a watershed detail. They force a tough decision. When you need a shader, you really need a shader. With Flutter's partial support for fragment shaders, Flutter adopters are forced either to forego a desired feature, or they're forced to stop using Flutter. As a community, we never want to see that outcome. To avoid tough decisions, Flutter should provide complete fragment shader support for those that need it.

## 2. Glyph rendering
Flutter got its start in the mobile world, where users spend very little time with text content. Mobile apps display short runs of text on buttons, app bars, and cards. There's very little in the world of mobile to push the limits of text painting.

With Flutter now shipping to Mac, Windows, Linux, and web, these large screen affordances invite many document-style user interfaces. Whether you're shipping a productivity app, journaling app, document editor, blog, or email client, you need to display large blobs of text, mingled with non-text content like images and videos. These \"content heavy\" use-cases, which are growing in popularity, require more granular control over how text is painted.

Flutter's existing solution to all text painting is to use `Paragraph` objects to calculate line breaks and position every glyph of text. This works fine for some documents. It fails miserably for others. You see, some document formats already include glyph positioning choices. Text layout is already finished. But Flutter developers are still forced to use these `Paragraph` objects. As a result, these document renderers create, measure, and render hundreds or thousands of `Paragraph` objects per page. This is hugely inefficient and it becomes a bottleneck for performance.

Flutter should expose lower level typesetting APIs. This includes APIs for placing a small run of glyphs within a line, as well as painting one glyph at a time. Not only would these APIs facilitate rendering for existing document formats, but it would also open the door for the community to solve general text flow challenges, such as flowing a paragraph of text around an image.

Text painting is a bottleneck issue for sophisticated desktop use-cases. Flutter should remove that bottleneck.

## 3. Dart FFI multi-threaded callbacks
Dart FFI opens incredible potential for Flutter and Dart applications. If you look hard enough, you can find an existing C implementation for any problem. In theory, Dart FFI expands the power of Dart to include the existing accomplishments of all C code. But there's one critical piece that's missing. Dart can't deal with common C library callbacks.

At the Flutter Bounty Hunters, we've investigated using Dart FFI to integrate various capabilities, such as audio synthesis, as well as using Dart FFI to integrate directly with the Flutter engine binary. We've repeatedly hit a wall with callbacks.

Think about all the places in your Dart code where you accept a callback as a delegate. This pattern is prevelant in every language, including C. For example, in an audio synthesis package, the audio package calls you back to get whatever audio samples you want to play through the speakers. This control is immensely powerful. You're no longer a slave to overly complex and under specified Android and iOS audio APIs. You can literally play whatever sound you want. You can generate audio samples with algorithms or mixers. But not with Dart. Not as it stands today.

When a C package runs your callback, the C package often executes your callback on a background thread. But Dart can't handle this. If you try to access any surrounding information within that callback, Dart blows up. But these callbacks are useless if you can't access any other information in your app. For example, if you're filling an audio buffer, obviously those audio samples come from somewhere else in your code. But you can't access those samples.

This seemingly minor limitation turns out to be a massive bottleneck for Dart FFI effectiveness. For the most part, we've stopped attempting to use Dart FFI to wrap powerful packages because this issue keeps repeating itself. We'd love to see this fixed ASAP.

## 4. Refactor the text input system
Flutter's text input system has worked fine for mobile apps with limited text editing. Today, Flutter is focused on far more than mobile form factors, and Flutter text editing use-cases on all platforms are growing in complexity by the day. It's time for Flutter to step back and reimagine their text input architecture, because it's a problem.

At the Flutter Bounty Hunters, with our work on [Super Editor](https://github.com/superlistapp/super_editor), we have a unique level of exposure to Flutter's text input system. In fact, our work on Super Editor was the forcing function to get Flutter to implement text editing deltas. With the rate that Flutter is breaking Super Editor, it's clear that Flutter has the wrong architecture for its text input system, given current and future goals.

At the highest level, the problem with Flutter's text input system is that is violates the [Open-Closed Principle](https://en.wikipedia.org/wiki/Open%E2%80%93closed_principle). That principle states that code should be \"open\" for extension, but \"closed\" for modification. To achieve this goal, one must design and engineer an API that exposes the natural axes of change, so that future developers can extend the existing behavior without altering the existing behavior. It's easier said than done, but it's worth the effort.

Flutter made two choices that make it impossible to implement the Open-Closed Principle for text input. First, Flutter doesn't provide app-level access to each platform's text input signals. In other words, you never respond to \"iOS text input\" or \"Android text input\", you just respond to \"Flutter text input\". This decision, alone, isn't a massive problem, but it is when combined with the second choice. The \"Flutter text input\" signals are woefully incomplete. There are dozens of text input signals, including on mobile platforms, that Flutter simply doesn't report. As a result, there is exactly one place in Flutter to receive text input signals, and dozens of those signals are hidden from you.

The way that Flutter adds missing text input features is by altering the API of this one, central set of text input signals. Every time that Flutter adds a new signal, i.e., adds a new public interface method, Flutter breaks all implementations either literally or figuratively. Either your implementation ends up with a compilation error, or your implementation silently fails to do the new thing that it's supposed to do.

It's time for Flutter to recognize that every platform includes a similar, but distinct set of text input signals. Flutter currently supports a small fraction of those signals. Flutter will eventually need to support all of those signals. Therefore, the smart thing to do is re-engineer the text input API so that it's open for extension, but closed for modification. That way, the ecosystem isn't constantly processing breaking changes from Flutter, just because one more signal was added.

## 5. Widget toolkits for every platform
One of Flutter's most powerful tools for early adoption was platform widget toolkits. For Android, Flutter boasted a [Material Design Components](https://docs.flutter.dev/development/ui/widgets/material) implementation that was more accurate than the one that was actually implemented for Android. Additionally, Flutter made sure to provide [Cupertino widgets](https://docs.flutter.dev/development/ui/widgets/cupertino) for all the iOS developers who needed to continue to reflect iOS expectations. The investment in these not-strictly-necessary packages paid dividends and paved the way for mass adoption on mobile. The Flutter team should repeat this strategy for all platforms.

Mac and Windows each promote a unique design language and set of common UI components. There should be robust, complete packages that provide the relevant assortment of widgets. There are some community efforts along those lines, but those efforts aren't complete. In a moment, I'll discuss what the Flutter team should do about that.

Linux and web lack a strong opinion about UI components. Linux distributions are so diverse that Linux itself has little to say about typical Linux app interfaces. The web is really \"the browser\". Browsers are diverse, and their chrome has no impact on the visual styling of web pages. As a result, there's no design language for these platforms, but there are common UI patterns that apply to these large-screen experiences. It's important to provide great tools for those patterns, too.

What should Flutter do about this? Should Flutter add three or four more packages to the framework? No. In fact, Flutter should remove Material and Cupertino from the framework and distribute those packages on Pub. Flutter certainly shouldn't add more non-framework things to the framework. In fact, I don't even think the Flutter team should work on these platform widget toolkits.

The Flutter team should pay the community to build and maintain these packages. And I really do mean the community - not just one of the three companies in the world that currently have a special financial relationship with the Flutter team. The Flutter team should establish a budget that pays the existing project maintainers for the top Mac and Windows toolkit packages. Those maintainers should also add more experienced community developers to the effort, to increase velocity.

As mentioned above, platform widget toolkits have already proven themselves as an immensely valuable tool to accelerate Flutter adoption. Those packages are valuable, which means the time invested in those packages is valuable. The Flutter team should pay for that value and then reap the adoption rewards. Moreover, the financial burden doesn't need to be completely shouldered by the Flutter team. The Flutter team can recruit enterprise clients to help with said funding. For example, how about getting Microsoft to pay a few bucks for the Windows-style toolkit? 

At the Flutter Bounty Hunters, we're notoriously opposed to the \"hope and prey (SIC)\" model for open source. Whether it's our team working on paid projects, or another team, we want to see the power of business models applied to critical shared tooling and infrastructure. The Flutter team should start organizing funding for major community projects in 2023, including platform widget toolkits.

## 6. Shared image memory
Flutter is great at working with painting commands, but terrible at working with individual pixels. [Flutter Processing](https://github.com/matthew-carroll/flutter_processing), and it's painting package, [Bitmap Canvas](https://github.com/flutter-bounty-hunters/bitmap_canvas), are highly constrained by Flutter's lack of pixel painting control. 

The most significant issue at the heart of Flutter's pixel painting problem is that the Flutter engine refuses to share bitmap memory with the framework. Of course, we all know that immutability brings a lot of memory safety, and sometimes it brings performance improvements. But when it comes to painting pixels, this memory ownership makes it impractical to use Flutter to paint pixels.

Every time that you want Flutter to display a new bitmap image, including a slightly different version of an existing bitmap image, you need to upload that pixel data into the Flutter engine. This is an asynchronous operation that takes a long time.

Every time you want to change even a single pixel in an image that's in the Flutter engine, you need to download the pixel data from the Flutter engine. This is an asynchronous operation that takes a long time.

Flutter makes it easy to paint lines, curves, rectangles, ovals, and paragraphs on every frame. There's no reason that it shouldn't be easy to set the colors of individual pixels on every frame, too. Flutter should bring us the power of mutable bitmaps that are shared with the engine.

## 7. Platform views on Mac
With our work on [FFMPEG CLI](https://github.com/flutter-bounty-hunters/ffmpeg_cli) and [Cutting Room](https://github.com/flutter-bounty-hunters/cutting_room), we've been waiting years for the opportunity to build a basic video editor with Flutter on Mac. Unfortunately, there's a missing piece that has made this impractical. Flutter doesn't support platform views on Mac.

A platform view is a Flutter widget that renders a traditional platform (Android, iOS, Mac, Windows) view, as if that platform view were a part of Flutter. This is how Google Maps are rendered in your Flutter mobile apps. According to various people on GitHub, video rendering on Mac requires platform views. But Flutter hasn't implemented platform views for Mac.

Flutter should bring platform views to Mac for all the many use-cases which are only possible by displaying standard Mac views in our Flutter layouts.

## 8. Vend textures from Dart
Textures are a uniquely powerful construct in UI rendering. They're kind of like the counterpart to the fragment shaders mentioned earlier. By displaying arbitrary textures, Flutter gives developers the power to use non-Flutter tools to paint visuals, and then display those visuals in Flutter.

On mobile, the [video_player](https://pub.dev/packages/video_player) plugin uses a texture to render video frames. This is because the video_player plugin uses sophisticated existing tools to decode and render video. We wouldn't want the Flutter team to re-invent video rendering. Instead, those video rendering tools render each video frame to a texture. Then, the video_player plugin tells Flutter to display that texture. That's how video gets displayed in your Flutter app.

There's one really annoying aspect of this shared texture capability. Currently, to get a texture that you can share, you need to call special Android and iOS methods to create the texture, and get the texture ID from Flutter. You can't do this directly from Dart.

Now, imagine you're integrating a powerful C package to paint something. With Dart FFI, you talk directly to this C package. You need to give the C package access to a texture, so it can paint the texture. Where do you get the texture? There's nothing that you can call in Dart to create a texture and give you a handle to that texture. Instead, you'd need to add Android, iOS, Mac, Windows, Linux, and Web code to initialize a texture on each of those platforms. Then you'd have to figure out how to give control of that texture to the C package. Assuming that's possible at all.

Flutter should figure out how to initialize and vend shared textures within Dart, in a manner that allows those textures to be painted by packages that are integrated via Dart FFI.

## 9. Compenentize the engine
Flutter began as a mobile UI toolkit. Mobile use-cases only required a small number of visual capabilities, but demanded absolutely tiny binary sizes, so that mobile apps would be quick to download on slow internet connections. Today, Flutter serves desktop UI use-cases, which require all sorts of rendering abilities that aren't needed for mobile. Flutter has a decision to make.

Flutter can take one of three actions moving forward with its engine. First, Flutter can add desktop UI capabilities to the engine, balloon the binary size, and lose mobile developers due to the size of their apps. Second, Flutter can continue to constrain engine capabilities for the sake of mobile binary size, and then fail to achieve general adoption on desktop. Or, third, Flutter can offer different versions of the engine, with different levels of capability, and different binary sizes. From a long-tail standpoint, only one of these options make sense, and that's to offer different versions of the engine.

Consider an example from earlier - individual glyph painting. Very few mobile apps require per-glyph control. Any such APIs would be wasted on nearly every mobile app. But some apps do need this capability. A growing number of desktop apps are likely to want this power over text layout. We're working with a client right now that needs this (ironically, our client needs this for mobile). At the moment, we're reinventing text layout and painting for our client, because Flutter chose to hide those lower level typesetting APIs.

You may not realize this, but every time you change your Flutter version, you download a new compiled Flutter engine. That's the process that shows you the long-running progress bar in your terminal when you type `flutter upgrade`. That pre-compiled Flutter engine is hosted by the Flutter team. At the moment, there's only one version of that pre-compiled engine. But there could be more. If the Flutter team adjusted the engine's implementation so that there were pluggable encapsulation boundaries, the Flutter team could publish 2 or 3 or 4 versions of the engine, all with different levels of capability. Similarly, the Flutter team could provide a web app where you customize your own engine, a la carte. This approach would allow every app developer to individually balance the need for rendering capabilities, with the need for minimal binary size. It's an all-you-can-eat Flutter engine buffet!

## 10. Refocus on the core of the framework
You'll notice a common theme throughout the items raised in this post. They're all about limitations at the core of the framework. We didn't mention anything in this post about creating new Material widgets in the framework, or adding more properties to existing Cupertino widgets, or adding some new, obscure layout widget. We're not talking about tweaking the extremities of Flutter. We're talking about substantive, central improvements.

Over the past few years, I've observed a lot of work within Flutter's user-facing widgets. The framework developers add some properties here, fix some little bugs there, add some if-statements for a new platform here, and alter some internal widget behavior over there. It's a lot of simple stuff that any developer in the community is capable of contributing. But, there are a lot of details in Flutter that only the Flutter framework team can handle. Those specialized tasks get abandoned when the Flutter framework team focuses on the little details on the periphery.

I'd like to see the Flutter framework team focus more on those details which can only be handled by the framework team. If a widget needs some new properties, or a minor bug fixed, then give that task to someone in the community. We'd be happy to contract with the Flutter team to solve the simple stuff, and help the framework team focus on the complex stuff. We'd also be happy to consult with the Flutter team on core API refactoring, such as refactoring Flutter's text input system. But, in both cases, the Flutter framework team needs to decide to prioritize the stuff at the core of the framework, instead of grabbing the low hanging fruit at the periphery.

Flutter's framework labor is so greatly constrained that the framework team must ensure that for each change they make, hundreds or thousands of doors of opportunity open for community developers. Only that level of amplified impact will allow such a small Flutter framework team to continue delivering what the global Flutter community wants and needs.

## Looking forward to 2023
Those are the top 10 items on our minds here at the Flutter Bounty Hunters for 2023. Let's hope that at least some of these issues make it onto Flutter's roadmap. If any of these items are important to you, consider sharing this post with others. The more that these interests are promoted, the more likely that they're taken seriously by the Flutter team.

Have a great 2023, and y'all come back now, ya hear?


