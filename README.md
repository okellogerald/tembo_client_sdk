# Tembo Client SDK
A flutter SDK for handling onboarding process specific to [TemboPlus](https://temboplus.com/) requirements.

# Getting SDK
Currently the SDK uses a third-party service provider, [Smile Identity](https://smileidentity.com/) for user identification and verification. Internally the package leverages [this plugin](https://pub.dev/packages/smile_identity_plugin) for handling all mobile native implementations. Please make sure you have done all the set-up required by that package before your first run.

# Usage Guide
The entry point to the SDK is the `startTemboVerification` function.

Arguments:
> `context: BuildContext` 
>
> `scheme: TemboColorScheme?` A set of colors to customize the look of the pages.
```dart
/// TemboColorScheme constructor
  const TemboColorScheme({
    this.primary,
    this.onPrimary,
    this.border,
    this.hint,
    this.title,
    this.body,
    this.background,
    this.onBackground,
    this.surfaceContainer,
    this.onSurfaceContainer,
    this.error,
    this.onError,
  });
```

>`userData: Data?` Specific user's data. Provided user data will be pre-filled when specific pages are opened.
```dart
/// Data constructor
  Data({
    this.country,
    this.firstName,
    this.lastName,
    this.dob,
    this.gender,
    this.document,
    required this.userId,
    this.environment,
  });

```
>`themeMode: ThemeMode?` If `scheme` is not defined, a default light color-scheme will be used for ThemeMode.light and default dark color-scheme for ThemeMode.dark. If `scheme` is provided `themeMode` will be ignored.
>
>`locale: TemboLocale (Defaults to TemboLocale.en)` Defines what language to use. Currently supports only English(TemboLocale.en) and Swahili(TemboLocale.sw)
```dart
/// TemboLocale declaration
enum TemboLocale {
  sw,
  en,
}
```

The SDK takes care of everything from this point on (after `startTemboVerification` is called) and when everything is done, it pops to the page the app was before calling the function.

# Getting any issues?
Please reach out to `support@temboplus.com` or file an issue at [our repository](https://github.com/okellogerald/tembo_client_sdk)