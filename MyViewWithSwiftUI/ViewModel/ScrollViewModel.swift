//
//  ScrollViewModel.swift
//  MyViewWithSwiftUI
//
//  Created by 원태영 on 2022/12/25.
//

import Foundation

class ScrollViewModel : ObservableObject {
    @Published var scrollModels: [ScrollModel]
    
    init(scrollModels: [ScrollModel] = []) {
        self.scrollModels = scrollModels
    }
}
