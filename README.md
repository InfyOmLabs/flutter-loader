# show_loader_dialog

A new Flutter widget for show and hide loader from android side.

## Features

- showing flutter loader dialog

## Getting started

To use this package, add show_loader_dialog as a dependency in your pubspec.yaml file.

#### Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✔️    | ✔️  |       |     |       |         |


## Usage

Minimal example:

```dart
     ElevatedButton(
          onPressed: () {
            CommonDialog.showLoader(true);
            Future.delayed(
              const Duration(seconds: 5),
              () {
                CommonDialog.showLoader(false);
              },
            );
          },
          child: const Text("show loader"),
        ),
```
