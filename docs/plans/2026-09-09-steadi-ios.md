# STEADI iOS Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build the STEADI companion-app iPhone demo (SwiftUI, 3 tabs, mock data) as a fresh git repo ready to clone onto the Mac and run in Xcode.

**Architecture:** Single iOS target using Xcode 16 file-system-synchronized groups (objectVersion 77) so the `.pbxproj` is minimal and folder edits need no project surgery. 7 Swift files: app entry + theme + data + 4 views. All data is bundled mock data ported 1:1 from the web app's `mockData.js`.

**Tech Stack:** SwiftUI (iOS 17.0 floor), Swift Charts, zero external dependencies, plain git (no CocoaPods/SPM).

**Spec:** `stedi/steadi-ios/docs/specs/2026-09-09-steadi-ios-design.md`

## Global Constraints

- Deployment target **iOS 17.0** exactly; no availability annotations needed anywhere.
- **Zero external dependencies** — no SPM packages, no CocoaPods.
- No backend, no auth, no networking. Call / Message / Share / Export buttons are **decorative** (visual press feedback only, no handlers beyond a no-op or `#if DEBUG` no-op).
- Numbers must match `mockData.js` and the pitch deck **exactly** (34→70, 76%, 4.2→1.8, 63 meals, 82% battery, STEADI-001, Jul 8 – Aug 26 2026).
- Color tokens (hex, from `tailwind.config.js`): lime `#B9E61A`, lime-dark `#7A9A10`, ink `#171221`, purple `#2B1F3D`, cream `#FAF7F0`, coral `#FF6B4A`, gold `#F5C518`, teal `#1A9E7A`, teal-dark `#0E3D2C`, muted `#5A5A6E`.
- Charts: **Swift Charts** only (no custom drawing for line/bar charts).
- Launch screen: plain cream, portrait only. App display name: **STEADI**.
- Not a git repo today — Task 1 inits it. Push target: `github.com/Aryamanironman/steadi-ios` (push happens in Task 8 after the user confirms; do not push earlier).
- Severity color rule (used everywhere): `> 3` coral, `> 2` gold, else teal (mirrors `PatientDashboard.jsx:103`).

---

### Task 1: Git repo + Xcode project skeleton

**Files:**
- Create: `STEADI.xcodeproj/project.pbxproj`
- Create: `STEADI/STEADIApp.swift` (placeholder body, replaced in Task 2)
- Create: `STEADI/Info.plist`
- Create: `STEADI/Assets.xcassets/Contents.json`
- Create: `STEADI/Assets.xcassets/AccentColor.colorset/Contents.json`
- Create: `STEADI/Assets.xcassets/AppIcon.appiconset/Contents.json`
- Create: `.gitignore`
- Create: `README.md`

**Interfaces:**
- Consumes: nothing.
- Produces: a project that compiles (placeholder `STEADIApp.swift`); folder names/paths every later task writes into: `STEADI/Theme/`, `STEADI/Data/`, `STEADI/Views/`.

- [ ] **Step 1: Init repo and write .gitignore**

```bash
cd stedi/steadi-ios
git init -b main
```

Write `.gitignore`:

```
.DS_Store
xcuserdata/
*.xcuserstate
build/
DerivedData/
```

- [ ] **Step 2: Write project.pbxproj (Xcode 16 synchronized groups, objectVersion 77)**

Write `STEADI.xcodeproj/project.pbxproj` exactly:

