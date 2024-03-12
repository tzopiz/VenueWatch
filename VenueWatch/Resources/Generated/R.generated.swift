//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources
import UIKit

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle
  var color: color { .init(bundle: bundle) }
  var info: info { .init(bundle: bundle) }
  var font: font { .init(bundle: bundle) }
  var file: file { .init(bundle: bundle) }
  var storyboard: storyboard { .init(bundle: bundle) }

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
  func storyboard(bundle: Foundation.Bundle) -> storyboard {
    .init(bundle: bundle)
  }
  func validate() throws {
    try self.font.validate()
    try self.storyboard.validate()
  }

  struct project {
    let developmentRegion = "en"
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

  /// This `_R.file` struct is generated, and contains static references to 13 resource files.
  struct file {
    let bundle: Foundation.Bundle

    /// Resource file `.gitignore`.
    var gitignore: RswiftResources.FileResource { .init(name: ".gitignore", pathExtension: "", bundle: bundle, locale: LocaleReference.none) }

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

  /// This `_R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    let bundle: Foundation.Bundle
    var launchScreen: launchScreen { .init(bundle: bundle) }

    func launchScreen(bundle: Foundation.Bundle) -> launchScreen {
      .init(bundle: bundle)
    }
    func validate() throws {
      try self.launchScreen.validate()
    }


    /// Storyboard `LaunchScreen`.
    struct launchScreen: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UIViewController

      let bundle: Foundation.Bundle

      let name = "LaunchScreen"
      func validate() throws {

      }
    }
  }
}