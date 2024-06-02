---
title: You can now generate static sites with Dart!
description: With a new package called Static Shock, you can generate your static sites with Dart and Pub.
publishDate: 2024-06-02
headerImageUrl: /images/posts/you-can-now-generate-static-sites-with-dart/header.png
previewImageUrl: /images/posts/you-can-now-generate-static-sites-with-dart/preview.png
---
Dart is eating the world. From Flutter user interfaces, to web servers, to CLI tools, and now to
static websites! [Static Shock](https://staticshock.io) is now available on Pub to help you easily 
create, generate, and deploy static websites.

<div style="display: block; margin-top: 48px; text-align: center;">
<iframe 
  title="Generating static sites with Dart and Static Shock | Flutter Bounty Hunters" 
  src="https://www.youtube.com/embed/kAutI-2Flrs?si=Fhuax0GPyX6gY7AZ" 
  width="560" 
  height="315" 
  style="margin-left: auto; margin-right: auto; text-align: center;"
  frameborder="0" 
  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
  referrerpolicy="strict-origin-when-cross-origin" 
  allowfullscreen>
</iframe>
</div>

## What is a static website?
A static website is a website whose content is fully defined at build time. 

Content defined at build time means that your website source directory contains all the articles,
images, fonts, and styles that are needed by your final website build. But there are a few interesting
caveats.

Your articles are defined locally, but they don't need to be written in HTML. For example, with Static
Shock, you can write your articles in Markdown. Static Shock converts that Markdown to HTML for you
when you run a website build.

Your page layouts are defined locally, but you don't need a different HTML file for every article.
With Static Shock, you can use Jinja templates to create a single HTML file that can be re-used for
any number of pages.

Your styles are defined locally, but you're not limited to pure CSS. With Static Shock, you can
write Sass, a more powerful flavor of CSS, which is compiled down to CSS in your final website
build.

Your website is built locally, but you're not limited to hard-coded data. With Static Shock, you
can reach out to internet APIs during the build to obtain data. For example, Static Shock includes
a GitHub plugin, which can load a list of contributors for a given repository. It also includes a Pub
plugin which can query the latest version of a given package on Pub.

Static Shock makes it easy to author and compose a static site, with Dart!

## Why use a static site?
Static sites are inherently limited. Users can't write posts or comments, upload videos or audio, or
even sign up for an account. So why bother?

Many websites can't be built as static websites. They need user generated and dynamic content. But
that's certainly not true for all websites. Think about blogs, guide websites, news websites, and
documentation websites. These websites are all essentially a bundle of articles - and those articles
exist at the time of publishing.

For websites that *can* exist as a static site, they benefit from choosing to do so.

 * Tiny and quick site downloads.
 * Rapid rendering with standard browser technology.
 * No containers, databases, or security rules.
 * Hosting with a vanilla web server.

Constraining your website to a static website can simplify your job and improve the experience for
your website visitors.

## What is a static site generator?
A static site generator is a tool that generates a collection of static files, which are then hosted
as a website (a static site).

A static site generator is a pipeline of steps. The pipeline takes files and data as input, and then
generates HTML, CSS, JS, images, and fonts as output. For example, that pipeline might look like the
following:

 1. Load Markdown pages.
 2. Load images and fonts.
 3. Load data (local and remote).
 4. Load layouts and components.
 5. Render article Markdown to HTML. 
 6. Inject article HTML into layout templates.
 7. Transpile Sass to CSS.  
 8. Write HTML files, CSS files, images, and fonts to final build directory.

Static Shock runs this pipeline for you, and gives you control over what happens in the pipeline
with Dart code.

## Special Static Shock tools
Static Shock ships with a few tools that might be of special interest to you.

 * Markdown authoring format.
 * Jinja template format.
 * Table-of-Contents generation.
 * Pub plugin to get the latest version of specified packages.
 * GitHub plugin to get all the contributors for specified repositories.
 * RSS plugin to generate an RSS feed.
 * Project templates for Flutter and Dart package documentation websites.

## Static Shock in the wild
If you're interested in using Static Shock for your static sites, I'm happy to report that Static
Shock is generating a number of public sites right now. In fact, this website is generated with
Static Shock!

 * [Flutter Bounty Hunters Blog](https://blog.flutterbountyhunters.com): This website!
 * [Flutter Arbiter](https://flutterarbiter.com): Flutter and Dart best practices.
 * [Static Shock](https://staticshock.io): Package documentation.
 * [Super Editor](https://supereditor.dev/): Package documentation.
 * [Flutter Test Robots](https://flutter-bounty-hunters.github.io/flutter_test_robots/): Package documentation.
 * [Golden Bricks](https://flutter-bounty-hunters.github.io/golden_bricks/): Package documentation.

And many more on the way!

## Getting started with Static Shock
To get started with Static Shock, the best resource is [staticshock.io](https://staticshock.io).
But let's take a look at some basic usages.

Static Shock includes a command-line (CLI) tool to generate your initial project, and then also to
serve your website locally during development. To use the CLI tool, activate it globally:

```shell
dart pub glocal activate static_shock_cli
```

You can verify the tool is installed by checking the file path to the executable:

```shell
which shock
```

With the CLI tool installed, you can create a project in one of two ways. You can create a
project with the simplest template:

```shell
shock create
```

Or you can create a project based on a documentation website template:

```shell
shock template docs
```

Once your project is generated, you can run a website build at any time. Run the following from
your project directory:

```shell
shock build
```

The final built version of the website is available under the `/build` directory.

While you're authoring articles, iterating on layouts, or modifying the Dart pipeline, you can 
serve your website locally. Run the following from your project directory:

```shell
shock serve
```

To learn more about how to use Static Shock, check the [docs](https://staticshock.io).

## Get Involved
If you discover any bugs, or missing features, please file an issue 
[on GitHub](https://github.com/flutter-bounty-hunters/static_shock).

If you get a lot of value from Static Shock, please consider [supporting me on GitHub](https://github.com/sponsors/matthew-carroll),
or consider having your company [support the Flutter Bounty Hunters](https://flutterbountyhunters.com).

We're looking forward to seeing all of your static sites!
