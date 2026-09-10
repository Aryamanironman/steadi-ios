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
                .lineLimit(1)
                .minimumScaleFactor(0.55)
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
                    .foregroundStyle(Color.steadiTeal)
                    .lineStyle(StrokeStyle(lineWidth: 3, lineCap: .round))
                PointMark(x: .value("Week", point.week), y: .value("Score", point.score))
                    .foregroundStyle(Color.steadiTeal)
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
        s > 3 ? .coral : s > 2 ? .gold : .steadiTeal
    }
}

struct TealDots: View {
    let meals: Int
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<meals, id: \.self) { _ in
                Circle().fill(Color.steadiTeal).frame(width: 10, height: 10)
            }
        }
    }
}
