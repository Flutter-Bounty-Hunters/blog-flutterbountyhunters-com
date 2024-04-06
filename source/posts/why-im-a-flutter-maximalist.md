---
title: Why I'm a Flutter Maximalist
description: Flutter should be used for all user interfaces in the world. Here's why.
publishDate: 2024-03-06
oldPublishDate: June 12, 2023
author:
  name: Matt Carroll
  role: Chief
  avatarUrl: https://secure.gravatar.com/avatar/2b519036dc508c11b0db3463fffbd8ff
headerImageUrl: https://firebasestorage.googleapis.com/v0/b/flutter-bounty-hunters.appspot.com/o/blog%2Fwhy-im-a-flutter-maximalist%2Fheader.png?alt=media&token=3ce01d81-774f-46d2-a824-f0296b96a6bd
previewImageUrl: https://firebasestorage.googleapis.com/v0/b/flutter-bounty-hunters.appspot.com/o/blog%2Fwhy-im-a-flutter-maximalist%2Fpreview.png?alt=media&token=530b1e4b-1aff-42a5-95c8-0cb5adfce356
podcastEpisodeId: 150f7e6b-2b39-418e-9e3f-53321239d1c1
---
Is competition a good thing? When I tell developers that Flutter should be the primary 
user interface toolkit for all user interfaces, I often receive a knee-jerk response 
about how important it is to have competition. Developers push the assertion that it’s 
preferable to have a bunch of competing UI toolkits, because “competition is good”. 
You know, kind of like “God is good”. It’s axiomatically true. Whatever competition 
yields, it must be better than the alternative, and we should preserve competition 
no matter the cost. But this is wrong. Competition is good, unless it isn’t.

For those who think competition produces the best results, help me understand the last 
15 years of mobile app development. At one point we had mobile phone competition 
between iPhone, Android, Windows Phone, and Blackberry. The mobile app SDKs were 
atrocious then, and they’re atrocious now, fifteen years later. We began with four 
competitors. Now we’re down to two. Each year, Google makes various announcements 
about the Android SDK. Most of those announcements are celebrations around making a 
terrible thing slightly less terrible. The most common announcement from the iOS team 
is that they’ve added some OS feature that Android had since Gingerbread. Or, equally 
prolific, are the announcements about revolutionary innovations in the area of emojis. 
So competition. Much wow.

Even the honest efforts to innovate in Android and iOS have been horror shows. Each 
platform migrated to a modern language. Kotlin and Swift, respectively. Well, the 
word migrate is misleading. It’s not a migration, it’s an amalgamation. Hundreds of 
millions of lines of Android code are still written in Java. The same is true for 
Objective-C. The attempt to move to a modern language has instead become a requirement 
to maintain knowledge of twice as many languages at all times. The same problem is 
playing out with Jetpack Compose and Swift UI. Rather than make a hard jump to a more 
effective way of operating, these “modern UI” toolkits introduce all sorts of 
complexity to remain pluggable with the old, cludgy, cumbersome UI toolkit from 2008. 
Sure, these app SDKs are competing to improve mobile development, just like Democrats 
and Republicans are “competing” to improve the country.

For my web developer friends, perhaps you can interject with the wonderful revolutions 
brought forward by competition in your space? I suppose I should start with an honest 
compliment for the web. They brought us declarative, compositional UI. For that, I’m 
honestly grateful, and I commend their efforts in that area. But now, back to the 
competition dumpster fire!

