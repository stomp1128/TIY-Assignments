class BodyPart
{
    let containsMuscle: String
    let containsBone: String
    let providesSenses: String
    
    init(containsMuscle: String, containsBone: String, providesSenses: String)
    {
        self.containsMuscle = containsMuscle
        self.containsBone = containsBone
        self.providesSenses = providesSenses
    }
    
    func partOfAHuman()
    {
        
    }
    
    func providesFunctionality()
    {
        
    }
    
    func idealToHave()
    {
        
    }
    
}
class Leg: BodyPart
{
    let supportsTorso: String
    let connectedToFeet: String
    let ableToBend: String
    
    init(supportsTorso: String, connectedToFeet: String, ableToBend: String)
    {
        self.supportsTorso = supportsTorso
        self.connectedToFeet = connectedToFeet
        self.ableToBend = ableToBend
}
    
    func usedForStanding()
    {
        
    }

    func usedForRunning()
    {
        
    }
    
    func usedForWalkin()
    {
        
    }
    
class Toe: BodyPart
{
    let partOfTheFoot: String
    let hasToenail: String
    let fivePerFoot: String
    
    init(partOfTheFoot: String, hasToenail: String, fivePerFoot: String)
    {
        self.partOfTheFoot = partOfTheFoot
        self.hasToenail = hasToenail
        self.fivePerFoot = fivePerFoot
    }
    func helpsWithBalance()
    {
        
    }
    
    func makesYourFootLookNormal()
    {
        
    }
    
    func getsStubbed()
    {
        
    }
    
}

class Foot: BodyPart
{
    let hasToes: String
    let connectedToAnkle: String
    let hasHair: String
    
    init(hasToes: String, connectedToAnkle: String, hasHair: String)
    {
        self.hasToes
        self.connectedToAnkle
        self.hasHair
    }
    
    func smells()
    {
      
        
    }
    
    func usedForStanding()
    {
        
    }
    
    func fitsInShoe()
    {
        
    }
    
    
}

class Ankle: BodyPart
{
    let connectsToFoot: String
    let connectsToCalf: String
    let coveredBySocks: String
    
    init(connectsToFoot: String, connectsToCalf: String, coveredbySocks: String)
    {
        self.connectsToFoot
        self.connectsToCalf
        self.coveredBySocks
    }
    
    func helpsMoveFoot ()
    {
        
    }
    
    func getsHurtPlayingBasketball()
    {
        
    }
    
    func keepsBalance()
    {
        
    }
}

class Knee: BodyPart
{
    let connectsUpperAndLowerLeg: String
    let bends: String
    let hasLigaments: String
    
    init(connectsUpperAndLowerLeg: String, bends: String, hasLigaments: String)
    {
        self.connectsUpperAndLowerLeg
        self.bends
        self.hasLigaments
    }
    
    func allowsLegToBend()
    {
        
    }
    
    func helpsWithJumping()
    {
        
    }
    
    func getsHurtPlayingSoccer()
    {
        
    }
}

class Hip: BodyPart
{
    let connectsLegToTorso: String
    let humansHaveTwo: String
    let areBony: String
    
    init(connectsLegsToTorso: String, humansHaveTwo: String, areBony: String)
    {
        self.connectsLegToTorso
        self.humansHaveTwo
        self.areBony
    }
    
    func allowsBodyToSwivel()
    {
        
    }
    
    func usedForDancing()
    {
        
    }
    
    func oldPeopleBreakThem()
    {
        
    }
}

class Arm: BodyPart
{
    let connectsToHand: String
    let ableToBend: String
    let connectedAtShoulder: String
    
    init(connectsToHand: String, ableToBend: String, connectedAtShoulder: String)
    {
        self.connectsToHand
        self.ableToBend
        self.connectedAtShoulder
    }
    
    func carryItems()
    {
        
    }
    
    func pickUpItems()
    {
        
    }
    
    func throwItems()
    {
        
    }

}

class Finger: BodyPart
{
    let partOfHand: String
    let fivePerHand: String
    let hasFingernails: String
    
    init(partOfHand: String, fivePerHand: String, hasFingernails: String)
    {
        self.partOfHand
        self.fivePerHand
        self.hasFingernails
    }
    
    func grabItems()
    {
        
    }
    
    func usePencil()
    {
        
    }
    
    func useTools()
    {
        
    }
 
}

class Hand: BodyPart
{
    let hasFiveFingers: String
    let connectedToArm: String
    let hasPalm: String
    
    init(partOfHand: String, fivePerHand: String, hasFingernails: String)
    {
        self.hasFiveFingers
        self.connectedToArm
        self.hasPalm
    }
    
    func holdItem()
    {
        
    }
    
    func holdAnotherHand()
    {
        
    }
    
