# Stitches website

Static landing page and privacy policy for the Stitches iPhone and iPad app. The layout and build setup follow the local Vilar site (`../../vilar/vilar.artsoftheinsane.com/index.html` and `style.css`), with Stitches' own copy, colors, icon and screenshots.

## Build

```sh
npm ci
npm run build
```

The production files are in `docs/`, including `CNAME` for `stitches.artsoftheinsane.com`. Run `npm run dev` to preview the source locally. There is no site JavaScript, cookie, analytics or external asset request.

The social preview image is generated from the site icon and headline with `sh scripts/generate-og-image.sh` (ImageMagick on macOS). Rebuild after changing it.

## Content checks

The copy and privacy policy were checked against the Stitches app on 23 September 2026. Paths below are relative to the site directory.

| Page claim                                                             | App evidence                                                                                                                                                                           |
| ---------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Increases and decreases, with three decrease and six increase stitches | `../../swift/Stitches/Stitches/Models/ShapingTechnique.swift:12-32`, abbreviations at `:79-98`                                                                                         |
| M1 and yarn over sit between stitches; kfb and pfb consume one         | `../../swift/Stitches/Stitches/Models/ShapingTechnique.swift:36-50`                                                                                                                    |
| Flat row and round support                                             | `../../swift/Stitches/Stitches/Models/WorkingStyle.swift:3-29`                                                                                                                         |
| Half-width or equal row edge gaps                                      | `../../swift/Stitches/Stitches/Models/EdgeSpacing.swift:3-34`                                                                                                                          |
| Rearranging gaps, shaping points and round marker                      | `../../swift/Stitches/Stitches/Views/Planner/Track/TrackInteraction.swift:3-13`; documented interaction details at `../../swift/Stitches/Documentation/ReleaseVerification.md:120-135` |
| Brackets, parentheses and asterisks                                    | `../../swift/Stitches/Stitches/Models/RepeatNotationStyle.swift:3-31`                                                                                                                  |
| Step-by-step instructions and sharing                                  | `../../swift/Stitches/Stitches/Views/Planner/Pattern/PatternCard.swift:62-79`, `../../swift/Stitches/Stitches/Views/Planner/Pattern/InstructionStepsView.swift:12-30`                  |
| Saved plans sync through the user's private iCloud database            | `../../swift/Stitches/Stitches/Services/StoreBootstrap.swift:74-77`; app description at `../../swift/Stitches/ASO.md:224-233`                                                          |
| VoiceOver controls for the diagram                                     | `../../swift/Stitches/Stitches/Views/Planner/Track/Accessibility/TrackAccessibilityLayer.swift:3-5,29-79`                                                                              |
| No app account, analytics, ads, tracking or third-party SDKs           | `../../swift/Stitches/Documentation/ReleaseVerification.md:167-175`; `../../swift/Stitches/ASO.md:229-233`                                                                             |
| iOS 18 and iPhone/iPad support                                         | `../../swift/Stitches/Stitches.xcodeproj/project.pbxproj:279,293,317,331`                                                                                                              |
| One-time purchase plan                                                 | `../../swift/Stitches/ASO.md:694-696`                                                                                                                                                  |

Apple's [CloudKit private database documentation](https://developer.apple.com/documentation/cloudkit/ckcontainer/privateclouddatabase) confirms that user records are not visible in the developer portal. Apple also says [deleting an app does not remove its iCloud data](https://support.apple.com/guide/iphone/remove-or-delete-apps-iph248b543ca/ios), and describes how to [review and delete third-party app data in iCloud](https://support.apple.com/guide/icloud/keep-third-party-app-data-up-to-date-mm62d92d6b3e/icloud). These are the basis for the policy's iCloud and deletion wording.

The screenshots in `public/` are resized WebP copies of `../../swift/Stitches/screenshots/raw/iPhone/`. The app icon comes from `../../swift/Stitches/Stitches/Assets.xcassets/AppIcon.appiconset/Stitches-Light.png`.

`screenshots/raw/iPhone/05_Pattern.png` is intentionally not shown on the page: its Save Plan card says plans stay on one device, while the current `../../swift/Stitches/Stitches/Views/Planner/SavePlanCard.swift:13` says they are available on other devices through iCloud. The page uses the round and step-by-step captures instead. Regenerate the app screenshots before using that older pattern capture in launch material.

## Site verification

On 23 September 2026, the page built successfully with Vite 8.2.2, matching `package-lock.json`. The built page's local asset paths and section links were checked, and `docs/CNAME` matched the intended domain. WebKit screenshots were inspected at 1440 × 900, 390 × 844 and 320 × 700 CSS pixels. At both phone widths, the document scroll width equaled the viewport width.

## Before launch

The App Store listing had no verifiable public URL when this page was made. Replace both "Coming to the App Store" messages with a real App Store link only after the listing is live. Check the release price, minimum iOS version, privacy policy and screenshots against the shipped binary at the same time.
