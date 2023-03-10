//
//  GameScene.swift
//  FlamMaze
//
//  Created by Ettore Developer on 06/03/23.
//

import SpriteKit
import GameplayKit
import CoreMotion
import AVFoundation

class GameScene: SKScene , SKPhysicsContactDelegate{
    
    enum PhysicsCategories: UInt32 {
        case palla = 0b1
        case cuore = 0b10
        case muro = 0b100
        case bomb = 0b110
        case powerUp = 0b111
        case superFlammy = 0b011
    }
    
    private let motionManager = CMMotionManager()
    
    let repetitionFactor: Double = 2.0
    
    var isFingerOnPlayer1 = false
    var isFingerOnPlayer2 = false
    
  //  var palla = SKSpriteNode()
// var heart = SKSpriteNode()
    var punteggio : Int = 0
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        motionManager.startAccelerometerUpdates()
        
        physicsWorld.contactDelegate = self
        
        //self.physicsWorld.contactDelegate = self

        
        // crei un corpo fisico con skphisicbody solo col perimetro della view
        //        let corpoFisicoConfine = SKPhysicsBody(edgeLoopFrom: self.frame)
        //        // attrito 0 non rallenta la palla
        //        corpoFisicoConfine.friction = 0
        //        // restituttion non fa perdere forza alla palla quando urta gli angoli
        //        corpoFisicoConfine.restitution = 1
        //        self.physicsBody = corpoFisicoConfine
        //
        //        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        // crei un riferimento col nome "palla" alla sprite
        /*
         if let children = scene?.children {
         for child in children {
         if child.name == "palla" {
         child.physicsBody?.applyImpulse(CGVector(dx: 100, dy: -100))
         }
         
         }
         }*/
        //print(scene?.children)
        
        //let palla = scene?.childNode(withName: "palla") as! SKSpriteNode
        guard let palla = childNode(withName: "palla") else { return }
        palla.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        palla.physicsBody?.categoryBitMask = PhysicsCategories.palla.rawValue
        palla.physicsBody?.contactTestBitMask = PhysicsCategories.cuore.rawValue
        palla.physicsBody?.friction = 0.6
        palla.physicsBody?.restitution = 0.3
        
        // applica un impulso con forza costante intensita 100 e -100
        //palla.physicsBody?.applyImpulse(CGVector(dx: -350, dy: 200))
        
        // palla.physicsBody = SKPhysicsBody(circleOfRadius: 90)
        
        guard let heart0 = childNode(withName: "heart0") else { return }
        heart0.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        heart0.physicsBody?.isDynamic = false
        heart0.physicsBody?.categoryBitMask = PhysicsCategories.cuore.rawValue
        heart0.physicsBody?.contactTestBitMask = PhysicsCategories.palla.rawValue
        
        guard let heart1 = childNode(withName: "heart1") else { return }
        heart1.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        heart1.physicsBody?.isDynamic = false
        heart1.physicsBody?.categoryBitMask = PhysicsCategories.cuore.rawValue
        heart1.physicsBody?.contactTestBitMask = PhysicsCategories.palla.rawValue
        
        
        
        guard let bomb = childNode(withName: "bomb") else { return }
        bomb.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        bomb.physicsBody?.isDynamic = false
        bomb.physicsBody?.categoryBitMask = PhysicsCategories.bomb.rawValue
        bomb.physicsBody?.contactTestBitMask = PhysicsCategories.palla.rawValue
        
        
        
        guard let powerUp = childNode(withName: "PowerUp") else { return }
        powerUp.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        powerUp.physicsBody?.isDynamic = false
        powerUp.physicsBody?.categoryBitMask = PhysicsCategories.powerUp.rawValue
        powerUp.physicsBody?.contactTestBitMask = PhysicsCategories.palla.rawValue
        
        

        
        
//        guard let superFlammy = childNode(withName: "superFlammy") else { return }
//        superFlammy.physicsBody = SKPhysicsBody(circleOfRadius: 30)
//        superFlammy.physicsBody?.isDynamic = false
//        superFlammy.physicsBody?.categoryBitMask = PhysicsCategories.powerUp.rawValue
//        superFlammy.physicsBody?.contactTestBitMask = PhysicsCategories.palla.rawValue
        //        for nameIndex in 0... {
        //            if let heart = childNode(withName: "heart\(nameIndex)") {
        //                heart.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        //                heart.physicsBody?.isDynamic = false
        //                heart.physicsBody?.categoryBitMask = PhysicsCategories.cuore.rawValue
        //                heart.physicsBody?.contactTestBitMask = PhysicsCategories.palla.rawValue
        //            } else {
        //                break
        //            }
        //        }
        
