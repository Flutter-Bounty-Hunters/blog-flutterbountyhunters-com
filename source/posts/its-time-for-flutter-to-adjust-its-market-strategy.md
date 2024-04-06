---
title: It’s time for Flutter to adjust its market strategy
description: Flutter used to say it had no competitors, and that was true. But it's not true any more. Flutter needs to update its approach to marketing.
publishDate: 2023-05-28
oldPublishDate: May 28, 2023
author:
  name: Matt Carroll
  role: Chief
  avatarUrl: https://secure.gravatar.com/avatar/2b519036dc508c11b0db3463fffbd8ff
headerImageUrl: https://firebasestorage.googleapis.com/v0/b/flutter-bounty-hunters.appspot.com/o/blog%2Fits-time-for-flutter-to-adjust-its-market-strategy%2Fheader.png?alt=media&token=6a026b72-8708-4286-b59e-c7e7c24041fc
previewImageUrl: https://firebasestorage.googleapis.com/v0/b/flutter-bounty-hunters.appspot.com/o/blog%2Fits-time-for-flutter-to-adjust-its-market-strategy%2Fpreview.png?alt=media&token=ecd5cbba-2e67-4013-8288-90096388a987
---
It’s hard to believe that it’s been six years since the beginning of Flutter’s broad public usage. In fact, that time has gone by so quickly that it’s easy to get stuck in an early-phase mindset when it comes to Flutter’s position in the marketplace. To ensure that Flutter not only survives, but thrives, it’s important to occasionally reflect on the world around us. We must consider that truths from a few years ago may now be falsehoods, and adjust accordingly. Today, we’ll consider the historical truth that Flutter had no competitors, determine if that statement remains true today, and if it isn’t, what Flutter might do about it.

## The good ‘ol days
In Flutter’s early days, developers loved to compare Flutter to React Native. There was no end to the blog posts, videos, and conversations about whether or not Flutter was going to replace React Native.

The one place where no one spoke about React Native was inside the Flutter team. I was on the Flutter team at the time, and I can confirm that was the case. We weren’t measuring ourselves against React Native, and we didn’t see ourselves as building a React Native replacement.

Fast forward a few years and we were right. Flutter, today, is so much more than React Native has ever been, and more than React Native is ever likely to be. In fact, the only way that React Native could establish itself as an alternative to Flutter, is if React Native starts copying as much of Flutter as possible. Short of that, React Native is just a JavaScript layer for Android and iOS apps.

As such, when Flutter leadership got on stage and said that we weren’t focused on React Native, that we weren’t competing with React Native, that Flutter was blazing its own trail and building its own market, those statements were true and accurate.

This particular “not in competition” mindset towards React Native was accurate. But, also, it was a perspective that applied to one single technology. It wasn’t a statement about Flutter’s philosophy, it was a statement about Flutter’s market position at that moment in time.

Times have changed.

## Welcome to market competition
In the time since developers were comparing Flutter to React Native, a lot of real competition has entered the market. Android created Jetpack Compose. Apple created SwiftUI. Jetbrains created Kotlin Muliplatform. Microsoft created MAUI. And those are just the big tech offerings. A lot more competition is coming out of the woodwork.

These technologies aren’t like React Native. They aren’t a completely different beast from Flutter. In fact, every one of these new technologies have been influenced by Flutter. They were built, in part, as a response to Flutter’s success, and the obvious improvements to DevX and productivity that Flutter delivered. Every one of these technologies is a direct competitor to Flutter. Every developer who adopts Jetpack Compose, SwiftUi, Kotlin Multiplatform, or .NET MAUI will do so **instead** of adopting Flutter.

You might find some exceptions to that rule, on the margin. Occasionally a developer might mix Flutter in with those other skill sets. But in general, the community will view Flutter as a true alternative to those other technologies. They won’t see Flutter as a completely different tool. And they shouldn’t. Because in many ways, those other tools really are flavors of Flutter.

The time has come for Flutter to recognize that it’s not the only game in town. The competition has arrived. The market share is being divvied up. And, unlike Flutter’s current PR messaging, these other tools have come to win.

## What Flutter needs to do to thrive
I like to focus on how Flutter can thrive, rather than how Flutter can survive. That’s because survival isn’t enough. Even React Native continues to hobble along with a weak value proposition and an even weaker technical story. We don’t want Flutter to simply survive. We want Flutter to thrive. For Flutter to thrive, the Flutter team needs to start playing to win.

First, the Flutter team needs to fully acknowledge and accept that it’s competing in a market. The position that Flutter “has no competitors” has gone from an accurate observation, to a head-in-the-sand approach. Flutter **absolutely** has competitors now. Flutter is **absolutely** losing market share to those competitors. Developers are **absolutely** comparing those competitors to Flutter in a zero-sum mindset and placing their bets. If Flutter doesn’t face the competition head-on, then that competition will relegate Flutter to the stands, where Flutter’s self-fulfilling prophecy of “no competition” will come true.

