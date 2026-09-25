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

The copy and privacy policy were checked against the Stitches app on 23 September 2026, and the copy again on 24 and 25 September 2026. The 25 September check followed the app changes in `../Stitches` commits `5369bad` to `a3bdd7c`: gap dragging was removed, points can be locked and the rest rebalanced, spacing that doesn't mirror is marked orange, a selection panel replaced the counts drawn inside the ring, and saved plans open straight in the planner. The round diagram can be turned so the marker sits top, bottom, left or right, but that is a display preference only (`../Stitches/Stitches/Views/Planner/Track/PlanTrackView.swift:42-44`) and does not change the written round, so the page does not claim you can move the beginning of the round. Paths below are relative to the site directory.

| Page claim                                                                       | App evidence                                                                                                                                                                                                       |
| -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Increases and decreases, with three decrease and six increase stitches           | `../Stitches/Stitches/Models/ShapingTechnique.swift:12-32`, abbreviations at `:79-98`                                                                                                                              |
| M1 and yarn over sit between stitches; kfb and pfb consume one                   | `../Stitches/Stitches/Models/ShapingTechnique.swift:36-50`                                                                                                                                                         |
| Flat row and round support                                                       | `../Stitches/Stitches/Models/WorkingStyle.swift:3-29`                                                                                                                                                              |
| Half-width or equal row edge gaps                                                | `../Stitches/Stitches/Models/EdgeSpacing.swift:3-34`                                                                                                                                                               |
| Moving a point changes only the two gaps beside it; gaps are selected, not moved | `../Stitches/Stitches/Models/ShapingShift.swift:3-8,89-106`; `../Stitches/Stitches/Views/Planner/Track/TrackInteraction.swift:12-13,160-168`                                                                       |
| Tap a handle and nudge it with the arrow buttons; tap a gap to see its count     | `../Stitches/Stitches/Models/TrackFocus.swift:1-6,18-19`; `../Stitches/Stitches/Views/Planner/Track/TrackSelectionPanel.swift:3-10,295-296`                                                                        |
| Lock a point in place and rebalance the rest around it, with undo                | `../Stitches/Stitches/Models/ShapingLocks.swift:3-9`; `../Stitches/Stitches/Services/ShapingRebalancer.swift:3-8`; `../Stitches/Stitches/ViewModels/PlannerSession.swift:362-381`                                  |
| Orange shows where one side no longer mirrors the other                          | `../Stitches/Stitches/Models/TrackBalance.swift:1-6`; legend at `../Stitches/Stitches/Views/Planner/Track/TrackInstructionLegend.swift:31`                                                                         |
| Purl techniques purl the plain stitches                                          | `../Stitches/Stitches/Models/ShapingTechnique.swift:66-75`                                                                                                                                                         |
| Equal edges suit an open front or a picked-up band                               | `../Stitches/Stitches/Models/EdgeSpacing.swift:11-13`                                                                                                                                                              |
| A round is mirrored about its marker when the counts allow                       | `../Stitches/Stitches/Services/ShapingPlanner.swift:176-231` (otherwise mirrored half a stitch past the marker)                                                                                                    |
| Example row "Decrease row (RS): K5, k2tog, [k10, k2tog] 4 times, k5 (55 sts)."   | `../Stitches/StitchesTests/PatternFormatterTests.swift:15`; shown in `public/shot-pattern.webp`                                                                                                                    |
| Brackets, parentheses and asterisks                                              | `../Stitches/Stitches/Models/RepeatNotationStyle.swift:3-31`                                                                                                                                                       |
| Step-by-step instructions and sharing                                            | `../Stitches/Stitches/Views/Planner/Pattern/PatternCard.swift:68-77`, `../Stitches/Stitches/Views/Planner/Pattern/InstructionStepsView.swift:12-30`                                                                |
| A saved plan opens straight in the planner and keeps every change                | `../Stitches/Stitches/Views/Library/SavedPlansView.swift:44,97`; `../Stitches/Stitches/Views/Planner/PlannerScreen.swift:8-9`; locks saved at `../Stitches/Stitches/Models/SavedPlan.swift:20`                     |
| Saved plans sync through the user's private iCloud database                      | `../Stitches/Stitches/Services/StoreBootstrap.swift:74-78`; app description at `../Stitches/ASO.md:267,273`                                                                                                        |
| VoiceOver reads gaps and handles, flags imbalance, moves and locks handles       | `../Stitches/Stitches/Views/Planner/Track/Accessibility/TrackAccessibilityLayer.swift:3-7,30-70`; `../Stitches/Stitches/Views/Planner/Track/Accessibility/TrackShapingAccessibilityElement.swift:3-11,40-44,64-71` |
| No app account, analytics, ads, tracking or third-party SDKs                     | `../Stitches/Documentation/ReleaseVerification.md:171-172`; `../Stitches/ASO.md:272-273`                                                                                                                           |
| iOS 18 and iPhone/iPad support                                                   | `../Stitches/Stitches.xcodeproj/project.pbxproj:279,293,317,331`                                                                                                                                                   |
| One-time purchase plan                                                           | `../Stitches/ASO.md:776`                                                                                                                                                                                           |

