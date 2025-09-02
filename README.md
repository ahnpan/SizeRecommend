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
Height input should be in `cm` and weight should be in `kg`.
This function returns a `SizeRecommendCore.Size` enum value.
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

### Getting the BMI.

Instantiate a SizeRecommend class and use the `getBMI(height: Double, weight: Double)` function. 
Height input should be in `cm` and weight should be in `kg`.
This function returns the BMI as a `Double` value.
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

## BMI to Size Chart

| BMI | Size |
|----------|----------|
| < 18.5   | Small  |
| 18.51 - 24.9 | Medium   |
| 24.9 - 29.9 | Large   |
| > 29.9 | Extra Large   |

## Known Error Types

There are 3 main error types: 

```Swift
public enum SizeRecommendError {
    case invalidHeight
    case invalidWeight
    case invalidBMI
```
Here is a sample code to handle the error.

```Swift
let result = Result { try recomendationService.getSize(height: height, weight: weight) }
        
switch result {
case .success(let recommendedSize):
    self.size = recommendedSize
case .failure(let error):
    self.error = error.localizedDescription
    ...
}
```

## Sample App
You can view a simple app using this framework here: **[SizeRecommend Sample App](https://github.com/ahnpan/SizeRecommendSample)**
