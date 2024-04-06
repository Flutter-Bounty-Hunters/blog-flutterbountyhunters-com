---
title: The builder pattern should be avoided in Flutter widget trees
description: Builders in widget trees are becoming popular. You should avoid this approach. This is why.
publishDate: 2023-06-12
oldPublishDate: June 12, 2023
author:
  name: Matt Carroll
  role: Chief
  avatarUrl: https://secure.gravatar.com/avatar/2b519036dc508c11b0db3463fffbd8ff
headerImageUrl: https://firebasestorage.googleapis.com/v0/b/flutter-bounty-hunters.appspot.com/o/blog%2Fthe-builder-pattern-is-a-terrible-idea-for-your-widget-tree%2Fheader.png?alt=media&token=4797363a-82d8-4548-813f-020f3e569e83
previewImageUrl: https://firebasestorage.googleapis.com/v0/b/flutter-bounty-hunters.appspot.com/o/blog%2Fthe-builder-pattern-is-a-terrible-idea-for-your-widget-tree%2Fpreview.png?alt=media&token=3bcb2866-f41f-4314-b99f-0dbc16ef344c
---
<br>

---

Hi! It's me from the future. I wanted to let you know that I made some edits to this blog post. There was a lot of negative response on Twitter to some of the ways that I characterized other developers' love for other UI toolkits. There was also concern that some of my social critique was getting in the way of the primary Flutter message. As a result, I've reworked some of the wording in this post, and I've removed a couple sections. If you're just here for the Flutter widget talk, this version of the post is for you.

However, I still stand by the [original post](/the-builder-pattern-is-a-terrible-idea-for-your-widget-tree_original). So if you enjoy social critique, in addition to code critique, you're welcome to read the original. Consider this your trigger warning.

---

With few exceptions, Flutter widget trees have always been declarative. You “declare” the structure of the tree, instead of “generating” the tree. Your code is the UI structure, and the UI structure is your code. This direct connection has been hugely beneficial to help developers learn how to use Flutter, and to quickly read and understand other developers’ code. Unfortunately, there's a growing trend to add imperative builder patterns within widget trees for widget composition. You should understand the cost of this behavior before you consider adopting it.

## What is a builder pattern and how does it apply to widget trees?
The builder pattern is nothing new. It’s been a part of programming design patterns for decades. The builder pattern is an approach whereby a configuration is built up across some number of sequential methods.

Here’s an example of a builder pattern that’s used to configure a document editor within a Super Editor test suite:

```dart
final testContext = await tester
    .createDocument()
    .withSingleEmptyParagraph()
    .withEditorSize(const Size(300, 300))
    .pump();
```

In this example code, our builder configures a document with a single, empty paragraph, within an overall editor size of 300px by 300px, and then pumps the widget tree so the test can work with the editor.

There’s nothing inherently wrong with the builder pattern. As you can see, I make ample use of the builder pattern. But only when the builder pattern solves a real problem. In this case we’re saving multiple assignments, and a number of re-declarations. Moreover, the people who read and write this code don’t care, at all, about what those assignments might look like. The objects that we’ve hidden don’t hinder any typical interaction with this code. When multiplied across thousands of tests, we’re saving a dramatic amount of code, and making it even easier to understand the intention of the code.

Now let’s look at an example of a builder pattern within an otherwise declarative widget tree.

```dart
Widget build(BuildContext context) {
  return const Text("Hello, world")
    .padding([Edge.leading, Edge.vertical], 20)
    .padding([Edge.trailing], 8);
}
```

I have deep concerns about this use of a builder pattern, as I'll explain in the remainder of this article.

## Not solving a real problem
First, it’s important to recognize that this use of builders in widget trees isn’t solving anything. There’s no problem here to begin with. To illustrate this point, let’s look at equivalent widget trees, back-to-back.