Apple's [CloudKit private database documentation](https://developer.apple.com/documentation/cloudkit/ckcontainer/privateclouddatabase) confirms that user records are not visible in the developer portal. Apple also says [deleting an app does not remove its iCloud data](https://support.apple.com/guide/iphone/remove-or-delete-apps-iph248b543ca/ios), and describes how to [review and delete third-party app data in iCloud](https://support.apple.com/guide/icloud/keep-third-party-app-data-up-to-date-mm62d92d6b3e/icloud). These are the basis for the policy's iCloud and deletion wording.

The screenshots in `public/` are resized WebP copies of `../Stitches/screenshots/raw/iPhone/`. The app icon comes from `../Stitches/Stitches/Assets.xcassets/AppIcon.appiconset/Stitches-Light.png`.

The screenshots were regenerated on 24 September 2026 with `swift scripts/generate-screenshots.swift` in the app repository, after the saved-plan names in `../Stitches/StitchesUITests/Screenshots/ScreenshotUITests.swift` were changed to ones knitters would use evenly spaced shaping for (Body After Ribbing, Hat Crown, Cardigan Yoke). The step-by-step capture is no longer shown; the pattern capture shows the written row and the Step by step and Share buttons.

On 25 September 2026, `shot-decreases`, `shot-rearrange`, `shot-increases`, `shot-round` and `shot-pattern` were converted again from the raw captures committed in `../Stitches` at `a3bdd7c` (the ring no longer draws gap counts, and the selection panel, Rebalance Spacing button and orange balance key are new). `shot-rearrange` now shows the first decrease stepped two stitches along with the panel's buttons (7 before, 8 after), not a gap moved by hand. The raw library capture had not changed since the 24 September run, and re-encoding it produced a byte-identical `shot-library.webp`, so it was kept. Conversion: `cwebp -q 90 -resize 640 1391 <raw>.png -o public/<name>.webp`.

## Site verification

On 23 September 2026, the page built successfully with Vite 8.2.2 (rebuilt with Vite 8.3.0 on 24 September 2026), matching `package-lock.json`. The built page's local asset paths and section links were checked, and `docs/CNAME` matched the intended domain. WebKit screenshots were inspected at 1440 × 900, 390 × 844 and 320 × 700 CSS pixels. At both phone widths, the document scroll width equaled the viewport width. On 25 September 2026, after the copy and screenshot update, the page was rebuilt with Vite 8.3.0 and checked again in WebKit at the same three sizes: every image loaded, and at every width the document scroll width equaled the viewport width.

## Before launch

The App Store listing had no verifiable public URL when this page was made. Replace both "Coming to the App Store" messages with a real App Store link only after the listing is live. Check the release price, minimum iOS version, privacy policy and screenshots against the shipped binary at the same time.
