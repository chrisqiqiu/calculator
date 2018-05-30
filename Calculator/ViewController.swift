import UIKit

enum modes {
    case not_set
    case addition
    case subtraction
    case multiplication
}

class ViewController: UIViewController {
    @IBOutlet weak var screenText: UILabel!
    
    var labelString:String = "0"
    var currentMode:modes = .not_set
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressPlus(_ sender: Any) {
        
        
        changeModes(newMode: .addition)
        
    }
    
    @IBAction func didPressSubtract(_ sender: Any) {
        changeModes(newMode: .subtraction)
    }
    
    @IBAction func didPressMultiply(_ sender: Any) {
        changeModes(newMode: .multiplication)
        
    }

    @IBAction func didPressClear(_ sender: Any) {
        screenText.text  = "0"
        labelString = "0"
        currentMode = .not_set
        savedNum = 0
        lastButtonWasMode = false
        
    }
    
    @IBAction func didPressEquals(_ sender: Any) {
        guard lastButtonWasMode==false && currentMode != .not_set else {
            return
        }
        
        if(currentMode == .addition){
            labelString="\(savedNum+Int(screenText.text!.replacingOccurrences(of: ",", with: ""))!)"
        }
        else if (currentMode == .subtraction){
            labelString="\(savedNum-Int(screenText.text!.replacingOccurrences(of: ",", with: ""))!)"
        }
        else
        {
            labelString="\(savedNum*Int(screenText.text!.replacingOccurrences(of: ",", with: ""))!)"
        }
        
        updateText()
        
        lastButtonWasMode = true
        currentMode = .not_set
        //savedNum=Int(screenText.text!)!
        
    }
    
    @IBAction func didPressNumbers(_ sender: UIButton) {
        
        let stringValue:String? = sender.titleLabel?.text
        
        
        if lastButtonWasMode == true
        {
            labelString="0"
        }
        
        
        
        labelString = labelString.appending(stringValue!)
        
        updateText()
        
        lastButtonWasMode=false
        
    }
    
    func updateText(){
        guard let labelInt = Int(labelString) else {
            return
        }
        
        let formatter:NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let num:NSNumber = NSNumber(value: labelInt)
        
        screenText.text  = formatter.string(from: num)
        
    }
    
    func changeModes(newMode:modes){
        
        if (lastButtonWasMode==false && currentMode != .not_set)
        {
            if(currentMode == .addition){
                labelString="\(savedNum+Int(screenText.text!.replacingOccurrences(of: ",", with: ""))!)"
            }
            else if (currentMode == .subtraction){
                labelString="\(savedNum-Int(screenText.text!.replacingOccurrences(of: ",", with: ""))!)"
            }
            else
            {
                labelString="\(savedNum*Int(screenText.text!.replacingOccurrences(of: ",", with: ""))!)"
            }
            
            updateText()
        }
        
        currentMode=newMode
        lastButtonWasMode=true
        savedNum=Int(screenText.text!.replacingOccurrences(of: ",", with: ""))!
        //screenText.text  = "0"
        //labelString = "0"
    }


}

