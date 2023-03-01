//
//  CreateChallengeViewModel.swift
//  Fitness
//
//  Created by User on 27/2/2023.
//

import SwiftUI

final class CreateChallengeViewModel: ObservableObject {
    @Published var dropdowns: [ChallengePartViewModel] = [
        .init(type: .exercise),
        .init(type: .startingAmount),
        .init(type: .increase),
        .init(type: .length)
    ]
    
    enum Action {
        case selectOption(index: Int)
    }
    
    var hasSelectedDropdown: Bool {
        selectedDropdownIndex != nil
    }
    
    var selectedDropdownIndex: Int? {
        dropdowns.enumerated().first(where: { $0.element.isFirstOptionSelected })?.offset
    }
    
    var displayedOptions: [DropdownOption] {
        guard let selectedDropdownIndex = selectedDropdownIndex else { return [] }
        return dropdowns[selectedDropdownIndex].options
    }
    
    func send(action: Action) {
        switch action {
        case let .selectOption(index):
            guard let selectedDropdownIndex = selectedDropdownIndex else { return }
            clearSelectedOptions()
            dropdowns[selectedDropdownIndex].options[index].isFirstOptionSelected = true
            clearSelectedDropdown()
        }
    }
    
    func clearSelectedOptions() {
        guard let selectedDropdownIndex = selectedDropdownIndex else { return }
        
        dropdowns[selectedDropdownIndex].options.indices.forEach { index in
            dropdowns[selectedDropdownIndex].options[index].isFirstOptionSelected = false
        }
    }
    
    func clearSelectedDropdown() {
        guard let selectedDropdownIndex = selectedDropdownIndex else { return }
        dropdowns[selectedDropdownIndex].isFirstOptionSelected = false
    }
}

extension CreateChallengeViewModel {
    struct ChallengePartViewModel: DropdownItemProtocol {
        var options: [DropdownOption]
        var isFirstOptionSelected: Bool = false
        private let type: ChallengePartType
        
        var headerTitle: String {
            type.rawValue
        }
        
        var dropdownTitle: String {
            options.first(where: { $0.isFirstOptionSelected })?.formatted ?? ""
        }
        
        init(type: ChallengePartType) {
            switch type {
                case .exercise:
                    self.options = ExerciseOption.allCases.map {$0.toDropdownOption }
                
                case .startingAmount:
                    self.options = StartOption.allCases.map {$0.toDropdownOption }
                
                case .increase:
                    self.options = IncreaseOption.allCases.map {$0.toDropdownOption }
                    
                case .length:
                    self.options = LengthOption.allCases.map {$0.toDropdownOption }
            }
            
            self.type = type
        }
        
        enum ChallengePartType: String, CaseIterable {
            case exercise = "Pilates"
            case startingAmount = "Starting Amount"
            case increase = "Daily Increase"
            case length = "Challenge Length"
        }
        
        enum ExerciseOption: String, CaseIterable, DropdownOptionProtocol {
            case rollUp
            case rollOver
            case oneLegCircle
            case oneLegStretch
            
            var toDropdownOption: DropdownOption {
                .init(
                    type: .text(rawValue),
                    formatted: rawValue.capitalized,
                    isFirstOptionSelected: self == .rollUp
                )
            }
        }
        
        enum StartOption: Int, CaseIterable, DropdownOptionProtocol {
            case one = 1, two, three, four, five
            
            var toDropdownOption: DropdownOption {
                .init(
                    type: .number(rawValue),
                    formatted: "\(rawValue)",
                    isFirstOptionSelected: self == .one
                )
            }
        }
        
        enum IncreaseOption: Int, CaseIterable, DropdownOptionProtocol {
            case one = 1, two, three, four, five
            
            var toDropdownOption: DropdownOption {
                .init(
                    type: .number(rawValue),
                    formatted: "+\(rawValue)",
                    isFirstOptionSelected: self == .one
                )
            }
        }
        
        enum LengthOption: Int, CaseIterable, DropdownOptionProtocol {
            case seven = 7, fourteen = 14, twentyOne = 21, twentyEight = 28
            
            var toDropdownOption: DropdownOption {
                .init(
                    type: .number(rawValue),
                    formatted: "\(rawValue) days",
                    isFirstOptionSelected: self == .seven
                )
            }
        }
    }
}
