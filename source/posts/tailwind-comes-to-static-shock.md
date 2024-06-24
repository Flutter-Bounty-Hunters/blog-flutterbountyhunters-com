---
title: Tailwind CSS comes to Static Shock
description: Static Shock now supports the use of Tailwind CSS to style your static site.
publishDate: 2024-06-24
author:
  name: Matt Carroll
  role: Chief
  avatarUrl: https://secure.gravatar.com/avatar/2b519036dc508c11b0db3463fffbd8ff
headerImageUrl: /images/posts/tailwind-comes-to-static-shock/header.png
previewImageUrl: /images/posts/tailwind-comes-to-static-shock/preview.png
---
Big news for static website styling! Static Shock now supports the use of Tailwind CSS to generate
the CSS for your static site.

## What is Tailwind CSS?
Tailwind is a CSS generation tool that's aimed at facilitating the inclusion of styles directly
within HTML, instead of separately in CSS classes.

There has long been a debate within web design about whether styles should be separated from
content. The standard way of writing CSS leaned into the separation of styles from content. The
revelation of Tailwind is that, often, what you're styling barely qualifies as document content, and
therefore the styles are inextricable from the content. Thus, it's completely fine to write your
content and styles together. In fact, combining styles with content is the default approach for
modern UI toolkits, such as Flutter, React, SwiftUI, and Compose.

## How to use Tailwind CSS
For a full understanding of Tailwind, check [their docs](https://tailwindcss.com). We'll talk about
the most fundamental behavior of Tailwind, to give you a taste.

Let's look at two traditional ways of writing styles. First, the classical approach.

### Classical style separation

Write HTML without any styles, but reference an included CSS class.
```html
<head>
  <link href="/styles/form.css" rel="stylesheet">
</head>

<body>
  <div class="button">My Button</div>
</body>
```

Define styles in a standalone CSS class.
```css
.button {
  padding: 8px 16px;
  background: BLUE;
  border-radius: 4px;
  color: WHITE;
}
```

HTML includes a tag for a button, gives it a CSS class name, but doesn't apply any styles. The HTML
then imports a CSS file, which contains styles for the `.button` class. This is the classical
separation of CSS styles from HTML content.

### Apply CSS directly to HTML
HTML includes a way to apply styles directly to tags.

```html
<div
    style="padding: 8px 16px; background: BLUE; border-radius: 4px; color: WHITE;"
  >
  My Button
</div>
```

The above example applies the same styles as the classical CSS example, but does so directly in
the HTML. This approach lets you work with content and styles at the same time, in the same place.
When writing thousands of lines of HTML and CSS, writing both at the same time is a big productivity
boost.

However, this inline CSS approach is fairly brittle. For an inline syntax, it's very verbose, making
it more difficult to skim files and comprehend the source code. Moreover, CSS doesn't have any
pre-configured styles that might help re-use and conformity across pages.

Enter, Tailwind CSS.

### Inline styles with Tailwind CSS
The following is the Tailwind CSS version of the button from the earlier examples.

```html
<div class="py-2 px-4 bg-blue-800 text-white rounded">My Button</div>
```

Tailwind applies styles in an inline fashion, similar to inline CSS. However, you'll notice that
Tailwind doesn't use a series of keys and values. Instead, Tailwind encodes both the CSS property
and the CSS value into a single name.

 * `py-2`: padding top, padding bottom = 2 * 4px
 * `px-4`: padding left, padding right = 4 * 4px
 * `bg-blue-800`: background ~= BLUE
 * `text-white`: color = WHITE
 * `rounded`: border radius = 4px

The reduction in verbosity for our button isn't massive, but it's improved. The savings
on verbosity tend to grow over time as more and more complicated styles are applied.

Tailwind also provides a verbosity savings when styling user interactions. For example, we can
extend out button to change its background color when the user hovers over it.

```html
<div class="py-2 px-4 bg-blue-800 hover:bg-blue-500 text-white rounded">My Button</div>
```

By adding `hover:bg-blue-500`, the background color changes when the user hovers. Traditional
inline CSS doesn't support selectors, and traditional CSS classes require completely separate
class definitions for selectors like `hover`.

That's a taste of what it looks like to use Tailwind. Let's talk about what's needed to make this
happen.

### How does Tailwind CSS work?
Notice that Tailwind CSS defines inline styles, but it uses the HTML `class` attribute to do it.

```html
<div class="py-2 px-4 bg-blue-800 hover:bg-blue-500 text-white rounded">My Button</div>
```

Where do these classes come from?

Tailwind includes a large number of predefined classes, such as `bg-blue-800`, `text-white`, etc.

However, most styles that you apply will be custom. For example, what if you want exactly 33 pixels
of padding on the right side: `pr-[33px]`? Tailwind couldn't possibly include a CSS class definition
for every pixel value of every property. That would require millions of CSS classes.

Instead of including all possible CSS classes, Tailwind inspects your HTML, finds all the Tailwind
classes, and then generates the exact set of CSS classes that are needed for your website. This
means that Tailwind has a code generation phase. Thus, integrating Tailwind with a project means
running the Tailwind tool to read your source code and generate the final CSS for your website.

## Using Tailwind with Static Shock
Static Shock is a static site generator, which means that Static Shock is one big transpilation
and generation step. Static Shock is able to integrate Tailwind by running the Tailwind tool during
the standard Static Shock generation process.

To get started with Tailwind for Static Shock, add the Tailwind plugin:

```dart
Future<void> main(List<String> arguments) async {
  // Configure the static website generator.
  final staticShock = StaticShock()
    // ...existing configuration here...
    ..plugin(const TailwindPlugin(
      input: "source/styles/tailwind.css",
      output: "build/styles/tailwind.css",
    ));

  // Generate the static website.
  await staticShock.generateSite();
}
```

After adding the plugin, there are a few more steps to configure Tailwind for your website. Those
steps are standard Tailwind configuration steps - they're not specific to Static Shock. To add the
Tailwind tool to your project, and configure Tailwind, please see the 
[Static Shock docs](https://staticshock.io/guides/compile-tailwind/).

I hope Tailwind support helps you style your Static Shock websites more quickly and more effectively.
As always, if you discover features that would make Static Shock more useful for you, please
[file an issue on GitHub](https://github.com/Flutter-Bounty-Hunters/static_shock).