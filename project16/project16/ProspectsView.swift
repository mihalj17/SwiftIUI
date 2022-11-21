//
//  ProspectsView.swift
//  project16
//
//  Created by Matko Mihaljl on 03.10.2022..
//

import SwiftUI
import CodeScanner

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uuncontacted
    }
    
    @EnvironmentObject var prospects: Prospects
    @State private var isShowingScanner = false
    
    let filter: FilterType
    
    var body: some View {
        NavigationView{
            List{
                ForEach(filteredProspects) {
                    prospect in
                    VStack(alignment: .leading) {
                        Text(prospect.name)
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundColor(.secondary)
                    }
                    .swipeActions{
                        if prospect.isContacted{
                            Button{
                                prospect.isContacted.toggle()
                            } label:{
                                Label("Mark Uncontacted",systemImage: "person.crop.circle.badge.xmark")
                            }
                            .tint(.blue)
                        } else {
                            Button{
                                prospect.isContacted.toggle()
                            } label:{
                                Label("Mark Uncontacted",systemImage: "person.crop.circle.badge.checkmark")
                            }
                            .tint(.green)
                        }
                    }
                }
            }
                .navigationTitle(title)
                .toolbar{
                    Button{
                        isShowingScanner = true
                    } label: {
                        Label("Scaan", systemImage: "qrcode.viewfinder")
                    }
                }
                .sheet( isPresented: $isShowingScanner){
                    CodeScannerView(codeTypes: [.qr], simulatedData: "PaulHudson\npaul@hackingwithswift.com",completion: handleScan)
                }
        }
    }
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uuncontacted:
            return "Uncontacted people"
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter {$0.isContacted}
        case .uuncontacted:
            return prospects.people.filter { !$0.isContacted}
        }
    }
    func handleScan(result: Result<ScanResult,ScanError>){
        isShowingScanner = false
        
        switch result{
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else {return}
            
            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]
            prospects.people.append(person)
        case .failure(let error):
            print("Scanning faailed: \(error.localizedDescription)")
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
