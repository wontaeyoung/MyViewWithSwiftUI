//
//  ProxyScrollView.swift
//  MyViewWithSwiftUI
//
//  Created by 원태영 on 2022/12/25.
//

import SwiftUI

struct ProxyScrollView: View {
    let IDList : [Int] = [0,1,2,3]
    
    @ObservedObject var scrollViewModel : ScrollViewModel = ScrollViewModel()
    @State private var currentID : Int = 0
    @State private var isAgreeDone : Bool = false
//    @State private var currentOffset :
    
    var body: some View {
        VStack {
            // MARK: -ScrollView : proxy로 스크롤을 조절할 수 있는 ScrollView
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment : .leading) {
                        ForEach(scrollViewModel.scrollModels.indices) { index in
                            TermsCell(index: index, scrollViewModel: scrollViewModel)
                                .id(index)
                        }
                        .padding(.horizontal, 20)
                    }
                }
                // MARK: -Overlay : 화면 하단에 고정 위치로 존재하는 버튼 파트
                if let lastID = IDList.last {
                    if currentID < lastID {
                        Button {
                            increaseID()
                            withAnimation {
                                proxy.scrollTo(IDList[currentID], anchor : .top)
                            }
                        } label: {
                            Text("아래로 스크롤하기")
                                .modifier(ScrollOverlayButtonModifier(isAgreeDone: $isAgreeDone))
                        }
                    } else {
                        agreeButton
                    }
                }
            }
        }
        .padding(.top, 20)
    }
    
    // MARK: -Button : 동의하기 버튼
    private var agreeButton : some View {
        Button {
            isAgreeDone = true
        } label: {
            Text(isAgreeDone ? "동의 완료" : "동의하기")
                .modifier(ScrollOverlayButtonModifier(isAgreeDone: $isAgreeDone))
        }
        .disabled(isAgreeDone)
    }
    
    // MARK: -Func : 현재 proxy ID를 1씩 증가시키는 함수
    private func increaseID() {
        self.currentID += 1
    }
    
}


// MARK: -View : 약관 제목과 내용 Cell
struct TermsCell : View {
    let index : Int
    @ObservedObject var scrollViewModel : ScrollViewModel
    
    var body : some View {
        Text(scrollViewModel.scrollModels[index].title)
            .font(.largeTitle.bold())
            .padding(.bottom, 20)
        
        Text(scrollViewModel.scrollModels[index].content)
            .font(.body)
            .padding(.bottom, 60)
    }
}


// MARK: -Modifier : Overlay 버튼 Modifier
struct ScrollOverlayButtonModifier : ViewModifier {
    @Binding var isAgreeDone : Bool
    var backgroundColor : Color {
        return isAgreeDone ? .gray : .blue
    }
    
    func body(content: Content) -> some View {
        content
            .bold()
            .padding(.vertical, 10)
            .frame(width : 250)
            .foregroundColor(.white)
            .background(backgroundColor)
            .cornerRadius(15)
            .shadow(radius: 10)
            .padding(.bottom, 20)
    }
}


struct ProxyScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ProxyScrollView()
    }
}
