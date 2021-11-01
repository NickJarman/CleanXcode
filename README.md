# CleanXcode
A simple command line tool to minimise space used by Xcode. It's based on the script in [this article]( https://www.raywenderlich.com/19998365-understanding-and-managing-xcode-space) by Keegan Rush at Ray Wenderlich, with a few improvements:

- Keeps the two most recent iOS versions and the most recent watchOS and tvOS versions.
- Moves directories to the trash rather than deleting them with rm -rf, which is safer, can be undone, and shows what has been removed.

No parameters needed, just...

`./clean-xcode`

...after updating your iOS device and attaching it to Xcode.