        //        heart = SKSpriteNode(imageNamed:"heart")
        //        heart.name = "heart"
        //let heart = childNode(withName: "Heart") as! SKSpriteNode
        
        // heart.physicsBody = SKPhysicsBody(rectangleOf: heart.size)
        //        heart.physicsBody?.isDynamic = false
        //        heart.physicsBody?.categoryBitMask = 2
        //        heart.physicsBody?.collisionBitMask = 1
        //        let heartBox = SKPhysicsBody(circleOfRadius: 30)
        //        heart.physicsBody = heartBox
        
        
        
        
        
        
        
        //        let player1 = childNode(withName: "player1") as! SKSpriteNode
        //        let hitboxPlayer = SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 40))
        //        player1.physicsBody = hitboxPlayer
        //        player1.physicsBody!.allowsRotation = false
        //        player1.physicsBody!.isDynamic = false
        //        player1.name = "player1"
        
        
        //        let player2 = childNode(withName: "player2") as! SKSpriteNode
        //        player2.physicsBody!.isDynamic = false
        //                player2.physicsBody!.allowsRotation = false
        
//        let wall = childNode(withName: "wall") as! SKSpriteNode
//        let hitboxWall = SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 40))
//
//        //        let hitboxWall = SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 40))
//        wall.physicsBody = hitboxWall
//        wall.physicsBody!.allowsRotation = false
//        wall.physicsBody!.isDynamic = false
//        wall.name = "wall"
        
        //         func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //                // recupero la posizione del tocco sullo schermo
        //                let tocco = touches.first
        //             let posizioneTocco = tocco!.location(in: self)
        ////
        ////             let pos = "\(posizioneTocco.x) \(posizioneTocco.y)"
        ////                print(pos)
        //
        //                /*
        //                creo una sorta di area di gioco.
        //                - sotto la coordinata Y (verticale) 270 è area del giocatore 1
        //                - tra la coordinata 1000<Y<1330 l'area di gioco è del giocatore 2
        //                questa impostazione è utile quando vuoi gestire degli oggetti e creare eventi solo per un giocatore
        //                */
        //                if (posizioneTocco.y <= 270) {
        //                    print("Generato un tocco nell'area del player1")
        //                } else if (posizioneTocco.y <= 1330 && posizioneTocco.y >= 1000) {
        //                    print("Generato un tocco nell'area del player2")
        //                }
        //
        //                // controlla che il corpo fisico selezionato alla posizioneTocco sia esistente
        //                // se esiste ne preleva il nome e attiva uno dei due if
        //             if let corpoFisico = physicsWorld.body(at: posizioneTocco) {
        //                    if corpoFisico.node!.name == "player1" {
        //                        print("Player1: Selezionato")
        //                        isFingerOnPlayer1 = true
        //                        isFingerOnPlayer2 = false
        //                    }
        //                    else if(corpoFisico.node!.name == "player2") {
        //                        print("Player2: Selezionato")
        //                        isFingerOnPlayer2 = true
        //                        isFingerOnPlayer1 = false
        //                    }
        //                }
        //            }
        
