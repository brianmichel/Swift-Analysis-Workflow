# Swift-Analysis-Workflow
Make it easier to see what's making your build slow.

You can add flags to the Swift compiler to add new build output to track down slow functions, however browsing this output in Xcode sucks, this workflow will produce a file sorted by time to compile on your Desktop.

# Prerequisites
You need to have the Swift profiling code turned on for your targets in order to produce the desired output. If you need help doing that, please check out Bryan Irace's fantastic [post](http://irace.me/swift-profiling/) to learn how to turn it on!

# How To Use
1. Double click on the `Analyze Swift Performance.workflow` file.
2. Choose "Install"
3. Find an `.xcactivitylog` file, mine are in `~/Developer/Xcode/DerivedData/<project>`
4. Right click on the file and in the Services menu, click "Analyze Swift Performance"

A file will eventually show up on you Desktop ending in `-analysis.txt`

# Caveats
* This thing is slow (it's doing crude analysis on large text files)
* Automator is pretty crappy, maybe I'm doing something wrong, please help!
* If you select things that aren't `.xcactivitylog` it will bail early
* It would be really cool to embed the Ruby script in the workflow as a different file, would _REALLY_ like someone to show me if that's possible.
* This relies on `.xcactivitylog` files being the input as they are structured in a unique way for processing.

# Thanks
Big thanks to [@irace](https://www.twitter.com/irace) as he and I were talking about this very problem recently and he helped with some of the shell scripts!

If you have any questions about contributing or whatever, please feel free to drop me a line on Twitter I'm just [@brianmichel](https://www.twitter.com/brianmichel).
