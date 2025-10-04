# Development

## Environment

- Flutter 3.35.5 (at the time of writing)

- Tested on the following physical devices:
    - Pixel 6 on latest Android 16
    - Motorola G86 Power 5G on latest Android 15 

## Prerequisites

- Obtain a key for https://openweathermap.org/api.
- Configure a subdomain for the website (Windich author only).
- Get a directory on the webserver (Windich author only).
- Run `make init` and fill in the missing values.

## Start

Run `make install`.

## Installation

- [Enable adb debugging on your device](https://developer.android.com/tools/adb#Enabling).

- Run `make all-android`.

## Misc.

- Run `flutter pub get` to generate localization files.