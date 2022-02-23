//
//  CallKitViewModel.swift
//  callKitTest
//
//  Created by 藤治仁 on 2022/02/23.
//

import SwiftUI
import CallKit

class CallKitViewModel: ObservableObject {
    @Published var callState = "---"
    
    private let callObserver = CXCallObserver()
    
    func updateCallState() {
        callState = "Disconnected"
        debugLog(callObserver.calls.count)
        callObserver.calls.forEach { call in
            debugLog(call.uuid)
            debugLog(call.isOutgoing)
            debugLog(call.isOnHold)
            debugLog(call.hasConnected)
            debugLog(call.hasEnded)
            // 発信
            if (call.isOutgoing == true && call.hasConnected == false) {
                debugLog("発信　CXCallState : Dialing");
                callState = "Dialing"
            }

            // 着信
            if (call.hasConnected == false && call.hasEnded == false) {
                debugLog("着信　CXCallState : Incoming");
                callState = "Incoming"
            }

            // 受話
            if (call.hasConnected == true && call.hasEnded == false) {
                debugLog("受話　CXCallState : Connected");
                // Notification通知を送る（通知を送りたい箇所に書く。例えば何らかのボタンを押した際の処理の中等）
                NotificationCenter.default.post(name: Notification.Name("myNotificationName"),
                                                object: nil)
                callState = "Connected"
            }

            // 切断
            if (call.hasConnected == true && call.hasEnded == true) {
                debugLog("切断　CXCallState : Disconnected");
                callState = "Disconnected"
            }
        }
    }
}
