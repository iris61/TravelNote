//
//  Segment.swift
//  TravelNote
//
//  Created by ByteDance on 2025/8/20.
//

import SwiftUI

struct TNESegmentControl: View {
    // 选项数组
    let segments: [String]
    // 绑定当前选中的索引
    @Binding var selectedIndex: Int
    // 选中状态的背景色
    var selectedColor: Color = .gray
    // 选中状态的文字色
    var selectedTextColor: Color = .black
    // 未选中状态的背景色
    var unselectedColor: Color = .gray.opacity(0.2)
    // 未选中状态的文字色
    var unselectedTextColor: Color = .black
    
    var spacing: CGFloat = 2 // 选项之间的间距
    
    var body: some View {
        GeometryReader { proxy in
            let totalWidth = proxy.size.width
            // 计算每个选项的宽度（总宽度 - 间距总和，再平分）
            let itemWidth = (totalWidth - 2 * 5 - 2 * 20 - CGFloat(segments.count - 1) * spacing) / CGFloat(segments.count)
            
            HStack(spacing: spacing) {
                ForEach(0..<segments.count, id: \.self) { index in
                    Button(action: {
                        // 点击切换选中状态，添加反馈
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedIndex = index
                        }
                    }) {
                        Text(segments[index])
                            .frame(width: itemWidth)
                            .padding(.vertical, 8)
                            .foregroundColor(index == selectedIndex ? selectedTextColor : unselectedTextColor)
                            .background(index == selectedIndex ? selectedColor : unselectedColor)
                            .cornerRadius(8)
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                }
            }
            .padding(5)
            .frame(maxWidth:.infinity)
            .background(.gray.opacity(0.1))
            .cornerRadius(13)
            .padding(.horizontal, 20)
            .padding(.vertical, 0)
        }.frame(height: 44)
    }
}
