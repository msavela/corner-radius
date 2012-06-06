# CornerRadius

Add rounded corners to iOS application.

## Usage

Add as a subview to your application's UIWindow.

```objective-c
#import "CornerRadius.h"

[self.window addSubview:[[CornerRadius alloc] init]]; // With default value of 6
```

With custom radius:

```objective-c
[self.window addSubview:[[CornerRadius alloc] initWithRadius:10]];
```

Opaque black status bar style is recommended

**NOTE** You need to add CoreGraphics framework to your project.