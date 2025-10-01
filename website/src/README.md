# Windig

*Blown by the wind.*

## Features

- **OS**: So far, only Android is supported.
- **i8n**: The app language follows the device language as per system settings.
  
  The following languages are supported:
  - :us:/:uk: (default & fallback)
  - :de:

  The language cannot be changed in the app. 
- **Themes**: Dark & light theme are supported. The app remembers the last setting.
- **Weather**: Uses [OpenWeather](https://openweathermap.org/api) API. Sign up to retrieve a key; 1000 API calls per day are free. *This is mandatory for the app to work!*

## Usage

You can use this app to display your current location's weather now and with a 3h forecast. It comes with a wind compass and a compass.

*The wind compass indicates from where the wind is blowing towards you.*

### Hints

- Disabling/Enabling device network requires an explicit "Refresh" to take effect.

## Key

Windig uses OpenWeather which requires an API key. **At this point in time, using the OpenWeather API is only free of charge up until 1000 API calls per day!** (So far, when using Windig 24/7 20 refreshes per hour are within the free tier.) Please read [OpenWeather Pricing](https://openweathermap.org/price) for details.

Long story short, please bring your own key. API keys are managed on [the account page](https://home.openweathermap.org/users/sign_in).

Note: Saving an empty key removes it from the persistent storage - However, **the app won't work without a key!**

## Privacy

Windig itself does not collect any personal data. The application does not store any data on a server. The user's (OpenWeather API) key is stored securely on the client device. The application itself does not use cookies or any other tracking technologies.

Please note that, through the usage of the API, [OpenWeather Terms](https://openweathermap.org/api) apply.

## Disclaimer

The application is neither commercial nor affiliated with any corporation or organization. It's a pet project which, besides, is not available through an app store. ([Here](https://github.com/m5lk3n/windig/blob/main/docs/FAQ.md) is why.) The app is provided as is and without warranty of any kind. The author is not responsible for any costs, damages or losses that may result from the use of the application or the OpenWeather APIs. By using the application, you agree to this disclaimer.

---

[![lttl.dev](../logo-small.png)](https://lttl.dev)

---

[Powered by docsify](https://docsify.js.org/)