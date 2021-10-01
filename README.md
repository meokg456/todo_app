# Debugging

## DevTools

DevTools is a powerful tools run in browsers which support variety of features:

- source-level debugger

- widget inspector that displays a visual widget tree, and “widget select” mode where you select a widget in the app and it drills down to that widget in the tree

- memory profiler

- timeline view that supports tracing, and importing and exporting trace information

- logging view

  ![](.\assets\images\devtools.png)

  ![](.\assets\images\devtools_view.PNG)

## Setting breakpoints
- You can set breakpoints in your IDE. For example in android studio:

![](.\assets\images\breakpoint.PNG)

- And when you run the app in debug mode the app will stop at the breakpoint that was set.

![](.\assets\images\meet_breakpoint.PNG)

- In here, you will can look at variables value to find out where make bugs.

## The Dart analyzer

- If you're using [Flutter enabled IDE/editor](https://flutter.dev/docs/get-started/editor), the Dart analyzer is already checking your code and looking for possible mistakes:

![](.\assets\images\dart_analyzer.PNG)

- If not you can run flutter analyze
- Dart analyzer help us to prevent some annotation bugs by avoiding `var`, untyped arguments, untyped list literals, and so on.

## Logging

Another useful debugging tool is logging. From logging you can read stack trace of an exceptions, your `print()` logging in the console.

![](.\assets\images\logging.PNG)