    func highFive()
    {
        
    }

}

class Wrist: BodyPart
{
    let connectsToArm: String
    let connectsToHand: String
    let allowsHandMovement: String
    
    init(connectsToArm: String, connectsToHand: String, allowsHandMovement: String)
    {
        self.connectsToArm
        self.connectsToHand
        self.allowsHandMovement
    }
    
    func wearsWatch()
    {
        
    }
    
    func wearsBracelet()
    {
        
    }
    
    func usedForWaving()
    {
        
    }
}

class Elbow: BodyPart
{
    let connectsForearmToUpperArm: String
    let bends: String
    let isBony: String
    
    init(connectsForearmToUpperArm: String, bends: String, isBony: String)
    {
        self.connectsForearmToUpperArm
        self.bends
        self.isBony
    }
    
    func allowsArmToFlex()
    {
        
    }
    
    func bendingTheArm()
    {
        
    }
    
    func elbowDropsFromTheTopRope()
    {
        
    }

}

class Shoulder: BodyPart
{
    let connectsArmToBody: String
    let rotatesArm: String
    let isMuscular: String
    
    init(connectsArmToBody: String, rotatesArm: String, isMuscular: String)
    {
        self.connectsArmToBody
        self.rotatesArm
        self.isMuscular
    }
    
    func usedToThrowFootball()
    {
        
    }
    
    func usedForPulling()
    {
        
    }
    
    func usedToOpenStuckDoor()
    {
        
    }
}

class Chest: BodyPart
{
    let hairy: String
    let hasNipples: String
    let coveredByShirt: String
    
    init(hairy: String, hasNipples: String, coveredByShirt: String)
    {
        self.hairy
        self.hasNipples
        self.coveredByShirt
    }
    
    func pushups()
    {
        
    }
    
    func gymExercises()
    {
        
    }
    
    func protectOrgans()
    {
        
    }
}

class Neck: BodyPart
{
    let connectsToHead: String
    let containsEsophagus: String
    let connectsToChestArea: String
    
    init(connectsToHead: String, containsEsophagus: String, connectsToChestArea: String)
    {
        self.connectsToHead
        self.containsEsophagus
        self.connectsToChestArea
    }
    
    func nodsHead()
    {
        
    }
    
    func rotatesHead()
    {
        
    }
    
    func wearsNecktie()
    {
        
    }
}

class Mouth: BodyPart
{
    let containsTeeth: String
    let containsTongue: String
    let hasLips: String
    
    init(containsTeeth: String, containsTongue: String, hasLips: String)
    {
        self.containsTeeth
        self.containsTongue
        self.hasLips
    }
    
    func usedForEating()
    {
        
    }
    
    func kissing()
    {
        
    }
    
    func speaking()
    {
        
    }
}

class Nose: BodyPart
{
    let twoNostrils: String
    let cartiliage: String
    let connectedToFace: String
    
    init(twoNostrils: String, cartiliage: String, connectedToFace: String)
    {
        self.twoNostrils
        self.cartiliage
        self.connectedToFace
    }
    
    func usedForBreathing()
    {
        
    }
    
    func usedForSmelling()
    {
        
    }
    
    func allergies()
    {
        
    }

}

class Ears: BodyPart
{
    let attachedToHead: String
    let twoPerPerson: String
    let haveEardrums: String
    
    init(attachedToHead: String, twoPerPerson: String, haveEardrums: String)
    {
        self.attachedToHead
        self.twoPerPerson
        self.haveEardrums
    }
    
    func usedForHearing()
    {
        
    }
    
    func balance()
    {
        
    }
    
    func holdPiercings()
    {
        
    }
}

class Eyes: BodyPart
{
    let onFace: String
    let differentColors: String
    let haveEyelids: String
    
    init(onFace: String, differentColors: String, haveEyelids: String)
    {
        self.onFace
        self.differentColors
        self.haveEyelids
    }
    
    func sight()
    {
        
    }
    
    func crying()
    {
        
    }
    
    func blinking()
    {
        
    }
}

class Teeth: BodyPart
{
    let inMouth: String
    let whiteInColor: String
    let needBrushing: String
    
    init(inMouth: String, whiteInColor: String, needBrushing: String)
    {
        self.inMouth
        self.whiteInColor
        self.needBrushing
    }
    
    func chewingFood()
    {
        
    }
    
    func smiling()
    {
        
    }
    
    func grindingWhenStressed()
    {
        
    }
}

class Tongue: BodyPart
{
    let insideMouth: String
    let pinkInColor: String
    let hasSaliva: String
    
    init(insideMouth: String, pinkInColor: String, hasSaliva: String)
    {
        self.insideMouth
        self.pinkInColor
        self.hasSaliva
    }
    
    func swallowingFood()
    {
        
    }
    
    func stickingOutAtSomeone()
    {
        
    }
    
    func talking()
    {
        
    }
}
















