let tipAndTotal = (4.00, 25.19)
//This is called a tuple//

tipAndTotal.0
tipAndTotal.1

let (theTipAmt, theTotal) = tipAndTotal
theTipAmt
theTotal

let tipAndTotalNamed = (tipAmt: 5.00, total: 30.25)
tipAndTotalNamed.tipAmt

let total = 21.09
let taxPercent = 0.06
let subTotal = total / (taxPercent + 1)
func calcTipWithPercent(tipPercent: Double) ->
    (tipAmount: Double, finalTotal: Double)
{
    let tipAmount = subTotal * tipPercent
    let finalTotal = total + tipAmount
    return (tipAmount, finalTotal)
}
let totalWidthTip = calcTipWithPercent(0.20)

//Now formilized into a Class - which is like a blue print ex. Car and CAR Factory//

class TipCalculator
{
    let total: Double
    let taxPct: Double
    let subTotal: Double
    //for every class you need an "init"//
    init(total: Double, taxPct: Double)
    {
    self.total = total
    self.taxPct = taxPct
    self.subTotal = total / (taxPct + 1)
    }
//now add functionality to our class//
    
    func calcTipWithPct(tipPct: Double) ->Double
    // if you don't want the function to return anything leave this "->" off//
    {
        return subTotal * tipPct

    }
    
    func printPossibleTips()
    {
        print("15%: $\(calcTipWithPct(0.15))")
        print("18%: $\(calcTipWithPct(0.18))")
        print("20%: $\(calcTipWithPct(0.20))")
    }
    
    func returnPossibleTips() -> [Int: Double]
    {
        let possibleTips = [0.15, 0.18, 0.20]
        var rValue = [Int: Double] ()
        for possibleTip in possibleTips
        {
            let intPct = Int(possibleTip * 100)
            rValue[intPct] = calcTipWithPct(possibleTip)
        }
        return rValue
    }
   
}

//now that the blue prints made lets do something with it//

//when we are naming classes we use capitop case, anything else we use camel case//

let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)

tipCalc.calcTipWithPct(0.15)
tipCalc.calcTipWithPct(0.20)

tipCalc.printPossibleTips()
let tipDictionary = tipCalc.returnPossibleTips()
tipDictionary[20]




// HomeWork Example //

class BodyPart
{

}

class Leg: BodyPart
{

}









