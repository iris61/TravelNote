//
//  TNECreateTravelStepOne.swift
//  TravelNote
//
//  Created by ByteDance on 2025/8/21.
//

import SwiftUI

/// 目的地模型
struct Destination: Identifiable {
    let id = UUID()
    let name: String       // 城市名
    let country: String    // 所属国家
    let icon: String       // SF Symbols 图标（可替换成自定义图片名等）
}

struct TNECreateTravelStepOne: View {
    // 接收父视图的绑定，用于关闭弹窗
    @Binding var isPresented: Bool
    // 存储用户选中的目的地
    @State private var selectedDestination: Destination?
    // 存储用户手动输入的目的地
    @State private var customDestination: String = ""
    
    // 模拟的预设目的地数据
    let presetDestinations: [Destination] = [
        Destination(name: "东京", country: "日本", icon: "🗼"),
        Destination(name: "巴黎", country: "法国", icon: "🥐"),
        Destination(name: "纽约", country: "美国", icon: "🗽"),
        Destination(name: "巴厘岛", country: "印尼", icon: "🏖️")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // 步骤指示器
                HStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 30, height: 30)
                        .overlay {
                            Text("1")
                                .foregroundColor(.white)
                        }
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 2)
                        .overlay {
                            HStack(spacing: 0) {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 30)
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(width: 30)
                                    .opacity(0.3)
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 30)
                            }
                        }
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 30, height: 30)
                        .overlay {
                            Text("2")
                                .foregroundColor(.white)
                        }
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 2)
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 30, height: 30)
                        .overlay {
                            Text("3")
                                .foregroundColor(.white)
                        }
                }
                .padding(.top, 10)
                
                // 标题
                HStack {
                    Text("选择目的地")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(10)
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .frame(width: 36, height: 36)
                    }
                }
                
                HStack {
                    Spacer()
                    // 地球图标和提示语
                    VStack(spacing: 8) {
                        Text("🌍")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                        Text("选择你想去的目的地")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 15)
                    Spacer()
                }
                
                // 预设目的地卡片
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                    ForEach(presetDestinations) { dest in
                        Button {
                            selectedDestination = dest
                            customDestination = "" // 选中预设，清空自定义输入
                        } label: {
                            VStack(spacing: 8) {
                                Text(dest.icon)
                                    .font(.system(size: 30))
                                Text(dest.name)
                                    .font(.headline)
                                Text(dest.country)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(selectedDestination?.id == dest.id ? Color.blue : Color.gray.opacity(0.3), lineWidth: 2)
                            )
                            .cornerRadius(10)
                        }
                    }
                }
                
                // 自定义输入区域
                VStack(alignment: .leading, spacing: 8) {
                    Text("或输入其他目的地")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    TextField("例如：京都", text: $customDestination)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.gray.opacity(0.1))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                        .onChange(of: customDestination) { oldValue, newValue in
                            selectedDestination = nil // 输入自定义内容，清空预设选中
                        }
                }
                
                // 下一步按钮
                Button {
                    // 这里处理“下一步”逻辑，比如拿到 selectedDestination 或 customDestination 做后续操作
                    if let selected = selectedDestination {
                        print("选中预设目的地：\(selected.name) - \(selected.country)")
                    } else if !customDestination.isEmpty {
                        print("自定义目的地：\(customDestination)")
                    } else {
                        print("未选择或输入目的地")
                    }
                    // 可在此处关闭弹窗、跳转等，比如 isPresented.toggle()
                } label: {
                    Text("下一步")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color(hex: "#4facfe") ?? Color.clear, Color(hex: "#00f2fe") ?? Color.clear]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(8)
                }
                .padding(.top, 10)
                .disabled(selectedDestination == nil && customDestination.isEmpty) // 未选择或输入时禁用
            }
            .padding()
        }
    }
}
