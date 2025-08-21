//
//  TNETravelModel.swift
//  TravelNote
//
//  Created by ByteDance on 2025/8/21.
//
import SwiftUI

struct TNETravelModel : Identifiable {
    let id = UUID() // 唯一标识
    let name : String
    let dateRange : String
    let viewpoints : String
    let nextStatus : String
    let future : Bool
}
