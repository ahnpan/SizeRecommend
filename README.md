# SizeRecommend Framework Package

This repository contains all the necessary source code for the SizeRecommend Framework.

SizeRecommend gives the user clothing size recommendation based on the input height, input weight, and the computed BMI.

## Installation

### Swift Package Manager

The installation steps for integration using Swift Package Manager is as follows:

1. In Xcode, select **File** > **Add Package Dependency...** and enter `[https://github.com/ahnpan/SizeRecommend]` as the repository URL.
2. Select version 1.0.0
3. Click **Add Package**

## Using SizeRecommend on your existing app

Import SizeRecommendCore. 

```Swift
import SizeRecommendCore
```

### Getting the recommended size.

Instantiate a SizeRecommend class and use the `getSize(height: Double, weight: Double)` function. 
The getSize function throws size related errors type `SizeRecommendError`. See Known Error Types for values and sample handling.

```Swift
import SizeRecommendCore

class ViewModel: ObservableObject {
    ...
    func onGetSize(height: Double, weight: Double) {
        let recomendationService = SizeRecommend()
        recommendedSize = try? recomendationService.getSize(height: height, weight: weight)
    }
}
```

## Size Chart

## Known Error Types
