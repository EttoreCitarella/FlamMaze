//
//  Container.swift
//  FlamMaze
//
//  Created by Ettore Developer on 06/03/23.
//

import SwiftUI
import SpriteKit

enum GameStatus {
    case playing
    case win
    case fail
}

class GameLogic {
    static var shared = GameLogic()
    var status: GameStatus = .playing
}

struct Container: View {
    var scene: GameScene {
        guard let scene = SKScene(fileNamed: "GameScene") as? GameScene else { fatalError("Scene not found")
        }
        scene.scaleMode = .aspectFit
        return scene
        //        let _scene = SKScene(fileNamed: "GameScene") as? GameScene
        //
        //        _scene?.size = CGSize(width: UIScreen.main.bounds.size.width*2, height: UIScreen.main.bounds.size.height*2)
        //        _scene?.scaleMode = .aspectFit
        //        // _scene.size = inserire misure schermo
        //        return _scene!
    }
    
    var sceneWin: GameScene {
        guard let sceneWin = SKScene(fileNamed: "Win") as? GameScene else { fatalError("Scene not found")
        }
        sceneWin.scaleMode = .aspectFit
        return sceneWin
        
        
        //        let _scene = SKScene(fileNamed: "GameScene") as? GameScene
        //
        //        _scene?.size = CGSize(width: UIScreen.main.bounds.size.width*2, height: UIScreen.main.bounds.size.height*2)
        //        _scene?.scaleMode = .aspectFit
        //        // _scene.size = inserire misure schermo
        //        return _scene!
    }
    
    var sceneLose: GameScene {
        guard let sceneLose = SKScene(fileNamed: "lose") as? GameScene else { fatalError("Scene not found")
        }
        sceneLose.scaleMode = .aspectFit
        return sceneLose
        
        
        //        let _scene = SKScene(fileNamed: "GameScene") as? GameScene
        //
        //        _scene?.size = CGSize(width: UIScreen.main.bounds.size.width*2, height: UIScreen.main.bounds.size.height*2)
        //        _scene?.scaleMode = .aspectFit
        //        // _scene.size = inserire misure schermo
        //        return _scene!
    }
    
    
    
    var body: some View {
        if GameLogic.shared.status == .playing {
#if DEBUG
            SpriteView(scene: scene, debugOptions: [.showsPhysics])
                .ignoresSafeArea()
#else
            SpriteView(scene: scene)
                .ignoresSafeArea()
#endif
        } else if GameLogic.shared.status == .win{
            Win()
            //            SpriteView(scene: sceneWin, debugOptions: [.showsPhysics])
                .ignoresSafeArea()
        }else if GameLogic.shared.status == .fail{
#if DEBUG
            SpriteView(scene: sceneLose, debugOptions: [.showsPhysics])
                .ignoresSafeArea()
#else
            SpriteView(scene: sceneLose)
                .ignoresSafeArea()
#endif
        }
    }
}

struct Container_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
}
