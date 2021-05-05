# Yonomi Device Widgets - Flutter

[![Yonomi Device Widgets: Flutter][device-widgets-shield]][yonomi]
[![codecov](https://codecov.io/gh/Yonomi/yonomi-device-widgets/branch/main/graph/badge.svg?token=52WBYAD9H9)](https://codecov.io/gh/Yonomi/yonomi-device-widgets)
[device-widgets-shield]: https://img.shields.io/badge/Yonomi-Device_Widgets:_Flutter-lightgrey.svg?colorA=ffd500&colorB=5c5c5c
[yonomi]: https://www.yonomi.co/


# Table of contents

1. [Installing](#install)
1. [Running tests](#run-tests)

## Getting Started

### Cloning the repo <a name="clone-repo"></a>
Clone the repo into your local machine:

```
git clone https://github.com/Yonomi/yonomi-device-widgets.git
```

### Installing the package <a name="install"></a>

Open your `pubspec.yaml` file and add the following entry under the `dependencies` section:


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
