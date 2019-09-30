//
//  ListActorsViewController.swift
//  Sample MVP
//
//  Created by Bassem Abbas on 9/18/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

class ListActorsViewController: BaseViewController< ListActorsPresenter >,ListActorsViewProtocal,UITableViewDataSource ,UITableViewDelegate{
    @IBOutlet weak var actorsTableView: UITableView!
    
    var adapter = ListActorAdapter()
    var listPresenter: ListActorsPresenterProtocal?
    override func viewDidLoad() {
        listPresenter?.loadActors()
        actorsTableView.dataSource = self
        actorsTableView.delegate = self
        
        let actorCellnibName = UINib(nibName: "ActorsTableViewCell", bundle: nil)
        actorsTableView.register(actorCellnibName, forCellReuseIdentifier: "actortableViewCell")
        
         adapter.reloadData = reloadData
        
    }
    
    func getList(array: [Person]){
        adapter.add(items: array)
        print(array)
        
    }
    
    func reloadData(){
        actorsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return adapter.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "actortableViewCell", for: indexPath) as! ActorsTableViewCell
       var personObj = adapter.getPerson(index: indexPath.row)
        cell.configur(person: personObj)
       
            if(indexPath.row == adapter.count()-7){
            listPresenter?.loadMoreActores()
            
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0;//Choose your custom row height
    }
    
    override func setPresenter(presenter: ListActorsPresenter) {
        listPresenter = presenter
    }
}
