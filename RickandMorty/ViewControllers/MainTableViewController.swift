//
//  MainTableViewController.swift
//  RickandMorty
//
//  Created by Anton Akhmedzyanov on 06.05.2023.
//

import UIKit

private let rickAndMortyURL = URL(string:"https://rickandmortyapi.com/api/character/108")!

final class MainTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRickandMorty()
        fetchPlace()
      
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
// MARK: - Networking
    
extension MainTableViewController {
    private func fetchRickandMorty() {
        URLSession.shared.dataTask(with: rickAndMortyURL) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let rickAndMorty = try decoder.decode(RickyandMorty.self, from: data)
                print(rickAndMorty)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    private func fetchPlace() {
        URLSession.shared.dataTask(with: rickAndMortyURL) {data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let place = try decoder.decode(Place.self, from: data)
                print(place)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