        //        func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        //
        //            let tocco = touches.first
        //            let posizioneTocco = tocco!.location(in: self)
        //
        //
        //            if (posizioneTocco.y <= 270) {
        //                print("Generato un tocco nell'area del player1")
        //            } else if (posizioneTocco.y <= 1330 && posizioneTocco.y >= 1000) {
        //                print("Generato un tocco nell'area del player2")
        //            }
        //
        //            if let corpoFisico = physicsWorld.body(at: posizioneTocco) {
        //                if corpoFisico.node!.name == "player1" {
        //                    print("Player1: Selezionato")
        //                    isFingerOnPlayer1 = true
        //                    isFingerOnPlayer2 = false
        //                }
        //                else if(corpoFisico.node!.name == "player2") {
        //                    print("Player2: Selezionato")
        //                    isFingerOnPlayer2 = true
        //                    isFingerOnPlayer1 = false
        //                }
        //            }
        //
        //            self.run(SKAction.sequence([SKAction.wait(forDuration: 0.4*repetitionFactor), SKAction.run({
        //                 self.addChild(palla)
        //            })]))
        //
        //        }
        
    }
    func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        //             func muoviGiocatore(node: String) {
        //                         // salva la posizione del tocco
        //                         let tocco = touches.first
        //                 let posizioneTocco = tocco!.location(in: self)
        //                         // recupero la posizione del tocco precedente a quello appena effettuato
        //                 let posizioneToccoPrecedente = tocco!.previousLocation(in: self)
        //
        //                         // recupero il node del giocatore
        //                 let giocatore = childNode(withName: node) as! SKSpriteNode
        //
        //                         // calcola la nuova posizione per il giocatore
        //                         var giocatoreX = giocatore.position.x + (posizioneTocco.x - posizioneToccoPrecedente.x)
        //
        //                         // limita la coordinata X in modo da non far uscire fuori dallo schermo il giocatore mentre si muove
        //                         giocatoreX = max(giocatoreX, giocatore.size.width/2)
        //                         giocatoreX = min(giocatoreX, self.size.width - giocatore.size.width/2)
        //
        //                         // aggiorna le coordinate e quindi muove il giocatore
        //                         giocatore.position = CGPointMake(giocatoreX, giocatore.position.y)
        //                     }
        //
        //             if isFingerOnPlayer1 {
        //                 muoviGiocatore(node: "player1")
        //             } else if isFingerOnPlayer2 {
        //                 muoviGiocatore(node: "player2")
        //             }
        
        // controlla se si sta toccando il giocatore 1 o 2 e attiva la rispettiva funzione
        //                if isFingerOnPlayer1 {
        ////                    muoviGiocatore(node: "player1")
        //
        //                } else if isFingerOnPlayer2 {
        //                    muoviGiocatore(node: "player2")
        //                }
    }
    
    //        func muoviGiocatore(node: String) {
    //            // salva la posizione del tocco
    //            let tocco = touches.first
    //            let posizioneTocco = tocco!.location(in: self)
    ////            // recupero la posizione del tocco precedente a quello appena effettuato
    ////            let posizioneToccoPrecedente = tocco!.previousLocation(in: self)
    ////
    ////            // recupero il node del giocatore
    //            let giocatore = childNode(withName: node) as! SKSpriteNode
    //
    //            // calcola la nuova posizione per il giocatore
    //            var giocatoreX = giocatore.position.x + (posizioneTocco.x - posizioneToccoPrecedente.x)
    //
    //            // limita la coordinata X in modo da non far uscire fuori dallo schermo il giocatore mentre si muove
    //            giocatoreX = max(giocatoreX, giocatore.size.width/2)
    //            giocatoreX = min(giocatoreX, self.size.width - giocatore.size.width/2)
    //
    //            // aggiorna le coordinate e quindi muove il giocatore
    //            giocatore.position = CGPointMake(giocatoreX, giocatore.position.y)
    //
    //          //  let move = SKAction.move(to: posizioneTocco, duration: 0.1)
    //
    //        }
    //