```
// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 77;
	objects = {

/* Begin PBXFileReference section */
		AA0000010000000000000001 /* STEADI.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = STEADI.app; sourceTree = BUILT_PRODUCTS_DIR; };
/* End PBXFileReference section */

/* Begin PBXFileSystemSynchronizedRootGroup section */
		AA0000020000000000000002 /* STEADI */ = {
			isa = PBXFileSystemSynchronizedRootGroup;
			path = STEADI;
			sourceTree = "<group>";
		};
/* End PBXFileSystemSynchronizedRootGroup section */

/* Begin PBXFrameworksBuildPhase section */
		AA0000030000000000000003 /* Frameworks */ = {
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXFrameworksBuildPhase section */

/* Begin PBXGroup section */
		AA0000040000000000000004 /* Products */ = {
			isa = PBXGroup;
			children = (
				AA0000010000000000000001 /* STEADI.app */,
			);
			name = Products;
			sourceTree = "<group>";
		};
		AA0000050000000000000005 /* Project object */ = {
			isa = PBXProject;
			attributes = {
				BuildIndependentTargetsInParallel = 1;
				LastSwiftUpdateCheck = 1600;
				LastUpgradeCheck = 1600;
				TargetAttributes = {
					AA0000060000000000000006 = {
						CreatedOnToolsVersion = 16.0;
					};
				};
			};
			buildConfigurationList = AA0000070000000000000007 /* Build configuration list for PBXProject "STEADI" */;
			developmentRegion = en;
			hasScannedForEncodings = 0;
			knownRegions = (
				en,
				Base,
			);
			mainGroup = AA0000050000000000000005;
			productRefGroup = AA0000040000000000000004 /* Products */;
			projectDirPath = "";
			projectRoot = "";
			targets = (
				AA0000060000000000000006 /* STEADI */,
			);
		};
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
		AA0000060000000000000006 /* STEADI */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = AA0000080000000000000008 /* Build configuration list for PBXNativeTarget "STEADI" */;
			buildPhases = (
				AA0000030000000000000003 /* Frameworks */,
			);
			buildRules = (
			);
			dependencies = (
			);
			fileSystemSynchronizedGroups = (
				AA0000020000000000000002 /* STEADI */,
			);
			name = STEADI;
			productName = STEADI;
			productReference = AA0000010000000000000001 /* STEADI.app */;
			productType = "com.apple.product-type.application";
		};
/* End PBXNativeTarget section */

/* Begin XCBuildConfiguration section */
		AA0000090000000000000009 /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				ASSETCATALOG_COMPILER_GENERATE_ASSET_SYMBOLS = YES;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_ENABLE_MODULES = YES;
				CLANG_WARN_BOOL_CONVERSION = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				ENABLE_TESTABILITY = YES;
				GCC_OPTIMIZATION_LEVEL = 0;
				IPHONEOS_DEPLOYMENT_TARGET = 17.0;
				ONLY_ACTIVE_ARCH = YES;
				SDKROOT = iphoneos;
				SWIFT_ACTIVE_COMPILATION_CONDITIONS = "DEBUG $(inherited)";
				SWIFT_VERSION = 5.0;
			};
			name = Debug;
		};
		AA00000A000000000000000A /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				ASSETCATALOG_COMPILER_GENERATE_ASSET_SYMBOLS = YES;
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				ENABLE_TESTABILITY = NO;
				IPHONEOS_DEPLOYMENT_TARGET = 17.0;
				SDKROOT = iphoneos;
				SWIFT_COMPILATION_MODE = wholemodule;
				SWIFT_VERSION = 5.0;
				VALIDATE_PRODUCT = YES;
			};
			name = Release;
		};
		AA00000B000000000000000B /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				DEVELOPMENT_TEAM = "";
				ENABLE_PREVIEWS = YES;
				GENERATE_INFOPLIST_FILE = NO;
				INFOPLIST_FILE = STEADI/Info.plist;
				INFOPLIST_KEY_CFBundleDisplayName = STEADI;
				IPHONEOS_DEPLOYMENT_TARGET = 17.0;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.steadi.demo;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_EMIT_LOC_STRINGS = YES;
				TARGETED_DEVICE_FAMILY = "1";
			};
			name = Debug;
		};
		AA00000C000000000000000C /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				DEVELOPMENT_TEAM = "";
				ENABLE_PREVIEWS = YES;
				GENERATE_INFOPLIST_FILE = NO;
				INFOPLIST_FILE = STEADI/Info.plist;
				INFOPLIST_KEY_CFBundleDisplayName = STEADI;
				IPHONEOS_DEPLOYMENT_TARGET = 17.0;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.steadi.demo;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_EMIT_LOC_STRINGS = YES;
				TARGETED_DEVICE_FAMILY = "1";
			};
			name = Release;
		};
/* End XCBuildConfiguration section */

/* Begin XCConfigurationList section */
		AA0000070000000000000007 /* Build configuration list for PBXProject "STEADI" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				AA0000090000000000000009 /* Debug */,
				AA00000A000000000000000A /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		AA0000080000000000000008 /* Build configuration list for PBXNativeTarget "STEADI" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				AA00000B000000000000000B /* Debug */,
				AA00000C000000000000000C /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
/* End XCConfigurationList section */
	};
	rootObject = AA0000050000000000000005 /* Project object */;
}
```

Do a final visual check: file opens cleanly as text, balanced braces.

- [ ] **Step 3: Write Info.plist**

Write `STEADI/Info.plist`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>en</string>
	<key>CFBundleDisplayName</key>
	<string>STEADI</string>
	<key>CFBundleExecutable</key>
	<string>$(EXECUTABLE_NAME)</string>
	<key>CFBundleIdentifier</key>
	<string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>$(PRODUCT_NAME)</string>
	<key>CFBundlePackageType</key>
	<string>$(PRODUCT_BUNDLE_PACKAGE_TYPE)</string>
	<key>CFBundleShortVersionString</key>
	<string>1.0</string>
	<key>CFBundleVersion</key>
	<string>1</string>
	<key>UILaunchScreen</key>
	<dict>
		<key>UIColorName</key>
		<string>LaunchBackground</string>
	</dict>
	<key>UISupportedInterfaceOrientations</key>
	<array>
		<string>UIInterfaceOrientationPortrait</string>
	</array>
	<key>UIRequiresFullScreen</key>
	<true/>
</dict>
</plist>
```

- [ ] **Step 4: Write placeholder app entry**

Write `STEADI/STEADIApp.swift` (final version lands in Task 2; this is just to make the skeleton compile):

```swift
import SwiftUI

@main
struct STEADIApp: App {
    var body: some Scene {
        WindowGroup {
            Text("STEADI")
        }
    }
}
```

- [ ] **Step 5: Write asset catalog**

`STEADI/Assets.xcassets/Contents.json`:

```json
{
  "info" : { "author" : "xcode", "version" : 1 }
}
```

`STEADI/Assets.xcassets/AccentColor.colorset/Contents.json`:

```json
{
  "colors" : [
    {
      "color" : {
        "color-space" : "srgb",
        "components" : { "alpha" : "1.000", "blue" : "0x1A", "green" : "0xE6", "red" : "0xB9" }
      },
      "idiom" : "universal"
    }
  ],
  "info" : { "author" : "xcode", "version" : 1 }
}
```

`STEADI/Assets.xcassets/LaunchBackground.colorset/Contents.json` (cream, referenced by Info.plist `UILaunchScreen`):

```json
{
  "colors" : [
    {
      "color" : {
        "color-space" : "srgb",
        "components" : { "alpha" : "1.000", "blue" : "0xF0", "green" : "0xF7", "red" : "0xFA" }
      },
      "idiom" : "universal"
    }
  ],
  "info" : { "author" : "xcode", "version" : 1 }
}
```

`STEADI/Assets.xcassets/AppIcon.appiconset/Contents.json` (single 1024 icon, Xcode 14+ format):

```json
{
  "images" : [
    {
      "filename" : "AppIcon.png",
      "idiom" : "universal",
      "platform" : "ios",
      "size" : "1024x1024"
    }
  ],
  "info" : { "author" : "xcode", "version" : 1 }
}
```

- [ ] **Step 6: Generate the 1024px app icon PNG**

PowerShell GDI+ (this PC has no other image tooling). Save as `STEADI/Assets.xcassets/AppIcon.appiconset/AppIcon.png`. Lime field `#B9E61A`, ink "S" centered, rounded-corner-safe full-bleed:

