//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    @IBOutlet weak var animalTitle: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var answersChoosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        let yourAnimal: AnimalType = getMostFrequentAnimal()
        
        animalTitle.text = "Вы - \(yourAnimal.rawValue)"
        descriptionLabel.text = yourAnimal.definition
    }
    
    func getMostFrequentAnimal() -> AnimalType{
        var turtles = 0
        var dogs = 0
        var cats = 0
        var rabbits = 0
        
        for answer in answersChoosen {
            let currentAnimal = answer.type
            switch currentAnimal {
            case .cat:
                cats += 1
            case .dog:
                dogs += 1
            case .rabbit:
                rabbits += 1
            case .turtle:
                turtles += 1
            }
        }
        
        var mostAnimal = AnimalType.dog
        var animalFreqeuncy = dogs
        
        if animalFreqeuncy < cats{
            mostAnimal = AnimalType.cat
            animalFreqeuncy = cats
        }
        if animalFreqeuncy < rabbits{
            mostAnimal = AnimalType.rabbit
            animalFreqeuncy = rabbits
        }
        if animalFreqeuncy < turtles {
            mostAnimal = AnimalType.turtle
            animalFreqeuncy = turtles
        }
        return mostAnimal
    }
}
