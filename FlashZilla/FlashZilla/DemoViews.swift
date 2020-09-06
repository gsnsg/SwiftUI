//
//  DemoViews.swift
//  FlashZilla
//
//  Created by Nikhi on 03/09/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import Foundation
import SwiftUI
import CoreHaptics

struct RoationGestureDemo: View {
    @State private var currentAmount: Angle = .degrees(0)
    @State private var finalAmount: Angle = .degrees(0)
    var body: some View {
        Text("Hello, World!")
            .rotationEffect(currentAmount + finalAmount)
            .gesture(
                RotationGesture().onChanged { angle in
                    self.currentAmount = angle
                }
                .onEnded { angle in
                    withAnimation {
                        self.finalAmount = .degrees(0)
                        self.currentAmount = .degrees(0)
                    }
                    
                }
        )
        
    }
}


struct CombinedGesturesDemo: View {
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    
    var body: some View {
        
        let dragGesture = DragGesture().onChanged { value in
            self.offset = value.translation
        }.onEnded { value in
            self.offset = .zero
            self.isDragging = false
        }
        
        let pressGesture = LongPressGesture().onEnded { value in
            withAnimation {
                self.isDragging = true
            }
            
        }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        return  Circle()
            .fill(Color.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}


struct HapticsDemo: View {
    @State private var engine: CHHapticEngine?
       
       var body: some View {
           Text("Hello World")
               .onAppear(perform: prepareHaptics)
           .onTapGesture(perform: complexSuccess)
       }
       
       
       func complexSuccess() {
           guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {return}
           var events = [CHHapticEvent]()
           
           let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
           let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
           let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
           events.append(event)
           
           do {
               let pattern = try CHHapticPattern(events: events, parameters: [])
               let player = try engine?.makePlayer(with: pattern)
               try player?.start(atTime: 0)
           } catch {
               print("Failed to play pattern: \(error.localizedDescription).")
           }
       }
       
       func prepareHaptics() {
           guard CHHapticEngine.capabilitiesForHardware().supportsHaptics  else {return}
           do {
               self.engine = try CHHapticEngine()
               try engine?.start()
           } catch {
               print("There was an error creating the engine: \(error.localizedDescription)")
           }
       }
       
}


struct HitTestingView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
            }
            
            Circle()
                .fill(Color.red)
                .frame(width: 300, height: 300)
//            .contentShape(Rectangle())
                .onTapGesture {
                    print("Circle tapped!")
            }
            .allowsHitTesting(false)
        }
    }
    
}


struct TimerDemo: View {
    
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    @State private var counter = 0
    
    var body: some View {
        Text("Hello World!")
            .onReceive(timer) { time in
                if self.counter == 5 {
                    self.timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                self.counter += 1
        }
    }
    
}


struct NotificationDemo: View {
    
  
    var body: some View {
        Text("Hello World!")
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                print("Did enter background ")
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            print("Did enter foreground")
        }
    }
    
}


struct AccessibilityDemo1: View {
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? Color.black : Color.green)
        .foregroundColor(.white)
        .clipShape(Capsule())
        
    }
    
}


struct AccesibilityDemo2: View {
    
    @State private var scale: CGFloat = 1
    
    
    
    var body: some View {
        Text("Hello, World!")
            .scaleEffect(scale)
            .onTapGesture {
                self.withOptionalAnimation {
                    self.scale *= 1.5
                }
        }
        
        
    }
    
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
    
}