```powershell
Add-Type -AssemblyName System.Drawing
$bmp = New-Object System.Drawing.Bitmap 1024, 1024
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = 'AntiAlias'
$g.Clear([System.Drawing.Color]::FromArgb(255, 0xB9, 0xE6, 0x1A))
$font = New-Object System.Drawing.Font('Segoe UI', 640, [System.Drawing.FontStyle]::Bold)
$fmt = New-Object System.Drawing.StringFormat
$fmt.Alignment = 'Center'; $fmt.LineAlignment = 'Center'
$g.DrawString('S', $font, [System.Drawing.Brushes]::Black, (New-Object System.Drawing.RectangleF(0, -40, 1024, 1104)), $fmt)
$g.Dispose()
$bmp.Save('STEADI/Assets.xcassets/AppIcon.appiconset/AppIcon.png', [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
```

(Black here is the ink wordmark on lime; `Brushes::Black` is fine for a placeholder that gets swapped later without code changes.)

- [ ] **Step 7: Write README**

Write `README.md`:

```markdown
# STEADI iOS — demo app

Native SwiftUI demo of the STEADI companion app (investor demo). Front-end only; all data is bundled mock data matching the pitch deck.

## Build (Mac)

1. `git clone https://github.com/Aryamanironman/steadi-ios.git`
2. Open `STEADI.xcodeproj` in Xcode 16+.
3. Pick an iPhone 16 Pro (or any iOS 17+) simulator → Cmd+R. No signing needed for simulator.
4. Physical iPhone: plug in, select device, Xcode → Signing & Capabilities → choose your personal team (free provisioning), Cmd+R.

No packages to resolve — zero dependencies.
```

- [ ] **Step 8: Verify structure and commit**

Run: `git status --short` and confirm the tree is: `.gitignore`, `README.md`, `STEADI.xcodeproj/project.pbxproj`, `STEADI/` (STEADIApp.swift, Info.plist, Assets.xcassets with 4 json files + AppIcon.png). Confirm `project.pbxproj` contains `objectVersion = 77` and `PBXFileSystemSynchronizedRootGroup`.

```bash
git add -A
git commit -m "chore: Xcode project skeleton (synchronized groups, iOS 17, zero deps)

Co-Authored-By: Claude Code <noreply@anthropic.com>"
```

---

### Task 2: Theme + mock data (ported 1:1)

**Files:**
- Create: `STEADI/Theme/Brand.swift`
- Create: `STEADI/Data/SteadiData.swift`

**Interfaces:**
- Consumes: nothing (leaf layer).
- Produces (everything downstream compiles against these exact names):
  - `extension Color { static let lime, limeDark, ink, purple, cream, coral, gold, teal, tealDark, muted }`
  - `struct Severity: String, CaseIterable, Identifiable { case mild, moderate, elevated; var label: String; var color: Color }` — `id` is `rawValue`
  - `struct Meal: Identifiable { let id: Int; let time, type, items, duration: String; let spills: Int; let severity: Severity }`
  - `struct WeekPoint: Identifiable { let id = UUID(); let week: String; let score: Int }`
  - `struct DaySeverity: Identifiable { let id = UUID(); let day: String; let severity: Double; let meals, spills: Int }`
  - `struct TremorRow: Identifiable { let id = UUID(); let date: String; let amplitude, frequency: Double; let stability: Int }`
  - `struct DoctorReportData { … }` + `static let report: DoctorReportData`
  - `enum SteadiData { static let patient: PatientProfile; static let meals: [Meal]; static let weekly: [DaySeverity]; static let trend: [WeekPoint]; static let history: [TremorRow]; static let family: FamilySnapshot }`
  - `struct PatientProfile { name, condition, diagnosis, device: String; age, batteryPercent: Int }`
  - `struct FamilySnapshot { patientName, relation: String; age: Int; lastMeal, lastMealStatus, tremor7Day, avgSeverity: String; batteryPercent, todayMeals: Int }`

- [ ] **Step 1: Write Brand.swift**

Write `STEADI/Theme/Brand.swift`:

```swift
import SwiftUI

extension Color {
    static let lime = Color(red: 0xB9/255, green: 0xE6/255, blue: 0x1A/255)
    static let limeDark = Color(red: 0x7A/255, green: 0x9A/255, blue: 0x10/255)
    static let ink = Color(red: 0x17/255, green: 0x12/255, blue: 0x21/255)
    static let purple = Color(red: 0x2B/255, green: 0x1F/255, blue: 0x3D/255)
    static let cream = Color(red: 0xFA/255, green: 0xF7/255, blue: 0xF0/255)
    static let coral = Color(red: 0xFF/255, green: 0x6B/255, blue: 0x4A/255)
    static let gold = Color(red: 0xF5/255, green: 0xC5/255, blue: 0x18/255)
    static let teal = Color(red: 0x1A/255, green: 0x9E/255, blue: 0x7A/255)
    static let tealDark = Color(red: 0x0E/255, green: 0x3D/255, blue: 0x2C/255)
    static let muted = Color(red: 0x5A/255, green: 0x5A/255, blue: 0x6E/255)
}

// Shared card language: white, 20pt radius, hairline border, subtle shadow
struct BrandCard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .strokeBorder(Color.ink.opacity(0.05), lineWidth: 1)
            )
            .shadow(color: Color.ink.opacity(0.06), radius: 8, y: 2)
    }
}

extension View {
    func brandCard() -> some View { modifier(BrandCard()) }
}

// STEADI lime pill used in every header
struct BrandPill: View {
    var body: some View {
        Text("STEADI")
            .font(.system(size: 11, weight: .heavy))
            .tracking(2)
            .padding(.horizontal, 12)
            .padding(.vertical, 5)
            .background(Color.lime)
            .foregroundStyle(Color.ink)
            .clipShape(Capsule())
    }
}

// Severity badge chip (Mild / Moderate / Elevated)
struct SeverityBadge: View {
    let severity: Severity
    var body: some View {
        Text(severity.label)
            .font(.system(size: 12, weight: .semibold))
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(severity.color.opacity(0.12))
            .foregroundStyle(severity.color)
            .clipShape(Capsule())
    }
}
```

- [ ] **Step 2: Write SteadiData.swift**

Write `STEADI/Data/SteadiData.swift` — every literal is copied from `mockData.js`, no rounding, no reordering:

```swift
import SwiftUI

