---
title: How to make money building open source Flutter and Dart packages
description: You can make money writing open source code, but you need to run it like a business.
publishDate: 2023-06-17
oldPublishDate: June 17, 2023
author:
  name: Matt Carroll
  role: Chief
  avatarUrl: https://secure.gravatar.com/avatar/2b519036dc508c11b0db3463fffbd8ff
headerImageUrl: https://firebasestorage.googleapis.com/v0/b/flutter-bounty-hunters.appspot.com/o/blog%2Fhow-to-make-money-building-open-source-flutter-and-dart-packages%2Fheader.png?alt=media&token=ddf73170-6475-43ea-a063-cb0ba60cdc28
previewImageUrl: https://firebasestorage.googleapis.com/v0/b/flutter-bounty-hunters.appspot.com/o/blog%2Fhow-to-make-money-building-open-source-flutter-and-dart-packages%2Fpreview.png?alt=media&token=6bbb2d6b-0bb1-4dec-b061-b8a32ba1ad07
---
Recently, I saw a Twitter thread about how “open source doesn’t work” because individual developers never seem to show up and contribute code, and they refuse to fund open source projects. I’d like to discuss the funding part of the issue, specifically. I’m in a somewhat unique position to talk about OSS funding, because my Flutter Bounty Hunters team only works on OSS Flutter and Dart projects. We build our projects with hourly funding. I’d like to provide you with some insights that might help you do the same.

## Companies fund development, individuals don’t
With few exceptions, meaningful funding for OSS projects doesn’t come from individuals, it comes from companies. This isn’t a bug, it’s a feature.

Never forget that you’re an individual, too. How many OSS projects do you pay for? The answer is probably “zero”. There are some understandable reasons for this:

 - There’s no direct connection between your favorite OSS package, and your personal income. Therefore, it’s difficult to assign a monetary value to that package.
 - You’ll be paid to write code whether that package exists or not. You can’t say with confidence that if the package disappears, you’ll be out of a job, or that you’ll lose money. It’s tough to watch your checking account go down when you know you’d be fine without that package.
 - It’s unclear what your personal sponsorship would get you. At $20/mo, a project can’t afford to create anything just for you. The best you can hope for is that your $20 is combined with that from 1,000 other developers, and one of the two features that they build this month is useful for you.

Given the intrinsic limitations of individual funding for OSS packages, individual funding is essentially a “thank you” note, not a business model. We’re not waiting tables, we can’t depend upon gratuity to pay our bills.

Companies face a very different situation when it comes to OSS funding. Consider the following realities for a company:

 - If a solution doesn’t exist yet, a company is absolutely going to pay to create one. The only question is how much, and who builds it.
 - A company is always tracking costs and revenues. They can put a clear dollar figure on the creation and maintenance of an OSS package.
 - A company can either outsource tooling to experts who are ready to build it, or they can setup a hiring pipeline, HR onboarding, and personnel compliance, all to build the same thing.
 - A company’s support of OSS can also operate as an advertising and marketing effort. It can recruit customers and new team members.

The calculus for a company to support an OSS package is much different from that of an individual. Companies need tools more than individuals. Companies have much larger bank accounts to fund OSS than do individuals. There’s no option for companies to completely avoid expenses. Individuals don’t need to advertise or recruit, but companies do.

If you want to build a robust OSS business, you need to prioritize company relationships over individual donations.

## Paid OSS is a job, not a hobby
The moment you start dealing with recurring revenue, you’re dealing with a business. An OSS business is subject to the same dynamics as any other business, so your expectations should be similar, too.

Anyone who builds a business, quickly learns to reject the mantra that “if you build it, they will come”. This mantra is almost never true. Instead, if you build it, and then you tell people, and tell more people, and then tell everyone again, you’ll be lucky to get 3% of those people to purchase your product or service.

Every business, and every person, is busy with their own lives. If you want them to see the value of your creation, you need to shove the value proposition directly in front of their face and hold it there. This is true now, more than ever, because we live in an information age where we’re bombarded every second with more sales pitches than we can mentally process.

### Just because it’s fun doesn’t mean it’s valuable
Demonstrating value to clients first requires the existence of value. Many OSS developers completely miss this point. Any number of OSS packages got started because a developer was sitting at home one night and thought “wouldn’t it be cool if I created X?!”. Then, the developer built the package, published the package, added a “donate” button….and made no money.

What’s the primary mistake in this situation?

The developer started with a solution, instead of a problem. And the developer started with a hypothetical market, instead of a real customer. Startups make this mistake all the time. Not surprisingly, this mistake is exceptionally common among startups with technical founders. Developers love playing with technology, and they delude themselves into believing that a technology is a solution within itself. But it’s not. A technology, much like an OSS package, is only a solution if it targets a real problem.

This is why, for example, there are piles of “state management” packages, networking packages, code generation packages, and dependency injection packages that aren’t receiving any funding. It’s fun to think about these approaches, it’s fun to tinker with the code, the packages might even be used by a number of developers, but at the end of the day these packages aren’t unique solutions to unique problems. They’re a dime a dozen. They’re just hobby projects.