```dart
Widget build(BuildContext context) {
  return const Text("Hello, world")
    .padding([Edge.leading, Edge.vertical], 20)
    .padding([Edge.trailing], 8);
}

Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right: 8),
    child: Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Text("Hello, world"),
    ),
  );
}
```

This builder approach has been promoted, at times, as cleaner, shorter, and a general consensus for the future of declarative UI toolkits.

But these promotions still don't identify a clear problem.

The fact that the traditional declarative tree uses a few more lines, two of which are just parentheses, isn’t a problem. One might hold the preference that it’s important to minimize line count everywhere, but that’s just an opinion. There are still costs you pay in other areas for optimizing in that manner. And it’s not an aspect of Flutter that’s holding anyone back.

One might feel that the builder approach is “cleaner”. I personally disagree. But regardless, we’re back to stylistic preferences, not objective problems. A sense of “cleanliness” doesn't provide a mechanism for understanding the cost of the problem, nor the cost of the "solution".

One might long for this style of UI programming because they come from a technology that uses it. But crossing toolkit boundaries will always require some change in approach. If a toolkit buys into the idea that it must match the behaviors of other toolkits, then all toolkits would converge, with 5-10 different ways to accomplish any given goal.

There simply isn't a clear problem statement to warrant the addition of this approach. But there are areas of concern. There are ways in which this approach can hurt the community.

## Creating new problems
I’ve outlined the ways in which the this builder pattern is heavily focused on stylistic details instead of observable problems. One might point out that it’s fine to embrace different styles. And that’s true. Unfortunately, these builders aren’t _just_ a different style. They create new problems. And those problems will be exacerbated over time as more developers embrace this pattern.

### Screwing with readability
Despite the fact that some developers consider the builder pattern in widget trees to be “cleaner”, the truth is that it creates an oscillating reading order that some developers will find to be cumbersome and confusing. Reading large swathes of code with builders requires constant flip-flopping of the mental model.

Let’s look at a slightly expanded version of the earlier widget tree with builders.

```dart
Widget build(BuildContext context) {
  return Scaffold( // 1
    body: Container( // 2
      child: const Text("Hello, world") // 5
        .padding([Edge.leading, Edge.vertical], 20) // 4
        .padding([Edge.trailing], 8), // 3
      ),
    ),
  );
}
```

Notice the numbers I added in comments to the right of each widget declaration and each builder method. Those are the relative descendant levels of each widget in this tree.

Do you notice anything about those numbers?

In a normal, declarative widget tree, you’re always reading from the outside, in. As you read down the tree, you read in a monotonically increasing depth order.

In an imperative builder segment, the reading order is reversed. You’re now reading from the inside, out. As you read down the imperative method calls, you’re reading a monotonically decreasing depth order.

By combining imperative builders with declarative widget compositions, you’re forcing the reader to perpetually jump between an outside-in mental model, and an inside-out mental model. Some developers might find this easy. But many other developers will find this difficult, tedious, and confusing. We’ve now arrived at an objective problem, created by this “cleaner” builder approach.

Even if this information about build order doesn’t convince you that this pattern creates a problem, then consider the simple fact that we’re at least doubling the number of ways that something is done. When we have an existing approach, which allows us to accomplish our goals, and then we add a second approach, which doesn’t extend our abilities, we’re increasing complexity and confusion without generating value. That, in itself, is also a problem.

### It's unclear what's being composed
I draw an important distinction between the declarative nature of widget composition, and the imperative nature of these builders.

The important part about the declarative nature of a widget tree is that your code **IS** the result, and the result **IS** your code. There’s no magic that’s hidden from you. You write a tree of constructors, which directly yields a tree of widgets, and those widgets determine your UI. What’s the mapping from your widget constructors to the widget objects? It’s one-to-one. Every widget constructor that you declare will yield a widget of that exact type, configured with those exact properties. You aren’t “generating” the widget tree, you’re “declaring” it.

