//
//  ContentView.swift
//  TravelNote
//
//  Created by ByteDance on 2025/8/19.
//

import SwiftUI

struct ContentView: View {
    let segmentOptions = ["当前行程", "历史记录"]
        // 选中的索引
    @State private var selectedSegment = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                // 标题
                HStack() {
                    Text("我的旅行")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                }
                
                TNESegmentControl(
                    segments: segmentOptions,
                    selectedIndex: $selectedSegment,
                    selectedColor: .gray.opacity(0.6),
                    unselectedColor: .gray.opacity(0.2)
                )
                
                // 东京之旅卡片
                TNETravelCardView(travel: TNETravelModel())
                TNETravelCardView(travel: TNETravelModel(future: false))
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