enum Severity: String, CaseIterable, Identifiable {
    case mild, moderate, elevated
    var id: String { rawValue }
    var label: String {
        switch self {
        case .mild: "Mild"
        case .moderate: "Moderate"
        case .elevated: "Elevated"
        }
    }
    var color: Color {
        switch self {
        case .mild: .teal
        case .moderate: .gold
        case .elevated: .coral
        }
    }
}

struct PatientProfile {
    let name: String
    let age: Int
    let condition: String
    let diagnosis: String
    let device: String
    let batteryPercent: Int
}

struct Meal: Identifiable {
    let id: Int
    let time: String
    let type: String
    let items: String
    let duration: String
    let spills: Int
    let severity: Severity
}

struct WeekPoint: Identifiable {
    let id = UUID()
    let week: String
    let score: Int
}

struct DaySeverity: Identifiable {
    let id = UUID()
    let day: String
    let severity: Double
    let meals: Int
    let spills: Int
}

struct TremorRow: Identifiable {
    let id = UUID()
    let date: String
    let amplitude: Double
    let frequency: Double
    let stability: Int
}

struct DoctorReportData {
    let patient: String
    let age: Int
    let condition: String
    let period: String
    let deviceUsage: String
    let totalMeals: Int
    let avgMealsPerDay: Double
    let totalSpills: Int
    let spillReduction: String
    let avgSeverityStart: String
    let avgSeverityEnd: String
    let stabilityScoreStart: Int
    let stabilityScoreEnd: Int
    let recommendations: [String]
}

struct FamilySnapshot {
    let patientName: String
    let relation: String
    let age: Int
    let lastMeal: String
    let lastMealStatus: String
    let tremor7Day: String
    let todayMeals: Int
    let avgSeverity: String
    let batteryPercent: Int
}

enum SteadiData {
    // mockData.js: patient
    static let patient = PatientProfile(
        name: "Margaret Wilson",
        age: 72,
        condition: "Essential Tremor",
        diagnosis: "March 2019",
        device: "STEADI-001",
        batteryPercent: 82
    )

    // mockData.js: todayMeals
    static let meals: [Meal] = [
        Meal(id: 1, time: "7:30 AM", type: "Breakfast", items: "Cereal, tea", duration: "18 min", spills: 0, severity: .mild),
        Meal(id: 2, time: "12:15 PM", type: "Lunch", items: "Soup, bread", duration: "24 min", spills: 1, severity: .moderate),
        Meal(id: 3, time: "6:00 PM", type: "Dinner", items: "Pasta, vegetables", duration: "22 min", spills: 0, severity: .mild),
    ]

    // mockData.js: weeklyTremorData
    static let weekly: [DaySeverity] = [
        DaySeverity(day: "Mon", severity: 3.2, meals: 3, spills: 1),
        DaySeverity(day: "Tue", severity: 2.8, meals: 3, spills: 0),
        DaySeverity(day: "Wed", severity: 3.5, meals: 2, spills: 2),
        DaySeverity(day: "Thu", severity: 2.4, meals: 3, spills: 0),
        DaySeverity(day: "Fri", severity: 2.1, meals: 3, spills: 0),
        DaySeverity(day: "Sat", severity: 2.6, meals: 3, spills: 1),
        DaySeverity(day: "Sun", severity: 1.9, meals: 3, spills: 0),
    ]

    // mockData.js: monthlyTrendData
    static let trend: [WeekPoint] = [
        WeekPoint(week: "Wk 1", score: 34),
        WeekPoint(week: "Wk 2", score: 36),
        WeekPoint(week: "Wk 3", score: 40),
        WeekPoint(week: "Wk 4", score: 45),
        WeekPoint(week: "Wk 5", score: 52),
        WeekPoint(week: "Wk 6", score: 58),
        WeekPoint(week: "Wk 7", score: 64),
        WeekPoint(week: "Wk 8", score: 70),
    ]

    // mockData.js: tremorHistory
    static let history: [TremorRow] = [
        TremorRow(date: "Jul 8", amplitude: 4.2, frequency: 6.1, stability: 34),
        TremorRow(date: "Jul 15", amplitude: 4.0, frequency: 5.9, stability: 36),
        TremorRow(date: "Jul 22", amplitude: 3.7, frequency: 5.7, stability: 40),
        TremorRow(date: "Jul 29", amplitude: 3.4, frequency: 5.5, stability: 45),
        TremorRow(date: "Aug 5", amplitude: 2.9, frequency: 5.3, stability: 52),
        TremorRow(date: "Aug 12", amplitude: 2.5, frequency: 5.1, stability: 58),
        TremorRow(date: "Aug 19", amplitude: 2.1, frequency: 4.9, stability: 64),
        TremorRow(date: "Aug 26", amplitude: 1.8, frequency: 4.7, stability: 70),
    ]

    // mockData.js: doctorReport
    static let report = DoctorReportData(
        patient: "Margaret Wilson",
        age: 72,
        condition: "Essential Tremor",
        period: "Jul 8 – Aug 26, 2026 (8 weeks)",
        deviceUsage: "21 days active",
        totalMeals: 63,
        avgMealsPerDay: 3.0,
        totalSpills: 8,
        spillReduction: "76%",
        avgSeverityStart: "4.2 / 10",
        avgSeverityEnd: "1.8 / 10",
        stabilityScoreStart: 34,
        stabilityScoreEnd: 70,
        recommendations: [
            "Continue current device usage — tremor amplitude reduced from 4.2 to 1.8 over 8 weeks",
            "Stability score improved from 34 to 70 — consistent upward trend",
            "Spill frequency reduced by 76% — measurably fewer episodes",
            "Consider scheduling follow-up neurological review in 3 months",
            "Device firmware v2.3 active — latest stabilisation algorithm",
        ]
    )

