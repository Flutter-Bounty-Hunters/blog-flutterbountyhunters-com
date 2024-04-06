---
title: Let's document Flutter, together!
description: The core of Flutter is tough to read and understand. We can make it better!
publishDate: 2023-06-14
oldPublishDate: June 14, 2023
author:
  name: Matt Carroll
  role: Chief
  avatarUrl: https://secure.gravatar.com/avatar/2b519036dc508c11b0db3463fffbd8ff
headerImageUrl: https://firebasestorage.googleapis.com/v0/b/flutter-bounty-hunters.appspot.com/o/blog%2Flets-document-flutter-together%2Fheader.png?alt=media&token=0b034e7e-b2a9-4818-ba8d-1429021ea348
previewImageUrl: https://firebasestorage.googleapis.com/v0/b/flutter-bounty-hunters.appspot.com/o/blog%2Flets-document-flutter-together%2Fpreview.png?alt=media&token=7478f248-fe38-41fc-adf9-78afd64ab2fa
---
The widgets that ship with Flutter are pretty simple, and they’re pretty well documented. But the deeper you go into the Flutter framework, the more complicated things become, and the less documented they tend to be. This trend is predictable, but it’s unfortunate. The complicated areas of Flutter are precisely the places where clarity is most important. I think we should find ways to work as a community to better document, comment, and clarify the internals of the Flutter framework.

## What’s the problem?
Do you ever get a Flutter error that doesn’t make any sense to you? Do you ever try to root-cause a bug, find yourself in Flutter framework code, and have no idea what it’s doing? Do you ever read through Flutter framework code and your eyes glaze over as you move through a long, winding, conditional, and looping build method? These are all things that happen to me on a regular basis, and these issues are all preventable. The solution is better and more thorough documentation, as well as a focus on readable code.

We can help improve Flutter’s documentation, comments, and code structure. I think we would all benefit, if we did.

## How do we solve it?
The most obvious path to improving Flutter’s documentation and code structure is to start submitting PRs that do just that. If you feel capable of doing such a thing, I recommend that you do.

One word of warning: I recommend that only developers with strong English verbal skills invest time in this. We want documentation and comments that concisely describe important details in accessible ways. Accomplishing this clarity is difficult for many native English speakers. It’s exceptionally difficult for those who struggle with English. Most of the time that I spend reviewing PRs in my own projects is spent adjusting and reworking other developers’ Dart Doc comments. It’s tough to be valuable and concise at the same time.

Aside from individual contributions, I think there are probably opportunities for us as a community to work on some improvements, together. For example, maybe we could use some of the community streams to work together to improve Flutter framework documentation. Audience members could help identify areas of confusion and together we could hash out better Dart Docs, comments, and code structure.

For example, think of all the technical questions that developers ask during a typical Hump Day Q&A stream. What if every time a developer asked a technical Flutter question, the Hump Day streamers went into the documentation, wrote the answer, and then merged the change so that nobody has to answer that question again?

Similarly, with the new found focus on Twitter Spaces, maybe those could also be used to identify areas of confusion, source the answers from the crowd, and immediately put up a PR with the clarifications.

What other ways might we work together to progressively clean up the most critical aspects of the Flutter framework?

### An example
Today I was working on a few custom `RenderObject`s. I’m working on a layout that’s pretty complicated compared to most Flutter behavior. As a result, I kept triggering an error by accessing the `size` property of a child `RenderObject`. It was definitely my fault, but the error message was less helpful than it could have been. It forced me to add more logging on my end to determine which condition I violated.

Here’s the Flutter framework code that triggered the assertion error.

```dart
if (RenderObject.debugActiveLayout != null &&
  !RenderObject.debugActiveLayout!.debugDoingThisLayoutWithCallback) {
  assert(
  debugDoingThisResize || debugDoingThisLayout || _computingThisDryLayout ||
    (RenderObject.debugActiveLayout == parent && size._canBeUsedByParent),
  'RenderBox.size accessed beyond the scope of resize, layout, or '
  'permitted parent access. RenderBox can always access its own size, '
  'otherwise, the only object that is allowed to read RenderBox.size '
  'is its parent, if they have said they will. It you hit this assert '
  'trying to access a child\\'s size, pass "parentUsesSize: true" to '
  "that child's layout().",
  );
}
```

The specific assertion that I triggered was the following:

```dart
assert(
  debugDoingThisResize || debugDoingThisLayout || _computingThisDryLayout ||
    (RenderObject.debugActiveLayout == parent && size._canBeUsedByParent),
  'RenderBox.size accessed beyond the scope of resize, layout, or '
  'permitted parent access. RenderBox can always access its own size, '
  'otherwise, the only object that is allowed to read RenderBox.size '
  'is its parent, if they have said they will. It you hit this assert '
  'trying to access a child\\'s size, pass "parentUsesSize: true" to '
  "that child's layout().",
);
```

