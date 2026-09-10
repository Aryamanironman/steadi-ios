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