    // mockData.js: familyMember
    static let family = FamilySnapshot(
        patientName: "Margaret Wilson",
        relation: "Mother",
        age: 72,
        lastMeal: "Dinner · 6:00 PM",
        lastMealStatus: "Good",
        tremor7Day: "↓ Improving",
        todayMeals: 3,
        avgSeverity: "Mild",
        batteryPercent: 82
    )
}
```

- [ ] **Step 3: Cross-check every literal against mockData.js**

Open `stedi/steadi-app/src/data/mockData.js` side by side. Verify all 8 arrays/objects field-by-field (spells out to: patient 6 fields; 3 meals; 7 week days; 8 trend points; 8 history rows; report 14 fields + 5 recommendations; family 9 fields).

- [ ] **Step 4: Commit**

```bash
git add -A
git commit -m "feat: brand theme + mock data ported 1:1 from web mockData.js

Co-Authored-By: Claude Code <noreply@anthropic.com>"
```

---

### Task 3: TodayView — patient tab

**Files:**
- Create: `STEADI/Views/TodayView.swift`

**Interfaces:**
- Consumes: `SteadiData.patient/.meals/.weekly/.trend`, `Severity`, `SeverityBadge`, `BrandPill`, `.brandCard()`, `StabilityChart`, `WeeklySeverityChart`, `IndependenceRing` (from Task 4's Components.swift — Task 3 is written to reference them; Task 4 lands them).
- Produces: `struct TodayView: View` — referenced by the TabView in Task 7.

**Note:** Task 3 and Task 4 interlock. The plan's executor should implement Task 4's Components.swift FIRST if building in sequence, then Task 3; both commit separately. (If executing strictly in order, TodayView will show transient errors until Task 4 exists — acceptable, the commit in Task 4 is the one that must compile.)

- [ ] **Step 1: Write TodayView.swift**

```swift
import SwiftUI
import Charts

struct TodayView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                welcome
                independenceHero
                statRow
                StabilityChart(caption: "Higher score = steadier meals. Your stability has doubled in 8 weeks.")
                WeeklySeverityChart()
                mealsCard
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(Color.cream)
    }

    private var welcome: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Good evening, Margaret")
                .font(.system(size: 24, weight: .heavy))
                .foregroundStyle(Color.ink)
            Text("Here's your day at a glance")
                .font(.system(size: 14))
                .foregroundStyle(Color.muted)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // Independence hero — the screen's first card, per spec §4 Tab 1
    private var independenceHero: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Today's independence")
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(Color.muted)
            HStack(spacing: 20) {
                IndependenceRing(done: 3, total: 3)
                VStack(alignment: .leading, spacing: 6) {
                    Text("3 of 3 meals")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundStyle(Color.ink)
                    Text("eaten on her own")
                        .font(.system(size: 15))
                        .foregroundStyle(Color.muted)
                    HStack(spacing: 6) {
                        Image(systemName: "arrow.up")
                        Text("12% this week")
                    }
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(Color.limeDark)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.lime.opacity(0.2))
                    .clipShape(Capsule())
                    Text("Eat with dignity.")
                        .font(.system(size: 13, weight: .medium).italic())
                        .foregroundStyle(Color.purple)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .brandCard()
    }

    private var statRow: some View {
        HStack(spacing: 10) {
            StatCard(label: "Meals today", value: "3", icon: "fork.knife", tint: .teal)
            StatCard(label: "Spills", value: "1", icon: "exclamationmark.triangle", tint: .gold)
            StatCard(label: "Trend", value: "↓ 38%", icon: "arrow.down.forward", tint: .limeDark, tile: .lime.opacity(0.2))
            StatCard(label: "Stability", value: "70", icon: "checkmark.circle", tint: .teal)
        }
    }

    private var mealsCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Today's meals")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color.ink)
            ForEach(SteadiData.meals) { meal in
                HStack(spacing: 12) {
                    Text(meal.time.split(separator: ":")[0])
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(Color.purple)
                        .frame(width: 40, height: 40)
                        .background(Color.purple.opacity(0.1))
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 8) {
                            Text(meal.type).font(.system(size: 15, weight: .bold)).foregroundStyle(Color.ink)
                            SeverityBadge(severity: meal.severity)
                        }
                        Text(mealSubtitle(meal))
                            .font(.system(size: 12))
                            .foregroundStyle(Color.muted)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(Color.muted.opacity(0.4))
                }
                .padding(12)
                .background(Color.cream.opacity(0.6))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding(20)
        .brandCard()
    }

    private func mealSubtitle(_ m: Meal) -> String {
        let spill = m.spills == 0 ? "No spills" : m.spills == 1 ? "1 spill" : "\(m.spills) spills"
        return "\(m.items) · \(m.duration) · \(spill)"
    }
}
```

- [ ] **Step 2: Commit (will not yet compile — Components.swift lands in Task 4)**

```bash
git add -A
git commit -m "feat: TodayView — independence hero, stats, charts, meals list

Co-Authored-By: Claude Code <noreply@anthropic.com>"
```

---

### Task 4: Components.swift — shared components + charts

**Files:**
- Create: `STEADI/Views/Components.swift`

**Interfaces:**
- Consumes: `Severity`, `.brandCard()` from Task 2.
- Produces (used by Tasks 3, 5, 6, and STEADIApp):
  - `struct StatCard: View { let label: String; let value: String; let icon: String; let tint: Color; var tile: Color? = nil }` — SF Symbol name in `icon`; `tile` overrides the icon-circle background tint.
  - `struct SectionCard<Content: View>: View { init(title: String, @ViewBuilder content: () -> Content) }`
  - `struct IndependenceRing: View { let done: Int; let total: Int }`
  - `struct StabilityChart: View { let caption: String }` — 8-week line chart of `SteadiData.trend`, domain 0–80, lime-dark "↑ Improving" chip.
  - `struct WeeklySeverityChart: View` — Mon–Sun bar chart of `SteadiData.weekly`, domain 0–5, bar color by severity rule (>3 coral, >2 gold, else teal), rounded 6pt tops.
  - `struct TealDots: View { let meals: Int }` — the teal meal dots row used in FamilyView's weekly overview.

- [ ] **Step 1: Write Components.swift**

```swift
import SwiftUI
import Charts