This assertion doesn’t make it clear whether the size was accessed by the wrong object, or whether we failed to request permission to access the size. Additionally, if we accessed the `size` from an object other than the `parent` then we’d probably like to know which object is currently registered as the `parent`. Finally, it’s tough to figure out the underlying intention of this assertion with so many conditions combined together.

I put up a PR to refactor the assertion code as follows:

```dart
if (RenderObject.debugActiveLayout != null &&
  !RenderObject.debugActiveLayout!.debugDoingThisLayoutWithCallback) {
  // The Flutter pipeline is currently running a layout pass. 
  // TODO: explain why we care that debugDoingThisLayoutWithCallback
  
  if (!debugDoingThisResize && !debugDoingThisLayout && !_computingThisDryLayout) {
    // This RenderBox is not in the middle of running its own layout, which means some other
    // object is trying to access the size.
    if (RenderObject.debugActiveLayout != parent) {
      throw AssertionError(
        'RenderBox.size accessed by an object that isn\\'t the parent of '
        'this RenderBox. RenderBox.size may only be accessed by the parent '
        'RenderObject. This RenderBox\\'s parent is: $parent',
      );
    } else if (size._canBeUsedByParent) {
      throw AssertionError(
        'RenderBox.size was accessed by its parent, without permission. '
        'If you hit this assert trying to access a child\\'s size, pass '
        '"parentUsesSize: true" to that child\\'s layout().',
      );
    }
  }
}
```

With this change, you get a more precise, useful assertion error depending whether you accessed the `size` from the wrong object, or whether you simply forgot to request the permission to read the `size` property of your child.

I also added some contextual in-line comments to further clarify what we know about Flutter execution by the time we get to those comments. You’ll notice that there’s still a “TODO” in one of those comments because it wasn’t clear to me what the condition intended - a sign that more documentation is needed there, too.

This update may not perfectly clarify the behaviors around accessing `size`, but I do think that it’s an improvement. Flutter developers might be able to root-cause related Flutter bugs more quickly, and readers of the framework might better understand the constraints placed on accessing the `size` property.

## What help do we need?
To effectively cleanup the Flutter framework, I think we need help from the Flutter team. We need the Flutter team to explicitly facilitate the effort.

### Limit test requirements
It’s currently impossible to merge a PR into Flutter without adding tests, unless you get a personal exemption from the project’s tech lead. This policy is important for any actual change to Flutter behavior. But changes to Dart Docs and inline comments don’t introduce anything that needs to be tested. Additionally, adjustments to existing error messages, and even purely structural refactoring, shouldn’t introduce any new behavior. All of the relevant details should already be covered by tests, as per the project’s test policy.

The Flutter team should provide a way to get these non-functional changes merged, without seeking ad hoc exemptions, and without needing to add tests just for the sake of adding tests.

### Educate us when we’re wrong
The motivation for this effort is that the most complicated parts of Flutter have some of the worst documentation, and the least readable code. As a result, we’ll get some details wrong in our Dart Docs and in our comments. We might also refactor code in a way that’s no longer equivalent.

In these situations, we can’t have the Flutter team simply tell us we’re wrong, or that we broke something. We need the Flutter team to extend their understanding, so that we can correct ourselves. This is how the community learns, so that the tiny Flutter team bus factor doesn’t remain so tiny. We can socialize the information, but we need some things explained to us, first.

### Occasionally help get us over the finish line
One of the most consistent shortcomings of the Flutter team is the general refusal to directly help a contributor complete a task. I’m sure all such reviewers have various explanations for this. They’re too busy. It’s not their job. Etc. Nonetheless, I think that community contributions are a give-and-take. When the community does 90% of the work, I think it should be OK to ask the people with the most expertise to lend a hand on the final 10%. That’s true for this effort, too.

If the community provides some great improvements to Dart Docs, comments, and code structure, but that contributor has no idea how to add or update a few tests to comply with contribution policies, I think the Flutter team should consider taking 30 minutes of their time to add what’s needed, and merge the contribution. This isn’t an excuse for developers to avoid writing tests. It’s a recognition that there are times and places where the onus of writing tests so greatly exceeds the depth of the primary task, that it should be OK to ask a Flutter team dev to handle it on their end.

On a related note, I think that the Flutter team should look for opportunities to make it faster, easier, and more clear where and how to write the tests that are needed to comply with contribution policies. I write Flutter tests all the time. I might even be the biggest test contributor to the Flutter test registry. And yet, even I’m not sure where a specific test should be placed these days. I don’t know the Flutter team’s conventions around test implementations or naming. And I’m not aware of any way to quickly write and run a test without pulling down all of Flutter, switching to `master`, downloading that engine, and running the tests locally to ensure they pass.

Imagine all that effort within a PR that could otherwise be composed directly in the GitHub edit window, because you’re making such a minor change.

## Clarity is in our hands
It would be great if the Flutter team devs upheld the same documentation and readability standards in the core of the framework that they do on the periphery. It would also be great if they took code readability a bit more seriously, throughout the framework.

That said, we have every opportunity to correct these issues. The only requirement is followthrough. If we orient the Flutter community around this effort, I think we can get these things cleaned up in no time.
