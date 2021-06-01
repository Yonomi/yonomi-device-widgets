# Yonomi Device Widgets - Flutter

[![Yonomi Device Widgets: Flutter][device-widgets-shield]][yonomi]
[![CircleCI][circle-shield]][circle-pipeline]
[![codecov](https://codecov.io/gh/Yonomi/yonomi-device-widgets/branch/main/graph/badge.svg?token=52WBYAD9H9)](https://codecov.io/gh/Yonomi/yonomi-device-widgets)

Device Widgets are rich UI components that represent traits supported by our platform (such as Lights, Locks, Thermostats).  They are composable and infinitely customizable.  They are open-source, and allow developers to build their own device UIs that are intuitive and inherently tied to the traits and actions featured in our platform's Graph API.

# Table of contents

1. [Setup](#install)
1. [Running tests](#run-tests)

## Setup <a name="install"></a>

### Cloning the repo

Clone the repo into your local machine:

```
git clone https://github.com/Yonomi/yonomi-device-widgets.git
```

### Installing the package

In your Flutter app, open your `pubspec.yaml` file and add the following entry under the `dependencies` section:


```
dependencies:
  ...    
  yonomi_device_widgets: ^1.0.0
```

## Running tests<a name="run-tests"></a>
### Prerequisites

* Install lcov:

#### lcov (For test coverage)
`brew install lcov`

### Run tests with coverage

```
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## License <a name="license"></a>
This application is released under the [Apache license v2.0](LICENSE)

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

[circle-shield]: https://circleci.com/gh/Yonomi/yonomi-device-widgets/tree/main.svg?style=shield&circle-token=fdd9d9b47626dbcace0c6bc927805c73f2233d25
[circle-pipeline]: https://app.circleci.com/pipelines/github/Yonomi/yonomi-device-widgets
[device-widgets-shield]: https://img.shields.io/badge/Yonomi-Device_Widgets:_Flutter-lightgrey.svg?colorA=ffd500&colorB=5c5c5c
[yonomi]: https://www.yonomi.co/