struct StatCard: View {
    let label: String
    let value: String
    let icon: String
    let tint: Color
    var tile: Color? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(tint)
                .frame(width: 32, height: 32)
                .background((tile ?? tint).opacity(0.12))
                .clipShape(Circle())
            Text(value)
                .font(.system(size: 22, weight: .heavy))
                .foregroundStyle(Color.ink)
            Text(label)
                .font(.system(size: 11))
                .foregroundStyle(Color.muted)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .brandCard()
    }
}

struct SectionCard<Content: View>: View {
    let title: String
    let content: Content
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color.ink)
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .brandCard()
    }
}

// Hero ring: "3 of 3 meals eaten on her own"
struct IndependenceRing: View {
    let done: Int
    let total: Int

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.lime.opacity(0.18), lineWidth: 12)
            Circle()
                .trim(from: 0, to: total == 0 ? 0 : Double(done) / Double(total))
                .stroke(Color.lime, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                .rotationEffect(.degrees(-90))
            VStack(spacing: 0) {
                Text("\(done)/\(total)")
                    .font(.system(size: 22, weight: .heavy))
                    .foregroundStyle(Color.ink)
                Text("meals")
                    .font(.system(size: 10))
                    .foregroundStyle(Color.muted)
            }
        }
        .frame(width: 96, height: 96)
        .accessibilityLabel("Independence: \(done) of \(total) meals eaten on her own")
    }
}

struct StabilityChart: View {
    let caption: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Stability score — 8 weeks")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color.ink)
                Spacer()
                Text("↑ Improving")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(Color.limeDark)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.lime.opacity(0.2))
                    .clipShape(Capsule())
            }
            Chart(SteadiData.trend) { point in
                LineMark(x: .value("Week", point.week), y: .value("Score", point.score))
                    .foregroundStyle(Color.teal)
                    .lineStyle(StrokeStyle(lineWidth: 3, lineCap: .round))
                PointMark(x: .value("Week", point.week), y: .value("Score", point.score))
                    .foregroundStyle(Color.teal)
                    .symbolSize(30)
            }
            .chartYScale(domain: 0...80)
            .frame(height: 190)
            Text(caption)
                .font(.system(size: 11))
                .foregroundStyle(Color.muted)
        }
        .padding(20)
        .brandCard()
    }
}

struct WeeklySeverityChart: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("This week's tremor severity")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color.ink)
            Chart(SteadiData.weekly) { day in
                BarMark(
                    x: .value("Day", day.day),
                    y: .value("Severity", day.severity),
                    width: .ratio(0.62)
                )
                .foregroundStyle(barColor(day.severity))
                .cornerRadius(6)
            }
            .chartYScale(domain: 0...5)
            .frame(height: 160)
            Text("Lower is better. Green = mild, yellow = moderate, red = elevated.")
                .font(.system(size: 11))
                .foregroundStyle(Color.muted)
        }
        .padding(20)
        .brandCard()
    }

    private func barColor(_ s: Double) -> Color {
        s > 3 ? .coral : s > 2 ? .gold : .teal
    }
}

struct TealDots: View {
    let meals: Int
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<meals, id: \.self) { _ in
                Circle().fill(Color.teal).frame(width: 10, height: 10)
            }
        }
    }
}
```

- [ ] **Step 2: Verify — the pair Task 3 + Task 4 must now type-check**

No Swift toolchain on this PC; static verification:
1. Every symbol referenced in `TodayView.swift` (`StatCard`, `StabilityChart`, `WeeklySeverityChart`, `IndependenceRing`, `SeverityBadge`, `.brandCard()`) is defined in Tasks 2/4. Grep to confirm each definition exists exactly once.
2. `Charts` import present in both files using chart views.
3. Commit.

```bash
grep -c "struct StatCard" STEADI/Views/Components.swift   # expect 1
grep -c "struct IndependenceRing" STEADI/Views/Components.swift  # expect 1
git add -A
git commit -m "feat: shared components — StatCard, SectionCard, ring, Swift Charts

Co-Authored-By: Claude Code <noreply@anthropic.com>"
```

---

### Task 5: FamilyView tab

**Files:**
- Create: `STEADI/Views/FamilyView.swift`

**Interfaces:**
- Consumes: `SteadiData.family/.trend/.weekly`, `StabilityChart`, `SectionCard`, `TealDots`, `BrandPill`.
- Produces: `struct FamilyView: View` — referenced by TabView in Task 7.

- [ ] **Step 1: Write FamilyView.swift**

```swift
import SwiftUI

