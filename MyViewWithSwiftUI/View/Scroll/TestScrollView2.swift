//
//  TestScrollView2.swift
//  MyViewWithSwiftUI
//
//  Created by 원태영 on 2023/01/15.
//

import SwiftUI

struct TestScrollView2: View {
    @State private var offset = CGFloat.zero
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<100) { i in
                    Text("Item \(i)").padding()
                }
            }
            .overlay {
                GeometryReader { proxy -> Color in
                    DispatchQueue.main.async {
                        offset = -proxy.frame(in: .named("scroll")).origin.y
                    }
                    return Color.clear
                }
            }
            .onChange(of: offset) { newValue in
                print(newValue)
            }
        }
        .coordinateSpace(name: "scroll")
    }

}

struct TestScrollView2_Previews: PreviewProvider {
    static var previews: some View {
        TestScrollView2()
    }
}