### Start with one client, and one problem
One way to cut through the noise is to focus your efforts on a single client, and solve a single problem. This approach falls under the Y-Combinator advice of “do things that don’t scale”. When you’re getting started with paid OSS, you don’t have an existing business. You’re exploring the space and figuring out what services you should provide. Use this opportunity to do things that wouldn’t work at scale, but will help you discover a path forward.

In our situation, at the Flutter Bounty Hunters, we got our start with a single client - [Superlist](https://www.superlist.com/). We also got started with a single problem domain - document editing in Flutter, with a package called `super_editor`. We spent a long time building out capabilities that specifically helped Superlist achieve their goals. We always tried to keep our APIs generic, but Superlist set the roadmap, because Superlist paid all the bills.

Over time, we gained additional funding clients. First, [Turtle](https://www.turtleos.com/) came along and asked us to build a custom implementation of text fields, which we called `SuperTextField`. Multiple clients would go on to make use of `SuperTextField`, including `Superlist`.

[Clearful](https://clearful.com/) joined the funding efforts for `SuperEditor`, so that Clearful could ship a great journaling experience across multiple platforms.

[Bringing Fire](https://bringingfire.com/) also needed document editing support for a table-top gaming system. In their case, not only did the founder of Bringing Fire help fund `SuperEditor` development, but he also contributed pull requests to the project.

And Clearful wasn’t the only journaling app to help fund a brighter future for Flutter document editing. [Reflection](https://www.reflection.app/) joined the funding list, too.

When the `super_editor` journey began, we knew that document editing was a real problem, because Superlist was a real customer, and they were willing to spend real money for a high quality solution. But we had no idea how many companies, or which companies, would find this problem so severe as to out-source the development of a solution to us. That number still isn’t very high, but it’s larger than one, and it’s definitely larger than zero. We didn’t necessarily secure the maximum up-side with our approach, but we did limit our down-side, which is probably the more important focus for little indie developers like you and me.

### Marketing isn’t optional
One might think that Flutter jobs simply show up at my doorstep. After all, I was one of the first Flutter educators on YouTube. I was a member of the Flutter team for two years. And, all things considered, I’m one of the most capable Flutter developers in the world.

But I still have to work for every Flutter opportunity that I get.

The most valuable place that I market my services is the Flutter Silicon Valley Meetup. It only convenes every 2-3 months, but I show up and present at every one. And I don’t shirk on the presentation quality. I try to always bring a unique topic, delivered in my own personal style.

These Meetups don’t always generate business, but sometimes they do. After my very first presentation at the Flutter Silicon Valley Meetup, I spoke with the CEO of a San Francisco-based startup. Based on our conversations, that startup made a huge bet on Flutter for their apps. I’ve spent the last 10 months doing a high volume of both proprietary and open source work for that startup. They might even become one of the biggest funders of Flutter and Dart OSS packages in our entire ecosystem! It all came from a chance encounter after a Meetup presentation.

Nothing sells itself. You need to show the world what you offer, and why they need it. If you’re not actively marketing your services, then you shouldn’t expect anyone to show up and pay for them.

## You can be an advocate, too!
If you get paid to write code for a company, then you can help improve the OSS market. You’re in a position to advocate for more OSS funding. Take a look at your app. Are there any pieces of that app which aren’t specific to your business? If so, why is your team spending time and money on those tools in-house? Why not have a team, like the Flutter Bounty Hunters, build that for you, and also recruit other companies to help shoulder the burden?

Startup leadership teams, and corporate managers, are laser focused on their roadmaps and timelines. They aren’t actively searching for opportunities to help build OSS ecosystems. But that doesn’t mean they can’t be convinced. You just need to show them that it’s a win-win arrangement.

If you’re in a company where you’re paid to write Flutter or Dart code, see if you can start the conversation. Identify code that’s nothing but a hassle for your team. Make note of roughly how much labor your company spends on those hassles. Then ask your manager, or your director, or your CFO, why you don’t outsource that to the OSS community. You might save your company a lot of money, while also helping to build a better future for all Flutter and Dart developers!

Be the change you want to see in the world.

## Where we go from here
It might seem strange for the Chief of the Flutter Bounty Hunters to show you a playbook to become a paid OSS developer. Why would we increase our own competition?

The reality is, there’s no shortage of developers who are capable of OSS development. Instead, there’s a shortage of companies that understand that they can benefit from funding OSS packages. That’s the real battle.

If every company knew what they could gain by funding OSS packages, then hundreds of thousands of us could make a living building OSS packages. There’d be plenty of work for all of us. Every OSS contribution would directly help the funding companies, each of which would save money on that development, while also making the Flutter and Dart ecosystem more useful for everyone around the world. It’s a win-win-win situation. But as with anything else, you have to shove it in peoples’ faces, and hold it there long enough for them to realize the benefit.

Do you want to be a paid OSS developer? If so, start showing companies why they should pay for open source work. Then, do the work.