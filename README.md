# XcodeResultBundle

The XcodeResultBundle Swift package contains data models that allow reading the Xcode result bundles in programmatic way.

The Xcode result bundles are directories containing detailed machine-readable results of compilation & testing.

This package can be used to build custom IDE or generate detailed reports efficiently.


## Version numbers & Xcode compatibility

Each XcodeResultBundle version is compatible only with specific Xcode version.

Version names, ie `10.1.0-1.0.0+10B61`, use the [Semantic Versioning 2.0](https://semver.org) standard where:

* Major, Minor & Patch numbers are equal to the Xcode version supported (**10.1.0**)
* The version of the XcodeResultBundle is the first three pre-release labels (**1.0.0**)
* The first metadata label contains name of the Xcode version supported (**10B61**)
