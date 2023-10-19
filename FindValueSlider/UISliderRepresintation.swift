//
//  UISliderRepresintation.swift
//  FindValueSlider
//
//  Created by Кирилл on 19.10.2023.
//

import SwiftUI

struct UISliderRepresintation: UIViewRepresentable {
    
    @Binding var value: Double
    @Binding var alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.value = Float(value)
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeSliderValue),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, alpha: $alpha)
    }
}

extension UISliderRepresintation {
    final class Coordinator: NSObject {
        @Binding var value: Double
        @Binding var alpha: Double
        
        init(value: Binding<Double>, alpha: Binding<Double> ) {
            self._value = value
            self._alpha = alpha
        }
        
        @objc
        func changeSliderValue(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct UISliderRepresintation_Previews: PreviewProvider {
    static var previews: some View {
        UISliderRepresintation(value: .constant(100), alpha: .constant(1))
    }
}