//
//    func playHeart() {  let playSound = SKAction.playSoundFileNamed("mixkit-melodic-bonus-collect-1938", waitForCompletion: false)}
    
    var buttonAudio: AVAudioPlayer = {
        let path = Bundle.main.path(forResource: "button", ofType: "mp3")
        let url = URL(filePath: path!)
        let buttonAudio = try! AVAudioPlayer(contentsOf: url)
//        backgroundMusic.numberOfLoops = -1
        return buttonAudio
    }()
    
    var bombAudio: AVAudioPlayer = {
        let path = Bundle.main.path(forResource: "Esplosione-bomba", ofType: "mp3")
        let url = URL(filePath: path!)
        let buttonAudio = try! AVAudioPlayer(contentsOf: url)
//        backgroundMusic.numberOfLoops = -1
        return buttonAudio
    }()
    
    var winAudio: AVAudioPlayer = {
        let path = Bundle.main.path(forResource: "Win2", ofType: "m4a")
        let url = URL(filePath: path!)
        let buttonAudio = try! AVAudioPlayer(contentsOf: url)
//        backgroundMusic.numberOfLoops = -1
        return buttonAudio
    }()
    
    var powerUpAudio: AVAudioPlayer = {
        let path = Bundle.main.path(forResource: "Power", ofType: "mp3")
        let url = URL(filePath: path!)
        let buttonAudio = try! AVAudioPlayer(contentsOf: url)
//        backgroundMusic.numberOfLoops = -1
        return buttonAudio
    }()
    
    
    func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //               self.isFingerOnPlayer1 = false
        //               self.isFingerOnPlayer2 = false
    }
    
    
    
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        
       
        
        
        print("contact happened \(String(describing: contact.bodyA.node?.name)) & \(String(describing: contact.bodyB.node?.name))")
        //            let nodeA = contact.bodyA.node
        //            let nodeB = contact.bodyB.node
        //            if nodeA?.name == "palla" && nodeB?.name == "heart" {
        //                // La palla ha colpito il muro
        //                // Implementare la logica di gioco qui
        //                heart.removeFromParent()
        //            }
        
        print("contact happened")
        guard let nodeA = contact.bodyA.node else {
            print("nodeA not found")
            punteggio += 1
            return
        }
        guard let nodeB = contact.bodyB.node else {
            print("nodeB not found")
            punteggio += 1
            print(punteggio)
            return
        }
        
        
        if nodeA.name == "heart0" {
            nodeA.removeFromParent()
            
            buttonAudio.play()
        }
        
        if nodeB.name == "heart0" {
            nodeB.removeFromParent()
        
            buttonAudio.play()
            
        }
        if nodeA.name == "heart1" {
            nodeA.removeFromParent()
            buttonAudio.play()
        }
        
        if nodeB.name == "heart1" {
            nodeB.removeFromParent()
            buttonAudio.play()
        }
        
        if nodeA.name == "porta" {
           print("Win")
            winAudio.play()
            GameLogic.shared.status = .win
            if let view = view {
                        let gameScene = GameScene(fileNamed: "Win")
                        
                        let skView = view
                        skView.showsFPS = true
                        skView.showsNodeCount = true
                        skView.ignoresSiblingOrder = true
                        gameScene!.scaleMode = .aspectFit
                        
                        view.presentScene(gameScene)
                    }
            
        }
        
        if nodeB.name == "porta" {
            print("Win")
            winAudio.play()
            GameLogic.shared.status = .win
            //ViewHandler.currentView.viewState.gameOverwin
            if let view = view {
                        let gameScene = GameScene(fileNamed: "Win")
                        
                        let skView = view
                        skView.showsFPS = true
                        skView.showsNodeCount = true
                        skView.ignoresSiblingOrder = true
                        gameScene!.scaleMode = .aspectFit
                        
                        view.presentScene(gameScene)
                    }
        }
        
        if nodeA.name == "bomb" {
            nodeA.removeFromParent()
            bombAudio.play()

            print("lose")
            GameLogic.shared.status = .fail
            if let view = view {
                        let gameScene = GameScene(fileNamed: "lose")
                        
                        let skView = view
                        skView.showsFPS = true
                        skView.showsNodeCount = true
                        skView.ignoresSiblingOrder = true
                        gameScene!.scaleMode = .aspectFit
                        
                        view.presentScene(gameScene)
                    }
        }
        
        if nodeB.name == "bomb" {
            nodeB.removeFromParent()
            bombAudio.play()

            print("lose")
            GameLogic.shared.status = .fail
            if let view = view {
                        let gameScene = GameScene(fileNamed: "lose")
                        
                        let skView = view
                        skView.showsFPS = true
                        skView.showsNodeCount = true
                        skView.ignoresSiblingOrder = true
                        gameScene!.scaleMode = .aspectFit
                        
                        view.presentScene(gameScene)
                    }
            
        }
        
        if nodeA.name == "PowerUp" {
            let Sflammy = SKTexture(imageNamed: "SuperFlammy")
            guard let palla = childNode(withName: "palla") else { return }
        //    nodeA.removeFromParent()
//           // guard let palla = childNode(withName: "palla") else { return }
//            //guard let superFlammy = childNode(withName: "superFlammy") else { return }
//            superFlammy.position  = palla.position
       //     palla.removeFromParent()
            (palla as! SKSpriteNode).texture = Sflammy
            nodeA.removeFromParent()
            
           // addChild(superFlammy)
            
            
            
            
            powerUpAudio.play()
        }
        
        if nodeB.name == "PowerUp" {
           let Sflammy = SKTexture(imageNamed: "SuperFlammy")
           guard let palla = childNode(withName: "palla") else { return }
//            guard let superFlammy = childNode(withName: "superFlammy") else { return }
//            guard let powerUp = childNode(withName: "PowerUp") else { return }
//            superFlammy.position  = palla.position
            
        //    nodeB.removeFromParent()
          //  palla.removeFromParent()
            (palla as! SKSpriteNode).texture = Sflammy
            nodeB.removeFromParent()
            
          //  addChild(superFlammy)
            
            
    
            powerUpAudio.play()
            
        }
        view?.showsPhysics = (false)
        
    }
    
    /*
    func didBegin(_ contact: SKPhysicsContact) {
        print("contact happened")
        punteggio += 1
        if contact.bodyA.node?.physicsBody?.categoryBitMask == PhysicsCategories.palla.rawValue {
            contact.bodyB.node?.removeFromParent()
        } else {
            contact.bodyA.node?.removeFromParent()
        }
    }
     */
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        if let accelerometerData = motionManager.accelerometerData {
            physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.x * 5.8*2, dy: accelerometerData.acceleration.y * 5.8*2)
        }
    }
    
}

