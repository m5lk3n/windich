# Windich

*"Es is' windich."*

Eine Smartphone-App, die das aktuelle Wetter an deinem Standort sowie eine 3-Stunden-Vorhersage anzeigt. Sie bietet einen Windkompass und einen Kompass (besonders praktisch, wenn das Navi sagt: „Gehe nach Südosten“ :wink:). Das ist auch schon alles.

## Funktionen

- **Betriebssystem**: Bisher wird nur Android unterstützt.
- **Wetter**: Nutzt die [OpenWeather](https://openweathermap.org/api) API.
- **Sichere Speicherung**: Der [API-Schlüssel](#schlüssel) wird ausschließlich verschlüsselt lokal auf dem Gerät gespeichert.
- **Sprachen**: Die App-Sprache richtet sich nach den Systemeinstellungen des Geräts.

    Unterstützte Sprachen:
    - :us:/:uk: (Standard & Fallback)
    - :de:

    Die Sprache kann in der App selbst nicht geändert werden.
- **Designs**: Sowohl dunkles als auch helles Design werden unterstützt.

    Die App merkt sich das zuletzt gewählte Design.

## Screenshots

<p>
        <img alt="Windich Hauptbildschirm" src="app-0-main-screen.png" width="33%"/>
        <img alt="Windich Floating Buttons" src="app-1-floating-buttons.png" width="33%"/>
</p>

*Der eingekreiste Windkompass zeigt an, aus welcher Richtung der Wind zu dir weht.*

<p>
        <img alt="Windich helles Design" src="app-2-light-theme.png" width="33%"/>
        <img alt="Windich Schlüssel-Eingabe" src="app-3-key-entry.png" width="33%"/>
</p>

*Das Speichern eines leeren Schlüssels entfernt ihn aus dem persistenten Speicher.*

*Die App funktioniert ohne Schlüssel nicht!*

Das Deaktivieren/Aktivieren des Netzwerks am Gerät erfordert ein explizites "Aktualisieren" in der App, damit eine Aktualisierung erfolgt.

## Schlüssel

Windich verwendet OpenWeather, wofür ein API-Schlüssel benötigt wird. **Derzeit ist die Nutzung der OpenWeather API nur bis zu 1000 API-Aufrufen pro Tag kostenlos!** (Bisher reichen bei 24/7-Nutzung 20 Aktualisierungen pro Stunde für die freie Nutzung.) Siehe [OpenWeather Pricing](https://openweathermap.org/price) für Details.

Kurz gesagt: Bitte registriere dich selbst und bringe deinen eigenen Schlüssel mit. OpenWeather API-Schlüssel werden auf [der Account-Seite](https://home.openweathermap.org/users/sign_in) verwaltet.

**Die App funktioniert ohne Schlüssel nicht!**

## Datenschutz

Windich selbst sammelt keine personenbezogenen Daten. Die Anwendung speichert keine Daten auf einem Server. Der (OpenWeather API-)Schlüssel des Nutzers wird sicher auf dem Gerät gespeichert. Die Anwendung verwendet keine Cookies oder andere Tracking-Technologien.

Bitte beachte, dass durch die Nutzung der API die [OpenWeather Bedingungen](https://openweathermap.org/api) gelten.

## Haftungsausschluss

Die Anwendung ist weder kommerziell noch mit einer Firma oder Organisation verbunden. Es handelt sich um ein privates Projekt, das zudem nicht über einen App Store verfügbar ist. ([Hier](https://github.com/m5lk3n/windich/blob/main/docs/FAQ.md) steht warum.) Die App wird wie gesehen und ohne jegliche Gewährleistung bereitgestellt. Der Autor übernimmt keine Verantwortung für Kosten, Schäden oder Verluste, die durch die Nutzung der Anwendung oder der OpenWeather APIs entstehen können. Mit der Nutzung der Anwendung akzeptierst du diesen Haftungsausschluss.

## Installation

Die App muss gebaut und per Sideload installiert werden. Details dazu findest du im [DEV](https://github.com/m5lk3n/windich/blob/main/docs/DEV.md#installation)-Abschnitt des Quellcode-Repos.

---

[![lttl.dev](../logo-small.png)](https://lttl.dev)

---

[Powered by docsify](https://docsify.js.org/)