//
//  TNETravelCardView.swift
//  TravelNote
//
//  Created by ByteDance on 2025/8/20.
//

import SwiftUI

struct TNETravelCardView : View {
    var travel : TNETravelModel
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
                        gradient: Gradient(colors: [
                            Color(hex: "#f093fb") ?? Color.clear,  // 起始色
                            Color(hex: "#f5576c") ?? Color.clear   // 结束色
                        ]),
                        startPoint: .topLeading,  // 135度渐变的起点
                        endPoint: .bottomTrailing // 135度渐变的终点
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
