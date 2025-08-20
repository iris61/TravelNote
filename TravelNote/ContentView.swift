//
//  ContentView.swift
//  TravelNote
//
//  Created by ByteDance on 2025/8/19.
//

import SwiftUI

struct Travel {
    var name = "东京之旅"
    var dateRange = "2024年3月15日 - 3月22日"
    var viewpoints = "浅草寺 → 银座 → 新宿"
    var flight = "NH123 • 14:30 出发"
    var future = true
}

struct TravelCardView : View {
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

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // 标题
                HStack() {
                    Text("我的旅行")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                }
                
                // 选项卡
                HStack {
                    Button(action: {
                        // 切换到当前行程逻辑
                    }) {
                        Text("当前行程")
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                    Button(action: {
                        // 切换到历史记录逻辑
                    }) {
                        Text("历史记录")
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                
                // 东京之旅卡片
                TravelCardView(travel: Travel())
                TravelCardView(travel: Travel(future: false))
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Image(systemName: "person.crop.circle"))
            
            // 底部导航栏
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Spacer()
                        NavigationLink(destination: Text("首页内容")) {
                            VStack(spacing: 4) {
                                Image(systemName: "house.fill")
                                Text("首页")
                                    .font(.caption)
                            }
                            .foregroundColor(.blue)
                        }
                        Spacer()
                        NavigationLink(destination: Text("统计内容")) {
                            VStack(spacing: 4) {
                                Image(systemName: "chart.bar.fill")
                                Text("统计")
                                    .font(.caption)
                            }
                            .foregroundColor(.gray)
                        }
                        Spacer()
                        NavigationLink(destination: Text("设置内容")) {
                            VStack(spacing: 4) {
                                Image(systemName: "gear")
                                Text("设置")
                                    .font(.caption)
                            }
                            .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
