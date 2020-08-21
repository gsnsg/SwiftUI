//
//  AstronautView.swift
//  MoonShot
//
//  Created by Nikhi on 11/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var missions: [Mission] {
        print("here")
        let missions: [Mission] = Bundle.main.decode("missions.json")
        var filteredMissions = [Mission]()
        
        for mission in missions {
            for crewMember in mission.crew {
                if crewMember.name.lowercased() == astronaut.id {
                    print("Here!")
                    filteredMissions.append(mission)
                    break
                }
            }
        }
        return filteredMissions
        
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    
                    Group {
                        Text("Missions")
                            .fontWeight(.bold)
                            .font(.system(size: 30))
                        
                        
                        ForEach(self.missions) { mission in
                            HStack {
                                Image(mission.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 44, height: 44)
                                
                                
                                VStack(alignment: .leading) {
                                    Text(mission.displayName)
                                        .font(.headline)
                                    Text(mission.formattedLaunchDate)
                                }
                            }
                            
                            
                            
                        }
                        
                    }.padding()
                    
                    
                    
                    
                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}
struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
