//
//  TestScrollView.swift
//  MyViewWithSwiftUI
//
//  Created by 원태영 on 2023/01/15.
//

import SwiftUI

struct TestScrollView: View {
    @State private var position = 0
    
    var body: some View {
        VStack {
            HStack {
                Button("Top") { position = 0 }
                Button("Middle") { position = 200 }
                Button("Middle2") { position = 400 }
                Button("Middle3") { position = 600 }
                Button("Bottom") { position = 1000 }
            }
            ScrollView {
                ScrollViewReader { proxy in
                    LazyVStack {
                        ForEach(0...500, id: \.self) { index in
                            Text("Row \(index)")
                        }
                    }
                    .onChange(of: position) { value in
                        withAnimation {
                            proxy.scrollTo(value, anchor: .center)
                        }
                    }
                }
            }
        }
    }
}

struct TestScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TestScrollView()
    }
}