```dart
return SizedBox(
  child: DecoratedBox(
    child: Text("..."),
  ),
);

// Produces a widget tree at runtime that looks like:
//  - SizedBox
//    - DecoratedBox
//      - Text
```

The builder pattern has no compiler-guaranteed direct relationship to the widget tree. The best you can hope for is that a developer chose a name for a builder method, which reflects the name of the top-level widget that’s produced by the builder function. Again, there’s absolutely no technical enforcement of this policy, it’s just what you hope for.

Let’s revisit the simple padding example:

```dart
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      child: const Text("Hello, world")
        .padding([Edge.leading, Edge.vertical], 20)
        .padding([Edge.trailing], 8)),
    ),
  );
}
```

Based on the code above, what’s the exact widget tree that you’re sending to the Flutter framework? It’s impossible to answer this question, without reading the source code of the `padding()` method. Of course, we hope that appropriate documentation makes this clear, but the compiler can’t read documentation. The important point here is that your traditional, declarative widget tree is the direct manifestation of what’s sent to the Flutter framework. But these builder methods create a separation between you and the actual widget tree. You don’t know what you’re building unless you read the source code of every builder method.

Some developers might argue that this problem isn’t new. Given that one widget can build an entire subtree of other widgets, Flutter developers are always working with hidden widgets. Why is this any different? I would concede that, at times, Flutter developers do need to jump into the source code of a widget to see the subtree that it builds. It’s also true that most of the time, we don’t need to. Our knowledge of the top-level widget that we compose is sufficient. But these builders obscure even the top-level widget. In fact, they don’t just obscure the widget that they return - these builders might return completely different widgets based on different conditions, which are invisible to you from outside the method. My point isn’t that widgets and builders are completely different, but that builders create additional obscurity beyond that of traditional widget composition.

Let’s look at what happens when the builder pattern is used for something a little more complex than replacing a simple `Padding` widget. The following is an example pulled directly from the `flutter_animate` package README:

```dart
Text("Hello World!").animate()
  .fadeIn() // uses `Animate.defaultDuration`
  .scale() // inherits duration from fadeIn
  .move(delay: 300.ms, duration: 600.ms) // runs after the above w/new duration
  .blurXY(); // inherits the delay & duration from move
```

What do each of these methods return? Is anything mutated across them? What’s the final output? What’s the widget tree structure that you’ve just sent to the Flutter framework?

We have absolutely no idea! We just hope that it works and that we never need to know what’s really happening.

Note, this is only a slightly more complicated example than the earlier padding example. And yet, with this little bit of added complexity, we’ve completely blown away any knowledge of the widget tree that we’re building. It’s gone. Without scouring the source code for every single method in these imperative chains, you simply don’t know what widget tree you’re generating.

Moreover, even if you start jumping into the source code for these imperative methods, you’re now responsible for becoming a human widget runtime. You have to remember what the earlier methods did, so that you can understand the impact of later methods. This mental complexity adds up FAST!

As far as I’m concerned, this is not a declarative approach to widget composition, and it’s many headaches waiting to happen. These builders promote the kind of black box mentality that we’ve seen in traditional Android and iOS development. Developers will blindly use these tools, but the moment anything goes wrong, those developers will be dependent upon the package author to understand what they did wrong. The developer using the tool can’t make heads or tails of what they’re actually doing with the tool. It either works perfectly, or it’s hopelessly broken. We **do not** want a culture of mass dependency on a small number of black boxes.

## The counter points
Some counter-arguments have been made about my opinion towards widget builder patterns. Let's address a couple of them.

### But it’s still declarative!
I’ve described this approach as imperative, but others have emphatically called it declarative.

First, I’ll extend an olive branch to those people. Yes, this builder pattern approach is still declarative **UI programming**. That’s true. You express the UI result that you want, and then somehow it’s delivered to you. That’s declarative UI programming.

