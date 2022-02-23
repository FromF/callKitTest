//
//  CallKitView.swift
//  callKitTest
//
//  Created by 藤治仁 on 2022/02/23.
//

import SwiftUI

struct CallKitView: View {
    @StateObject private var viewModel = CallKitViewModel()
    
    var body: some View {
        VStack {
            Text("CallKit Test")
                .padding()
            Text("\(viewModel.callState)")
                .padding()
            Button("Refresh") {
                viewModel.updateCallState()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CallKitView()
    }
}
