# XcodeResultBundle

Read the Xcode compilation & test results in programmatic, efficient and reliable way.

## What is a Result Bundle

The Xcode Result Bundles are directories with **.xcresult** extension containing detailed machine-readable results of compilation & testing.

When building from Xcode, you can open a result bundle by launching tests, opening the *Report Navigator* tab, then right-clicking on a completed *Test* action and selecting *Show in Finder*.

When building from commandline, you can generate a Result Bundle in custom path by specifying it using the *-resultBundlePath* option.


## Version numbers & Xcode compatibility

Each XcodeResultBundle version is compatible only with specific Xcode version.

Version names, ie `10.1.0-1.0.0+10B61`, use the [Semantic Versioning 2.0](https://semver.org) standard where:

* Major, Minor & Patch numbers are equal to the Xcode version supported (**10.1.0**)
* The version of the XcodeResultBundle is the first three pre-release labels (**1.0.0**)
* The first metadata label contains name of the Xcode version supported (**10B61**)
