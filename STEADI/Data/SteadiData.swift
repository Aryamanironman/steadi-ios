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
