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
