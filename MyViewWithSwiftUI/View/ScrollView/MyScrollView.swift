//
//  MyScrollView.swift
//  MyViewWithSwiftUI
//
//  Created by 원태영 on 2022/12/25.
//

import SwiftUI

struct MyScrollView: View {
    
    let IDList : [Int] = [0,1,2,3]
    
    @ObservedObject var scrollViewModel : ScrollViewModel = ScrollViewModel(
        scrollModels: [scrollModel1, scrollModel2, scrollModel3, scrollModel4]
    )
    @State private var currentID : Int = 0
    @State private var isAgreeDone : Bool = false
    
    var body: some View {
        // MARK: -ScrollView : proxy로 스크롤을 조절할 수 있는 ScrollView
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment : .leading) {
                    ForEach(scrollViewModel.scrollModels.indices) { index in
                        Text(scrollViewModel.scrollModels[index].title)
                            .font(.largeTitle.bold())
                            .padding(.top, index == 0 ? 0 : 50)
                            .padding(.bottom, 20)
                            .id(IDList[index])
                        
                        Text(scrollViewModel.scrollModels[index].content)
                            .font(.body)
                            .padding(.bottom, 80)
                        
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.top, 60)
            }
        }
    }
}




struct MyScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MyScrollView()
    }
}
