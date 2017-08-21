import UIKit
import Mobicast

class ListViewController: UIViewControllerExtension, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var discoveryPlaylist: DiscoveryPlaylist?
    
    var channelsList: ChannelsList?

    internal var tableViewData = [[String: String]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        UIApplication.shared.setStatusBarHidden(false, with: UIStatusBarAnimation.fade)

        setupTableViewData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    internal func setupTableViewData() {

        tableViewData.append(["type": "widget",
                              "title": "Discovery Widget",
                              "description": ""])

        tableViewData.append(["type": "vertical_playlist",
                              "title": "Discovery Vertical Playlist",
                              "description": ""])
        
        tableViewData.append(["type": "channels",
                              "title": "Channels",
                              "description": ""])

        tableView.reloadData()
    }

// MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")

        let cellData = tableViewData[indexPath.row]

        cell?.textLabel?.text = cellData["title"]
        cell?.detailTextLabel?.text = cellData["description"]

        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView .deselectRow(at: indexPath, animated: true)

        let cellData = tableViewData[indexPath.row]

        if cellData["type"] == "widget" {

            performSegue(withIdentifier: "widgetSegue", sender: self)
        } else if cellData["type"] == "vertical_playlist" {

            openDiscoveryPlayList()
            
        } else if cellData["type"] == "channels" {
            
            openChannelsList()
        }
    }

// MARK: - 

    func openDiscoveryPlayList() {

        discoveryPlaylist = DiscoveryPlaylist.init(showInNavigationController: self.navigationController!, playerToken: "102")

        discoveryPlaylist?.isDeveloperMode = true
    }
    
    func openChannelsList() {
        
        channelsList = ChannelsList.init(showInNavigationController: self.navigationController!)
        
    }
}
