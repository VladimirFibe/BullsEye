import Foundation

struct Model {
    private var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    var title = ""
    
    mutating func startNewRound() {
        title = ""
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
    }
    

    mutating func setCurrentValue(_ value: Int) {
        currentValue = value
    }
    
    mutating func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    mutating func points() -> Int {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        score += points
        return points
    }
}