However! This approach is not declarative **widget composition**. You’re no longer declaring the widgets you want, you’re generating them. This might sound like an irrelevant point. Who cares about declarative widget composition as long as you have declarative UI programming, right? Wrong.

The widget tree is THE handoff point between your code, and the Flutter framework. The whole widget tree is essentially one big order for a user interface, and Flutter fulfills that order. Flutter will do exactly what the widget tree tells it to do. Nothing more, nothing less. The point at which anything goes wrong with your Flutter UI, that issue ties back, in some way, to what you put in your widget tree.

Today, you can see all the widgets in your tree. You know exactly what you’re ordering. You might spend a few extra lines of code to retain that clarity, but you gain confidence that you know what you’re ordering from the Flutter framework. You’re also able to read that order in a consistent outside-in composition. No guessing or reorientation is required.

The builder pattern approach adds an entire layer around your widget tree. It’s impossible for you to be sure what you’re sending to Flutter, without reading the source code of every one of those methods. And I’ll repeat again, this approach isn’t going to be limited to the occasional padding. As with any social trend, if this becomes popular, you will see these obscuring imperative composition calls **everywhere**. They will be used for the most trivial of things. Because it’s popular.

To the extent possible, you want to be able to see the widget tree that you’re submitting to the Flutter framework. This direct connection between your non-imperative declarations, and the Flutter framework, is an immense value. Don’t take it lightly.

### But we already do imperative stuff in widget tree declarations!
It’s been mentioned that Flutter developers already do imperative things in the widget tree, e.g., generative loops. That’s true.

```dart
Widget build(BuildContext context) {
  return Column(
    child: [
      for (int i = 0; i < 5; i += 1)
        Text("Hello, #$i"),
    ],
  );
}
```

There’s definitely a balancing act between declarative and imperative widget composition. I’m not here to argue for some kind of purity. That’s why I gave you concrete descriptions of the problems associated with this builder pattern proposal in widget trees.

So why might I be OK with for-loops and if-statements inside the widget tree?

Loops and conditionals were added to widget trees to solve a very real problem. Developers were dedicating a lot of code at the top of their build method to generate widgets that they’d later insert within their primary tree.

```dart
Widget build(BuildContext context) {
  final children = <Widget>[];
  for (int i = 0; i < 5; i += 1) {
    children.add(Text("Hello, #$i"));
  }
  
  return Column(
    child: children,
  );
}
```

Given the old way, and the new way, which of these two approaches makes it easier for you to see what’s actually going into the widget tree?

Somewhat ironically, placing imperative widget generation inside of the widget tree actually makes the widget tree more declarative than it was before. We achieve the same goal, with the same motivation, with even greater clarity about the widgets that we’re composing.

This is an easy call when we begin with a real problem. But, there is no similar problem being solved by placing builder patterns in widget trees.

## Summary
The use of imperative builders within declarative widget trees is a growing trend. It’s spreading through social media and through promoted packages.

The use of imperative builders within widget trees don’t extend the ability of Flutter, nor do they fix any meaningful Flutter problems.

The harm of imperative builders is significant, and likely. Builders create unpredictable depth orders, harming readability, and increasing confusion. Builder names have no compile-time relationship to the widgets they generate - this requires developers to read a lot more source code, and also to behave like a human widget runtime. Builders, as a widget tree pattern, won’t relegate themselves to the periphery of development. If they become popular, they will infect packages, within packages, within packages. The direct complexity of this pattern will be multiplied by orders of magnitude as that complexity moves deeper within our package ecosystem.

Flutter has many real shortcomings. There are plenty of places to dedicate our attention, and to help build a better future for Flutter. I’ve spoken about many of them. But we should begin with crystal clear problem statements, generate all possible solutions, and then pick the least bad option. With regard to builder patterns in widget trees, there is no clear problem statement, no alternatives have been proposed, and little to no analysis has been done on the costs of this approach.

The Flutter community should reject this pattern, and fight to retain the beauty of Flutter’s existing simplicity.
