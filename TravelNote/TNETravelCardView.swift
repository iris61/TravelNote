//
//  TNETravelCardView.swift
//  TravelNote
//
//  Created by ByteDance on 2025/8/20.
//

import SwiftUI


struct Travel {
    var name = "东京之旅"
    var dateRange = "2024年3月15日 - 3月22日"
    var viewpoints = "浅草寺 → 银座 → 新宿"
    var flight = "NH123 • 14:30 出发"
    var future = true
}

struct TNETravelCardView : View {
    var travel : Travel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(travel.name)
                .font(.title2)
                .fontWeight(.semibold)
            Text(travel.dateRange)
                .font(.subheadline)
            HStack {
                Image(systemName: "pin")
                Text(travel.viewpoints)
            }
            HStack {
                Image(systemName: "airplane")
                Text(travel.flight)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(travel.future ?
                    LinearGradient(
                        gradient: Gradient(colors: [Color.pink.opacity(0.8), Color.red.opacity(0.8)]),
                        startPoint: .leading,
                        endPoint: .trailing
                    ) :
                        LinearGradient(
                            gradient: Gradient(colors: [Color.white, Color.white]), // 纯色渐变
                            startPoint: .leading,
                            endPoint: .trailing
                        )
        )
        .foregroundColor(travel.future ? .white : .black)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
        .padding(.horizontal, 20)
    }
}
