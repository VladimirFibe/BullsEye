import UIKit

class ViewController: UIViewController {
    var model = Model()
    
    
    @IBOutlet var targetLabel :UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(
            top: 0,
            left: 14,
            bottom: 0,
            right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    @IBAction func ShowAlert () {
        let message = "You scored \(model.points()) points"
        let alert = UIAlertController(
            title: model.title,
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in self.startNewRound()
            })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func sliderMoved(_ slider: UISlider) {
        model.setCurrentValue(lroundf(slider.value))
    }

    @IBAction func startNewGame() {
        model.startNewGame()
        updateLabels()
    }
    
    private func startNewRound() {
        model.startNewRound()
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(model.targetValue)
        scoreLabel.text = String(model.score)
        roundLabel.text = String(model.round)
    }
}