struct FamilyView: View {
    private let f = SteadiData.family

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Hi, Sarah")
                        .font(.system(size: 24, weight: .heavy))
                        .foregroundStyle(Color.ink)
                    Text("Here's how Mum is doing today")
                        .font(.system(size: 13))
                        .foregroundStyle(Color.muted)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                banner
                independenceCard
                statusCards
                StabilityChart(caption: "Mum's independence has doubled since she started STEADI.")
                weeklyOverview
                alertsCard
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(Color.cream)
    }

    // Spec §4 Tab 2: reassurance first — who, status pill, decorative Call/Message
    private var banner: some View {
        HStack(spacing: 14) {
            Image(systemName: "heart.fill")
                .font(.system(size: 22))
                .foregroundStyle(Color.coral)
                .frame(width: 56, height: 56)
                .background(Color.white.opacity(0.12))
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 2) {
                Text(f.patientName)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.white)
                Text("\(f.relation) · \(f.age) years")
                    .font(.system(size: 13))
                    .foregroundStyle(.white.opacity(0.75))
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 8) {
                Text("Eating independently")
                    .font(.system(size: 11, weight: .bold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.lime)
                    .foregroundStyle(Color.ink)
                    .clipShape(Capsule())
                HStack(spacing: 8) {
                    Label("Call", systemImage: "phone.fill")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 7)
                        .background(Color.white.opacity(0.14))
                        .clipShape(Capsule())
                    Label("Message", systemImage: "message.fill")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(Color.ink)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 7)
                        .background(Color.lime)
                        .clipShape(Capsule())
                }
            }
        }
        .padding(18)
        .background(
            LinearGradient(colors: [Color.tealDark, Color.tealDark.opacity(0.82)], startPoint: .leading, endPoint: .trailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }

    // Headline stat of the tab
    private var independenceCard: some View {
        HStack(spacing: 12) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 20))
                .foregroundStyle(Color.teal)
            VStack(alignment: .leading, spacing: 1) {
                Text("3 of 3 meals on her own today")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(Color.ink)
                Text("No assistance needed")
                    .font(.system(size: 12))
                    .foregroundStyle(Color.muted)
            }
            Spacer()
        }
        .padding(16)
        .brandCard()
    }

    private var statusCards: some View {
        HStack(spacing: 10) {
            StatCard(label: "Last meal", value: f.lastMeal, icon: "clock", tint: .teal)
            StatCard(label: "Battery", value: "\(f.batteryPercent)%", icon: "battery.75", tint: .teal)
            StatCard(label: "7-day tremor", value: f.tremor7Day, icon: "arrow.down.forward", tint: .limeDark, tile: .lime.opacity(0.2))
            StatCard(label: "Today's meals", value: "\(f.todayMeals)", icon: "checkmark.circle", tint: .teal)
        }
    }

    private var weeklyOverview: some View {
        SectionCard(title: "This week's meals") {
            VStack(spacing: 8) {
                ForEach(SteadiData.weekly) { day in
                    HStack(spacing: 10) {
                        Text(day.day)
                            .font(.system(size: 13, weight: .bold))
                            .foregroundStyle(Color.ink)
                            .frame(width: 38, alignment: .leading)
                        TealDots(meals: day.meals)
                        Text("\(day.meals) meals")
                            .font(.system(size: 11))
                            .foregroundStyle(Color.muted)
                        Spacer()
                        Group {
                            if day.spills == 0 {
                                Text("No spills ✓").foregroundStyle(Color.teal)
                            } else {
                                Text(day.spills == 1 ? "1 spill" : "\(day.spills) spills").foregroundStyle(Color.gold)
                            }
                        }
                        .font(.system(size: 11, weight: .semibold))
                        Text(String(format: "%.1f", day.severity))
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(severityText(day.severity))
                            .frame(width: 34, alignment: .trailing)
                    }
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .background(Color.cream.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }

    private func severityText(_ s: Double) -> Color {
        s > 3 ? .coral : s > 2 ? .gold : .teal
    }

    private var alertsCard: some View {
        SectionCard(title: "Recent alerts") {
            HStack(spacing: 10) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(Color.teal)
                Text("All clear — no alerts this week")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(Color.teal)
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.teal.opacity(0.06))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}
```

- [ ] **Step 2: Commit**

```bash
git add -A
git commit -m "feat: FamilyView — banner, independence card, weekly overview, alerts

Co-Authored-By: Claude Code <noreply@anthropic.com>"
```

---

### Task 6: ReportView tab

**Files:**
- Create: `STEADI/Views/ReportView.swift`

**Interfaces:**
- Consumes: `SteadiData.report/.history`, `StatCard`, `SectionCard`, `StabilityChart`.
- Produces: `struct ReportView: View` — referenced by TabView in Task 7.

- [ ] **Step 1: Write ReportView.swift**

```swift
import SwiftUI

struct ReportView: View {
    private let r = SteadiData.report

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                header
                independenceOutcomes
                severityComparison
                sensorTable
                observations
                shareButtons
                Text("Report generated by STEADI · Sensor data from device STEADI-001")
                    .font(.system(size: 11))
                    .foregroundStyle(Color.muted)
                    .padding(.bottom, 24)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(Color.cream)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 6) {
                Image(systemName: "doc.text.fill")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.coral)
                Text("CLINICAL REPORT")
                    .font(.system(size: 11, weight: .bold))
                    .tracking(1)
                    .foregroundStyle(Color.coral)
            }
            Text(r.patient)
                .font(.system(size: 24, weight: .heavy))
                .foregroundStyle(Color.ink)
            Text("\(r.condition) · Age \(r.age)")
                .font(.system(size: 13))
                .foregroundStyle(Color.muted)
            Text("Report period: \(r.period)")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(Color.ink.opacity(0.7))
                .padding(.top, 4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .brandCard()
    }

    // Spec §4 Tab 3 §2: independence outcomes FIRST, framed as clinical results
    private var independenceOutcomes: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                MetricCard(label: "Independence regained", value: r.spillReduction + " fewer spills", highlight: true)
                MetricCard(label: "Meals eaten unassisted", value: "\(r.totalMeals)", highlight: true)
            }
            HStack(spacing: 10) {
                MetricCard(label: "Stability gain", value: "\(r.stabilityScoreStart) → \(r.stabilityScoreEnd)", highlight: true)
                MetricCard(label: "Device usage", value: r.deviceUsage, highlight: false)
            }
        }
    }

    private var severityComparison: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Baseline (Jul 8)").font(.system(size: 11, weight: .semibold)).foregroundStyle(Color.coral)
                    Text(r.avgSeverityStart).font(.system(size: 28, weight: .heavy)).foregroundStyle(Color.coral)
                    Text("Average tremor amplitude").font(.system(size: 10)).foregroundStyle(Color.muted)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(14)
                .background(Color.coral.opacity(0.06))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                VStack(alignment: .leading, spacing: 2) {
                    Text("Latest (Aug 26)").font(.system(size: 11, weight: .semibold)).foregroundStyle(Color.teal)
                    Text(r.avgSeverityEnd).font(.system(size: 28, weight: .heavy)).foregroundStyle(Color.teal)
                    Text("Average tremor amplitude").font(.system(size: 10)).foregroundStyle(Color.muted)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(14)
                .background(Color.teal.opacity(0.06))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            StabilityChart(caption: "Tremor amplitude trending down; stability trending up.")
        }
    }

    private var sensorTable: some View {
        SectionCard(title: "Weekly sensor data") {
            VStack(spacing: 0) {
                HStack {
                    Text("Date").frame(maxWidth: .infinity, alignment: .leading)
                    Text("Amplitude").frame(maxWidth: .infinity, alignment: .trailing)
                    Text("Frequency").frame(maxWidth: .infinity, alignment: .trailing)
                    Text("Stability").frame(maxWidth: .infinity, alignment: .trailing)
                }
                .font(.system(size: 11, weight: .semibold))
                .foregroundStyle(Color.muted)
                .padding(.bottom, 6)
                ForEach(SteadiData.history) { row in
                    HStack {
                        Text(row.date).frame(maxWidth: .infinity, alignment: .leading)
                        Text(String(format: "%.1f", row.amplitude))
                            .foregroundStyle(amplitudeColor(row.amplitude))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        Text(String(format: "%.1f Hz", row.frequency))
                            .foregroundStyle(Color.ink)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        Text("\(row.stability)")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(Color.teal)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .font(.system(size: 12))
                    .padding(.vertical, 7)
                    Divider().overlay(Color.ink.opacity(0.05))
                }
            }
        }
    }

    private var observations: some View {
        SectionCard(title: "Clinical observations") {
            VStack(spacing: 8) {
                ForEach(Array(r.recommendations.enumerated()), id: \.offset) { _, rec in
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 13))
                            .foregroundStyle(Color.teal)
                            .padding(.top, 2)
                        Text(rec)
                            .font(.system(size: 13))
                            .foregroundStyle(Color.ink)
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.cream.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
    }

    // Decorative actions, per spec §2
    private var shareButtons: some View {
        HStack(spacing: 12) {
            Label("Send to doctor", systemImage: "square.and.arrow.up")
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(Color.ink)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(Color.lime)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            Label("Download PDF", systemImage: "arrow.down.doc")
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(Color.ink)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 14).strokeBorder(Color.ink.opacity(0.1), lineWidth: 1))
                .clipShape(RoundedRectangle(cornerRadius: 14))
        }
    }

    private func amplitudeColor(_ a: Double) -> Color {
        a > 3 ? .coral : a > 2 ? .gold : .teal
    }
}

