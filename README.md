
# SDiffusionKit

Use Text to Image generators like Stable Diffusion in your iOS app. This package uses the Replicate.com REST API to create images from prompts using different models available on the site. Everything is tidy wrap to work flawlessly with Swift / SwiftUI.


## Installation

To use this package, you have first to link your GitHub account to https://replicate.com
Then under the account menu, you have to get your access token.

Doing so, you just have to add this repo URL in the Xcode
    
## Usage/Examples
First we have to instantiate the class passing the token
```Swift
let sdiffusion = SDiffusionKit("TOKENSTRING")
```

Now, we are going to use the main class to generate a UIimage from (DallE Mini)
```Swift
Task{
  do{
      imageStack = try await sdiffusion.imagine(prompt)
  }catch{
      //Handle Error
  }
}
```

We can also configure the algorithms and their properties via `SDiffusionConfig` protocol. Lets configure our DALL-E Mini
```Swift
let configuration = SDiffusionDalleConfig(temperature: :1, 
  numberOfExpectedImages: 10)

sdiffusion.configuration = configuration
```




## Roadmap

- Stable Diffusion Suport
- material_stable_diffusion Suport
- erlich Suport


## Authors

- [@Maia-jp](https://github.com/Maia-jp)


