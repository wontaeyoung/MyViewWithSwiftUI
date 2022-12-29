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
            // MARK: -Overlay : 화면 하단에 고정 위치로 존재하는 버튼 파트
            .overlay(alignment: .bottom) {
                if let lastID = IDList.last {
                    if currentID < lastID {
                        Button {
                            increaseID()
                            withAnimation {
                                proxy.scrollTo(IDList[currentID], anchor : .top)
                            }
                        } label: {
                            Text("아래로 스크롤하기")
                                .bold()
                                .padding(.vertical, 10)
                                .frame(width : 250)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(15)
                                .padding(.bottom, 20)
                        }
                    } else {
                        agreeButton
                    }
                }
            }
            
            
        }
    }
    
    // MARK: -Button : 동의하기 버튼
    private var agreeButton : some View {
        Button {
            isAgreeDone = true
        } label: {
            Text(isAgreeDone ? "동의 완료" : "동의하기")
                .bold()
                .padding(.vertical, 10)
                .frame(width : 250)
                .foregroundColor(.white)
                .background(isAgreeDone ? Color.gray : Color.blue)
                .cornerRadius(15)
                .padding(.bottom, 20)
        }
        .disabled(isAgreeDone)
    }
    
    // MARK: -Func : 현재 proxy ID를 1씩 증가시키는 함수
    private func increaseID() {
        self.currentID += 1
    }
    
}



struct MyScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MyScrollView()
    }
}