private struct MetricCard: View {
    let label: String
    let value: String
    let highlight: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.system(size: 11))
                .foregroundStyle(Color.muted)
            Text(value)
                .font(.system(size: 17, weight: .heavy))
                .foregroundStyle(highlight ? Color.limeDark : Color.ink)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(Color.white)
        .overlay(RoundedRectangle(cornerRadius: 20).strokeBorder(highlight ? Color.lime.opacity(0.3) : Color.ink.opacity(0.05), lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
```

- [ ] **Step 2: Commit**

```bash
git add -A
git commit -m "feat: ReportView — independence outcomes, sensor table, recommendations

Co-Authored-By: Claude Code <noreply@anthropic.com>"
```

---

### Task 7: App entry — TabView shell

**Files:**
- Modify: `STEADI/STEADIApp.swift` (replace Task 1's placeholder entirely)

**Interfaces:**
- Consumes: `TodayView` (Task 3), `FamilyView` (Task 5), `ReportView` (Task 6), `Color.cream` (Task 2).
- Produces: the running app — 3 tabs.

- [ ] **Step 1: Replace STEADIApp.swift**

```swift
import SwiftUI

@main
struct STEADIApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                TodayView()
                    .tabItem { Label("Today", systemImage: "sun.max.fill") }
                FamilyView()
                    .tabItem { Label("Family", systemImage: "heart.fill") }
                ReportView()
                    .tabItem { Label("Report", systemImage: "doc.text.fill") }
            }
            .tint(Color.lime)
            .preferredColorScheme(.light)
        }
    }
}
```

- [ ] **Step 2: Static cross-check**

Grep that each view type is defined and the app references all three:
`grep -rn "struct TodayView\|struct FamilyView\|struct ReportView" STEADI/Views` → 3 hits.

- [ ] **Step 3: Commit**

```bash
git add -A
git commit -m "feat: tab shell — Today / Family / Report

Co-Authored-By: Claude Code <noreply@anthropic.com>"
```

---

### Task 8: Verification sweep + push instructions

**Files:**
- Modify: none (verification only; push done by the user or on request)

- [ ] **Step 1: Full-tree consistency check**

```bash
grep -rn "34" STEADI/Data/SteadiData.swift | head -3   # spot-check ported literals
grep -c "static let" STEADI/Data/SteadiData.swift       # expect 7
grep -rn "import Charts" STEADI                          # TodayView + Components only
```

Checklist (all must pass):
- All 7 Swift files exist: `STEADIApp.swift`, `Brand.swift`, `SteadiData.swift`, `TodayView.swift`, `FamilyView.swift`, `ReportView.swift`, `Components.swift`.
- `project.pbxproj` uses `objectVersion = 77` + `PBXFileSystemSynchronizedRootGroup`, no `YES_` stray line.
- No hex color appears outside `Brand.swift`.
- Copy strings match spec §4 (hero "3 of 3 meals", "eaten on her own", "Eat with dignity.", "Eating independently", "All clear — no alerts this week", "Mum's independence has doubled since she started STEADI.").
- Severity thresholds uniformly `>3 coral, >2 gold, else teal` (charts, weekly rows, sensor table).

- [ ] **Step 2: Report to user + next actions**

Tell the user:
1. Repo is ready at `stedi/steadi-ios` on branch `main`.
2. To publish: create empty repo `Aryamanironman/steadi-ios` on GitHub, then:
   ```bash
   cd stedi/steadi-ios
   git remote add origin https://github.com/Aryamanironman/steadi-ios.git
   git push -u origin main
   ```
3. On the Mac: clone → open `STEADI.xcodeproj` → iPhone 16 Pro simulator → Cmd+R. Physical device: free-provision with personal Apple ID.
4. Report build errors/screenshots back; fixes happen here and get pushed.
```
