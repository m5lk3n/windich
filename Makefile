WEBSITE_BUILD_DIR = website/.build
WEBSITE_SRC_DIR = website/src

## help: print this help message
.PHONY: help
help:
	@echo 'usage: make <target>'
	@echo
	@echo '  where <target> is one of the following:'
	@echo
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'

.PHONY: needs-python
needs-python:
	@if ! command -v python3 >/dev/null 2>&1; then \
		echo "python3 is required but it's not installed. Aborting."; \
		exit 1; \
	fi

.PHONY: needs-exif
needs-exif:
	@if ! command -v exif >/dev/null 2>&1; then \
		echo "exif is required but it's not installed. Aborting."; \
		exit 1; \
	fi

## install: add all required dependencies
.PHONY: install
install: clean
	flutter pub get

## clean: remove all dependencies
.PHONY: clean
clean:
	flutter clean

## update: update all dependencies
.PHONY: update
update:
	flutter pub outdated

## upgrade: major upgrade dependencies
.PHONY: upgrade
upgrade:
	flutter pub upgrade --major-versions

## analyze: analyze the application
.PHONY: analyze
analyze:
	flutter analyze

## run-debug: execute the application in debug mode
.PHONY: run-debug
run-debug:
	flutter pub get
	flutter run --debug

## run: execute the application in release mode
.PHONY: run
run:
	flutter pub get
	flutter run --release

## build-android-debug: build the apk in debug mode
.PHONY: build-android-debug
build-android-debug: clean
	flutter pub get
	flutter build apk --debug

## all-android: (re-)start from scratch, install all dependencies, build the apk in release mode, and install on device
.PHONY: all-android
all-android: clean update upgrade
	mv .env .env.bak || true
	@echo "Building APK in release mode ..."
	flutter pub get
	flutter build apk --release # --obfuscate --split-debug-info=build/app/outputs/flutter-apk/app-armeabi-v7a-release-obfuscation ?
	mv .env.bak .env || true
	@echo "Installing will delete existing app data. OK to install? [y/N] " && read ans && if [ $${ans:-'N'} = 'y' ]; then flutter install; fi

## icons: regenerate application launcher icons (from assets/icon/icon.png)
.PHONY: icons
icons:
	dart run flutter_launcher_icons

## build-website: build the website locally
.PHONY: build-website
build-website:
	@echo "(Re-)Building website to ${WEBSITE_BUILD_DIR} ..."
	rm -rf ${WEBSITE_BUILD_DIR}
	mkdir -p ${WEBSITE_BUILD_DIR}/fonts
	cp android/app/src/main/res/mipmap-hdpi/ic_launcher.png ${WEBSITE_BUILD_DIR}/favicon.png
	cp assets/icon/icon-small.png ${WEBSITE_BUILD_DIR}
	cp -R assets/fonts/* ${WEBSITE_BUILD_DIR}/fonts
	cp -R ${WEBSITE_SRC_DIR}/* ${WEBSITE_BUILD_DIR}
	@echo "... built."

## serve-website: build and serve the website locally
.PHONY: serve-website
serve-website: needs-python build-website
	@echo "Serving website from ${WEBSITE_BUILD_DIR} ..."
	python3 -m http.server 8080 --bind 127.0.0.1 -d ${WEBSITE_BUILD_DIR}

# deploy-website: deploy the website to TODO

## strip-exif: remove all EXIF metadata from images in this repo
.PHONY: strip-exif
strip-exif: needs-exif
	@echo "Stripping EXIF metadata from images ..."
	@find . -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) -print0 | xargs -0 -I{} exif --remove-all --output="{}" "{}" 2>/dev/null || true
	@echo "... done."