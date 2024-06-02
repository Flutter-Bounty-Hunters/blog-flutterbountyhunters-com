---
title: Why Flutter needs to be able to build IDEs
description: Can Flutter be used to build an IDE? Not right now. But it should.
publishDate: 2024-05-11
headerImageUrl: /images/posts/why-flutter-needs-to-be-able-to-build-ides/header.png
previewImageUrl: /images/posts/why-flutter-needs-to-be-able-to-build-ides/preview.png
draft: true
---

I've long planned to build an IDE so that I can write Flutter code with Flutter. Each time that
I've mentioned this goal within the community, I've received pushback that such an IDE isn't
necessary. But even more than that, the Flutter community doesn't even seem to think that Flutter
should prioritize the capabilities that would be required to build an IDE with Flutter. I find
this to be a short-sighted perspective. Let's talk about why.

## The big IDE options are good enough
When discussing IDEs, the first place that a Flutter developer's brain tends to go is to one of
the big three: VSCode, Android Studio, XCode.

![](/images/posts/why-flutter-needs-to-be-able-to-build-ides/the-big-three.png)

The big three IDEs have been used to write and build nearly every Flutter app in existence.
Therefore, obviously, the big three must be enough, right?

Technically, it's true that the existing IDE offerings must be at least "good enough" to produce
all existing Flutter experiences. However, this says nothing of the developer experience in those
IDEs, nor does it speak to the broad set of possible futures that might be unlocked with a Flutter
IDE that's written in Flutter.

I won't list all the ways that a Flutter IDE could help Flutter developers, because the core issue
is actually much deeper than simply building a Flutter IDE with Flutter. Instead, I'll simply
point out that as long as it's prohibitively difficult to build an IDE with Flutter, you'll never
truly know the ways in which your life could be made easier as a Flutter developer.

## The big IDE options are all we need
The big three IDEs are good enough to get us what we've got. But some would also say that they're 
all we need. The world doesn't need any more IDEs for Dart and Flutter development.

To that statement I ask: Have you heard of Dart Pad?

### What about Dart Pad?
![](/images/posts/why-flutter-needs-to-be-able-to-build-ides/dartpad.png)

Dart Pad is essentially a minimal IDE for writing Dart and Flutter code. It was created and
released by Google because the Flutter team believed that the growth of Flutter and Dart
required the lowest friction accessibility possible. So, obviously the big three weren't
actually enough. A new requirement appeared, and so a new IDE needed to be built.

Through most of Dart Pad's history leading up to the end of 2023, Dart Pad was written
with traditional browser technologies: HTML, CSS, JS.

At the end of 2023, Dart Pad was rewritten using Flutter. Thus, not only did the team
deem it necessary to create a new IDE, but the team eventually realized that it made
sense to build that IDE with Flutter.

### What about future goals?
A couple years ago AI was a fringe research focus. Today, AI is the craziest craze our
industry has seen since the .com era. The AI gold rush requires tools, including places
to build and experiment with AI, such as Cursor.

![](/images/posts/why-flutter-needs-to-be-able-to-build-ides/cursor.png)

Cursor is an AI-first IDE for writing any kind of code.

In a world where Flutter isn't adequate for building an IDE, all Flutter developers lose
out on unexpected opportunities, such as the rapid rise of AI.

## Don't fight the last war
Flutter's limitations in the world of building IDEs is similar to Flutter's limitations
elsewhere. The Flutter community thinks its OK that Flutter doesn't do X, because most
developers don't need to build X right now. But this is a losing proposition. This is
Flutter constantly fighting the last war, instead of preparing for the next war.

We don't know what massive opportunities lay just beyond the horizon. Our best bet to
prosper in the future as Flutter developers is to ensure today that Flutter is capable
of painting all pixels, responding to all gestures, and processing all content input.
I believe that the present difficulty associated with assembling an IDE, or anything like
an IDE with Flutter, is a signal that Flutter is missing important capabilities, and
Flutter developers are likely being held back from massive opportunities.

## Filling the IDE hole
Looking specifically at the limitations around IDE development, there are number of
holes to fill. Some of these holes can be filled by the community. Other holes need
to be filled by Flutter, itself.

### Flutter issues

### Community issues
