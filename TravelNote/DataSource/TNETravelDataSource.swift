//
//  TNETravelDataSource.swift
//  TravelNote
//
//  Created by ByteDance on 2025/8/21.
//

struct TNETravelDataSource {
    static func generateTravelModels() -> [TNETravelModel] {
        return [
            TNETravelModel(name: "东京之旅", dateRange: "2024年3月15日 - 3月22日", viewpoints: "浅草寺 → 银座 → 新宿", nextStatus: "NH123 • 14:30 出发", future: true),
            TNETravelModel(name: "巴厘岛度假", dateRange: "2024年4月10日 - 4月17日", viewpoints: "库塔海滩 → 乌布 → 金巴兰", nextStatus: "阿雅娜度假村", future: false)
        ]
    }
}
