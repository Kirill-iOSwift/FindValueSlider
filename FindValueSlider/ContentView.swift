//
//  ContentView.swift
//  FindValueSlider
//
//  Created by Кирилл on 19.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue: Double = 50
    @State private var alpha = 0.5
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
                .padding(.bottom, 20)
            HStack {
                Text("0")
                UISliderRepresintation(value: $currentValue, alpha: $alpha)
                    .onChange(of: currentValue) { newValue in
                        changeAlpha(newValue)
                    }
                Text("100")
            }
            
            .padding(.bottom, 20)
            
            Button("Проверь меня!") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Ваше счёт"),
                    message: Text("\(computeScore())"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .padding(.bottom, 20)
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
                currentValue = 50
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    private func changeAlpha(_ newValue: Double) {
        let difference = abs(targetValue - Int(newValue))
        let transparency = CGFloat(difference) / 100.0
        alpha = 1.0 - Double(transparency)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
