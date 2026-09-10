import SwiftUI

extension Color {
    static let lime = Color(red: 0xB9/255, green: 0xE6/255, blue: 0x1A/255)
    static let limeDark = Color(red: 0x7A/255, green: 0x9A/255, blue: 0x10/255)
    static let ink = Color(red: 0x17/255, green: 0x12/255, blue: 0x21/255)
    static let steadiPurple = Color(red: 0x2B/255, green: 0x1F/255, blue: 0x3D/255)
    static let cream = Color(red: 0xFA/255, green: 0xF7/255, blue: 0xF0/255)
    static let coral = Color(red: 0xFF/255, green: 0x6B/255, blue: 0x4A/255)
    static let gold = Color(red: 0xF5/255, green: 0xC5/255, blue: 0x18/255)
    static let steadiTeal = Color(red: 0x1A/255, green: 0x9E/255, blue: 0x7A/255)
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