There is no industry in the world as competitive as that of web frameworks. Every 15 
minutes a new JavaScript framework is announced. If web developers had a nickel for 
every time they threw away perfectly good skills in favor of a new shiny object, 
they’d be long-since retired. With so much competition, surely browser-based 
development must be lightyears ahead of everything else, right? Wrong. The web boasts 
an incrementally better developer experience than mobile, in certain regards, and a 
worse experience in others. Web toolkits typically provide more composable and 
granular APIs than Android and iOS, giving web developers greater opportunity to paint 
custom interfaces. On the other hand, painting interfaces on the web is always 
reduced to HTML and CSS (Canvas painting isn’t ubiquitous yet), which are inherently 
limited, and very slow to change. Web frameworks use build systems that are more 
dependable. But those build systems require way more complicated configuration than 
Android and iOS. And, of course, the elephant in the room - why aren’t most mobile 
apps comprised of web views? It’s because, to this day, a web experience on mobile 
devices simply doesn’t feel like what users want or expect. After more than a decade 
of trying to make mobile web mainstream in app development, it remains the red-headed 
stepchild of the mobile world. Even Electron on desktop draws criticism and complaints. 
Thus, the web might beat Android and iOS development along certain dimensions, but if 
competition were inherently good, Android and iOS wouldn’t even be in the same 
conversation as web. Web development would literally be 1,000x better along EVERY 
dimension, as compared to Android and iOS. But it’s not. The web is a frothy mess. 
It’s the epitome of toxic competition.

Now, back to Flutter. Where was the competition that prompted the creation of Flutter? 
Flutter began as an experiment within Chrome. It didn’t even have a clear objective, 
let alone a business model. When Flutter came to market as a UI toolkit for mobile 
apps, Flutter had no market share. Flutter wasn’t fighting to survive. Instead, 
Flutter tossed itself into the market and let people decide what to use. Mobile 
developers gravitated to Flutter, en masse. Not because Flutter was facing stiff 
competition, and not because Flutter was trying to push out the existing solutions. 
No. Developers adopted Flutter because Flutter was an order of magnitude more 
effective for building mobile user interfaces than the alternatives. Flutter was 
better, without trying to beat anyone.

In fact, when I was on the Flutter team, community developers regularly described 
Flutter in terms of React Native. Developers assumed that Flutter was trying to 
**compete** with React Native. The Flutter team always said the same thing (in my words):

“We don’t pay attention to React Native. We’re not trying to compete with React Native. 
We’re working towards our own objectives and we measure our success based on those 
objectives.”

That statement wasn’t just PR nonsense. It was true. We rarely, if ever brought up 
React Native within the team. I don’t recall a single situation where anyone on the 
Flutter team compared Flutter’s performance, or design, or implementation to that 
of React Native. I never heard anyone discuss the goal of taking over React Native 
marketshare. We simply weren’t focused on “competing” with React Native.

If Flutter really had competed with React Native, then Flutter probably wouldn’t 
support Mac, Windows, Linux, or Web, today. We’d be stuck in a world of hand-sized 
rectangles forever! That “competition” would have robbed the Flutter community of 
the majority of the value that Flutter would ever deliver.

The woes of competition aren’t limited to the app industry. In fact, the most 
well-known example is probably the restaurant industry. There are almost as many 
restaurants as there are JavaScript frameworks. So the competition is intense. 
Despite all the frothy competition in the restaurant industry, prices tend to move 
up, rather than down. The big chains keep growing while the mom-and-pop restaurants 
go out of business. And the idea of investing in restaurants is a running gag - or, 
at best, a front for money laundering.

I think it’s fair to say that competition doesn’t always produce the best results. 
And if competition isn’t universally “good” or “superior”, then we must always ask 
ourselves what we’re giving up for the sake of competition. We must ask ourselves 
if it’s worth it.

Based on my history in the UX development industry, I’m a **Flutter Maximalist**. 
Though it sounds completely backward, I believe the greatest gift that Flutter 
can give the world is monopoly. A UI toolkit monopoly gives us unity. It gives us 
true portability. Not just a portable runtime, but portable skills, portable careers, 
portable interests and motivations. Under one tent, we can all work together. No more 
separate teams. No more separate conferences. No more time spent re-learning the same 
abilities with different toolkits. In the UX development industry, the cost of 
competition is too damn high. It’s time to face the music, and acknowledge the 
contradiction staring us in the face. **By constraining UI technologies** we would 
give UX developers the **greatest freedom they’ve ever experienced**. To lose that 
freedom for the sake of “competition” would be a tragedy. Because competition is 
good, unless it isn’t.