Once the Flutter team fully accepts its current competitive position, it’s time to strategize for maximum market share. This doesn’t mean anything anti-competitive, or underhanded. It means making decisions that are likely to incentivize developers to choose Flutter over the competition, rather than making decisions that are likely to incentivize developers to leave Flutter in favor of the competition.

It’s up to the Flutter team to find strategies for marketshare increases, but here’s some food for thought.

### Watch for complaints
Pay special attention to social media posts that contrast better DevX in competitors vs the DevX in Flutter. This doesn’t mean that Flutter should copy the competitors. In fact, I think the competitors, especially SwiftUI, have made foundational decisions that I would never want in Flutter. But it’s important to notice where developers are unhappy with Flutter, which competitors they like more, and then ask if there’s something within the Flutter philosophy that might quell the complaint.

### Stay up to date with comparisons
Build a portfolio of simple, yet realistic apps, which are built with Flutter, and each of the major competitors. For example: build a full-featured TODO app with Flutter, Jetpack Compose, SwiftUI, and Kotlin Multiplatform. Publish and maintain these apps over time, and make note of the differences, both positive and negative, between the various UI toolkit approaches.

### Meet developers where they are
Expand IDE support, and help the community build a dedicated Flutter IDE. An important competitive approach is to meet customers where they are. Currently customers are using a variety of IDEs. A lot of mental models and muscle memory are built in those IDEs over time. It’s asking **a lot** for a developer to switch. Flutter should integrate with as many IDEs as possible, incentivizing developers to experience the benefits of Flutter, and then offer those developers a Flutter-focused IDE, whenever they’re ready to go all-in on Flutter. That IDE can be built by the community as an OSS offering. The Flutter Bounty Hunters would be happy to help with that.

### Capture the audience
Look for lock-in opportunities. Flutter lacks one of the most important competitive advantages: lock-in, AKA a moat, AKA audience capture. The Android SDK is THE SDK for all devices that run the Android operating system. The iOS SDK is THE SDK for all devices that run the iOS operating system. There are first-party SDKs for Mac and Windows, which enjoy exceptional funding and promotion by the companies that produce the underlying operating system. Even Jetbrain’s Kotlin Multiplatform enjoys audience capture by way of its uniquely powerful IDE market position, along with its major partnership with Google’s Android team. Flutter doesn’t enjoy any such audience capture. Instead, Flutter must scrappily prove itself every day. On one hand, that’s great, because if Flutter ever gets lazy, then Flutter dies. On the other hand, once a market reaches a certain level of maturity, the competitors with audience capture are going to eat your lunch. They’ll relegate Flutter to the ash heap of history.

It’s time for Flutter to start building moats. Here are some options:

 -   Build a portfolio of developer tools, similar to Dev Tools, which make it easier than ever before to profile, optimize, build, and ship an app with a Flutter UI. Do for dev tools what Flutter itself did for UI development.
 -   Help the community build an IDE specifically for Flutter, using Dart and Flutter for the implementation. This IDE can be optimized for Flutter dev tooling, receiving capabilities that are impossible to build for Android Studio, VSCode, or XCode.
 -   Push the community for higher quality education. Flutter maintains a network of Google Developer Experts (GDEs). GDEs function as free marketing and advertising for Google. Instead of just repeating marketing talking points, convert the GDEs into an education machine. Get them teaching serious Flutter concepts. Stop rewarding GDEs for talking about Material 15 at yet another Meetup. Start pushing GDEs to reveal previously misunderstood and unknown aspects of Flutter. Have them push the envelope of what’s possible with Flutter. If they’re truly “developer experts” then this should be an easy ask. If they’re not developer experts, then maybe it’s time to remove them from the program so they don’t water it down.
 -   Extend Flutter’s promise of a “community driven” project to the social media side. The Flutter team puts out occasional videos. Once in a while a member of the community might appear in one of those videos. Flutter can do A LOT better on the community front. The Flutter team should revolutionize their video and social media offering by regularly incorporating a lot of the community’s top contributors and educators. A community-engaged YouTube channel would create new exposure opportunities for the best Flutter developers, incentivizing Flutter developers to become excellent at what they do, and creating a FOMO for non-Flutter developers. The Android team, iOS team, and MAUI team would never feature so many community developers, because those aren’t community projects. They’re products.

Those are a handful of ideas off the top of my head. The Flutter team can have them for free!

## The days of no competition are gone
There was a time when Flutter was the only game in town. Flutter had a few years to establish a global position and prevent any real competitors from taking hold. Flutter could have built such a compelling UI toolkit on all fronts, that no sane developer would bother to choose anything else, let alone build an alternative. But Flutter failed on that front. Maybe it was asking too much. Nonetheless, Flutter never achieved a developer-chosen monopoly.

It’s time for the Flutter team to check the calendar. It’s 2023, not 2019. The competition is here. The market is splitting. The game is on. Flutter can either suit up and get on the field, or Flutter can watch from the stands and dream about what could have been. I vote that we suit up!


