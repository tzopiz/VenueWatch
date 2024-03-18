//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle

  let entitlements = entitlements()

  var string: string { .init(bundle: bundle, preferredLanguages: nil, locale: nil) }
  var color: color { .init(bundle: bundle) }
  var info: info { .init(bundle: bundle) }
  var font: font { .init(bundle: bundle) }
  var file: file { .init(bundle: bundle) }

  func string(bundle: Foundation.Bundle) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: nil)
  }
  func string(locale: Foundation.Locale) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: locale)
  }
  func string(preferredLanguages: [String], locale: Locale? = nil) -> string {
    .init(bundle: bundle, preferredLanguages: preferredLanguages, locale: locale)
  }
  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func info(bundle: Foundation.Bundle) -> info {
    .init(bundle: bundle)
  }
  func font(bundle: Foundation.Bundle) -> font {
    .init(bundle: bundle)
  }
  func file(bundle: Foundation.Bundle) -> file {
    .init(bundle: bundle)
  }
  func validate() throws {
    try self.font.validate()
  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    let bundle: Foundation.Bundle
    let preferredLanguages: [String]?
    let locale: Locale?
    var localization: localization { .init(source: .init(bundle: bundle, tableName: "Localization", preferredLanguages: preferredLanguages, locale: locale)) }

    func localization(preferredLanguages: [String]) -> localization {
      .init(source: .init(bundle: bundle, tableName: "Localization", preferredLanguages: preferredLanguages, locale: locale))
    }


    /// This `_R.string.localization` struct is generated, and contains static references to 8 localization keys.
    struct localization {
      let source: RswiftResources.StringResource.Source

      /// en translation: Friends
      ///
      /// Key: friends
      ///
      /// Locales: en, ru
      var friends: RswiftResources.StringResource { .init(key: "friends", tableName: "Localization", source: source, developmentValue: "Friends", comment: nil) }

      /// en translation: Log In
      ///
      /// Key: logIn
      ///
      /// Locales: en, ru
      var logIn: RswiftResources.StringResource { .init(key: "logIn", tableName: "Localization", source: source, developmentValue: "Log In", comment: nil) }

      /// en translation: Map
      ///
      /// Key: map
      ///
      /// Locales: en, ru
      var map: RswiftResources.StringResource { .init(key: "map", tableName: "Localization", source: source, developmentValue: "Map", comment: nil) }

      /// en translation: Notes
      ///
      /// Key: notes
      ///
      /// Locales: en, ru
      var notes: RswiftResources.StringResource { .init(key: "notes", tableName: "Localization", source: source, developmentValue: "Notes", comment: nil) }

      /// en translation: Profile
      ///
      /// Key: profile
      ///
      /// Locales: en, ru
      var profile: RswiftResources.StringResource { .init(key: "profile", tableName: "Localization", source: source, developmentValue: "Profile", comment: nil) }

      /// en translation: Sign In
      ///
      /// Key: signIn
      ///
      /// Locales: en, ru
      var signIn: RswiftResources.StringResource { .init(key: "signIn", tableName: "Localization", source: source, developmentValue: "Sign In", comment: nil) }

      /// en translation: Sign Out
      ///
      /// Key: signOut
      ///
      /// Locales: en, ru
      var signOut: RswiftResources.StringResource { .init(key: "signOut", tableName: "Localization", source: source, developmentValue: "Sign Out", comment: nil) }

      /// en translation: Sign Up
      ///
      /// Key: signUp
      ///
      /// Locales: en, ru
      var signUp: RswiftResources.StringResource { .init(key: "signUp", tableName: "Localization", source: source, developmentValue: "Sign Up", comment: nil) }
    }
  }

  /// This `_R.color` struct is generated, and contains static references to 3 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }

    /// Color `background`.
    var background: RswiftResources.ColorResource { .init(name: "background", path: [], bundle: bundle) }

    /// Color `border`.
    var border: RswiftResources.ColorResource { .init(name: "border", path: [], bundle: bundle) }
  }

  /// This `_R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    let bundle: Foundation.Bundle
    var uiApplicationSceneManifest: uiApplicationSceneManifest { .init(bundle: bundle) }

    func uiApplicationSceneManifest(bundle: Foundation.Bundle) -> uiApplicationSceneManifest {
      .init(bundle: bundle)
    }

    struct uiApplicationSceneManifest {
      let bundle: Foundation.Bundle

      let uiApplicationSupportsMultipleScenes: Bool = false

      var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest"], key: "_key") ?? "UIApplicationSceneManifest" }
      var uiSceneConfigurations: uiSceneConfigurations { .init(bundle: bundle) }

      func uiSceneConfigurations(bundle: Foundation.Bundle) -> uiSceneConfigurations {
        .init(bundle: bundle)
      }

      struct uiSceneConfigurations {
        let bundle: Foundation.Bundle
        var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations"], key: "_key") ?? "UISceneConfigurations" }
        var uiWindowSceneSessionRoleApplication: uiWindowSceneSessionRoleApplication { .init(bundle: bundle) }

        func uiWindowSceneSessionRoleApplication(bundle: Foundation.Bundle) -> uiWindowSceneSessionRoleApplication {
          .init(bundle: bundle)
        }

        struct uiWindowSceneSessionRoleApplication {
          let bundle: Foundation.Bundle
          var defaultConfiguration: defaultConfiguration { .init(bundle: bundle) }

          func defaultConfiguration(bundle: Foundation.Bundle) -> defaultConfiguration {
            .init(bundle: bundle)
          }

          struct defaultConfiguration {
            let bundle: Foundation.Bundle
            var uiSceneConfigurationName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneConfigurationName") ?? "Default Configuration" }
            var uiSceneDelegateClassName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate" }
          }
        }
      }
    }
  }

  /// This `_R.entitlements` struct is generated, and contains static references to 1 properties.
  struct entitlements {
    let comAppleDeveloperApplesignin = comAppleDeveloperApplesignin()
    let comAppleDeveloperAuthenticationServicesAutofillCredentialProvider: Bool = true
    struct comAppleDeveloperApplesignin {
    }
  }

  /// This `_R.font` struct is generated, and contains static references to 10 fonts.
  struct font: Sequence {
    let bundle: Foundation.Bundle

    /// Font `Rubik-Black`.
    var rubikBlack: RswiftResources.FontResource { .init(name: "Rubik-Black", bundle: bundle, filename: "Rubik-Black.ttf") }

    /// Font `Rubik-BlackItalic`.
    var rubikBlackItalic: RswiftResources.FontResource { .init(name: "Rubik-BlackItalic", bundle: bundle, filename: "Rubik-BlackItalic.ttf") }

    /// Font `Rubik-Bold`.
    var rubikBold: RswiftResources.FontResource { .init(name: "Rubik-Bold", bundle: bundle, filename: "Rubik-Bold.ttf") }

    /// Font `Rubik-BoldItalic`.
    var rubikBoldItalic: RswiftResources.FontResource { .init(name: "Rubik-BoldItalic", bundle: bundle, filename: "Rubik-BoldItalic.ttf") }

    /// Font `Rubik-Italic`.
    var rubikItalic: RswiftResources.FontResource { .init(name: "Rubik-Italic", bundle: bundle, filename: "Rubik-Italic.ttf") }

    /// Font `Rubik-Light`.
    var rubikLight: RswiftResources.FontResource { .init(name: "Rubik-Light", bundle: bundle, filename: "Rubik-Light.ttf") }

    /// Font `Rubik-LightItalic`.
    var rubikLightItalic: RswiftResources.FontResource { .init(name: "Rubik-LightItalic", bundle: bundle, filename: "Rubik-LightItalic.ttf") }

    /// Font `Rubik-Medium`.
    var rubikMedium: RswiftResources.FontResource { .init(name: "Rubik-Medium", bundle: bundle, filename: "Rubik-Medium.ttf") }

    /// Font `Rubik-MediumItalic`.
    var rubikMediumItalic: RswiftResources.FontResource { .init(name: "Rubik-MediumItalic", bundle: bundle, filename: "Rubik-MediumItalic.ttf") }

    /// Font `Rubik-Regular`.
    var rubikRegular: RswiftResources.FontResource { .init(name: "Rubik-Regular", bundle: bundle, filename: "Rubik-Regular.ttf") }

    func makeIterator() -> IndexingIterator<[RswiftResources.FontResource]> {
      [rubikBlack, rubikBlackItalic, rubikBold, rubikBoldItalic, rubikItalic, rubikLight, rubikLightItalic, rubikMedium, rubikMediumItalic, rubikRegular].makeIterator()
    }
    func validate() throws {
      for font in self {
        if !font.canBeLoaded() { throw RswiftResources.ValidationError("[R.swift] Font '\(font.name)' could not be loaded, is '\(font.filename)' added to the UIAppFonts array in this targets Info.plist?") }
      }
    }
  }

  /// This `_R.file` struct is generated, and contains static references to 14 resource files.
  struct file {
    let bundle: Foundation.Bundle

    /// Resource file `.gitignore`.
    var gitignore: RswiftResources.FileResource { .init(name: ".gitignore", pathExtension: "", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `CODE_OF_CONDUCT.md`.
    var code_OF_CONDUCTMd: RswiftResources.FileResource { .init(name: "CODE_OF_CONDUCT", pathExtension: "md", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `LICENSE`.
    var licensE: RswiftResources.FileResource { .init(name: "LICENSE", pathExtension: "", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `README.md`.
    var readmeMd: RswiftResources.FileResource { .init(name: "README", pathExtension: "md", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Rubik-Black.ttf`.
    var rubikBlackTtf: RswiftResources.FileResource { .init(name: "Rubik-Black", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Rubik-BlackItalic.ttf`.
    var rubikBlackItalicTtf: RswiftResources.FileResource { .init(name: "Rubik-BlackItalic", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Rubik-Bold.ttf`.
    var rubikBoldTtf: RswiftResources.FileResource { .init(name: "Rubik-Bold", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Rubik-BoldItalic.ttf`.
    var rubikBoldItalicTtf: RswiftResources.FileResource { .init(name: "Rubik-BoldItalic", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Rubik-Italic.ttf`.
    var rubikItalicTtf: RswiftResources.FileResource { .init(name: "Rubik-Italic", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Rubik-Light.ttf`.
    var rubikLightTtf: RswiftResources.FileResource { .init(name: "Rubik-Light", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Rubik-LightItalic.ttf`.
    var rubikLightItalicTtf: RswiftResources.FileResource { .init(name: "Rubik-LightItalic", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Rubik-Medium.ttf`.
    var rubikMediumTtf: RswiftResources.FileResource { .init(name: "Rubik-Medium", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Rubik-MediumItalic.ttf`.
    var rubikMediumItalicTtf: RswiftResources.FileResource { .init(name: "Rubik-MediumItalic", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Rubik-Regular.ttf`.
    var rubikRegularTtf: RswiftResources.FileResource { .init(name: "Rubik-Regular", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }
  }
}