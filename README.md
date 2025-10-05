# Windich

![](assets/icon/icon-small.png)

Your very little companion for your location, your outdoor activities, providing forecasted and real-time weather information like wind speed and wind direction using your device's sensors and geolocation. An app for Android and one of my pet projects. For now.

Screenshots can be found [here](device_screens/screenshots/APP.md).

## Documentation

- [Bookmarks](docs/BOOKMARKS.md)
- [Development](docs/DEV.md)
- [FAQ](docs/FAQ.md)
- [How-to](docs/HOWTO.md)
- [To-do](docs/TODO.md)

## Known Limitations / Known Issues

- After entering a key, it may take a manual "Refresh" for the UI to update properly.
- The compasses require constant redraw which probably increases CPU load and drains the device battery fast.

## Objectives

- Have a compass and a wind compass at hand; know where to go when the GPS says "head southeast" (when no sun is up ;-))
- Learn Flutter/Dart further.
- Learn Flutter/Dart i18n.
- Try Riverpod 3.
- Explore Copilot and ChatGPT for Flutter app development.
- Try [docsify](https://docsify.js.org/).
- Time-box activity to max. 6 weeks outside of work.

## Repo Structure

```bash
├── android        # Flutter
├── assets         # Windich/Flutter: app icons and images
├── device_screens # Windich: app screenshots
├── docs           # Windich: documentation
├── lib            # Flutter
├── logcat         # Windich: for logcat-specific logging
└── website        # Windich: app supporting web page 
```

## Get Started

Here's [why](docs/FAQ.md) Windich is not available from an app store.

Start [here](docs/DEV.md#prerequisites) and please visit the [website](https://windich.lttl.dev) for more info.

## License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0) or later. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- All third party dependency devs (see [pubspec.yaml](pubspec.yaml) for dependencies) 
- Google Fonts/Andrew Paglinawan for [Quicksand](https://fonts.google.com/specimen/Quicksand)
- [zeshuaro](https://github.com/zeshuaro) for [Appainter](https://appainter.dev/)

## Disclaimer

I used
- Copilot/GPT-4.1 to help me code and translate.
- ChatGPT to create the icon.

---

<p align="center">
    <a href="https://lttl.dev/"><img alt="lttl.dev logo" src="assets/logo/logo.png" width="33%"/></a>
</p>