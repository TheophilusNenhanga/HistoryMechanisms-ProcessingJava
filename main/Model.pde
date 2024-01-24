public class Model{

    private ArrayList<Button> buttons = new ArrayList<Button>();
    private ArrayList<Button> recents;
    private ArrayList<Button> frequents = new ArrayList<Button>();
    private ArrayList<ProxyButton> proxies = new ArrayList<ProxyButton>();
    Button fileButton;

    public Model(){
      this.recents = new ArrayList();
      fileButton = new Button("File", 50, 50);
      Button[] buttonsArray = {new Button("Open", 50, 80), new Button("Favourites", 50, 110), new Button("Sketchbook", 50, 140), new Button("Examples", 50, 170), new Button("Close", 50, 200), new Button("Save", 50, 230), new Button("Save As", 50, 260), new Button("Export", 50, 290), new Button("Page Setup", 50, 320), new Button("Print", 50, 350), new Button("Preferences", 50, 380)};
      buttons.add(fileButton);
      // frequents.add(fileButton);
      // The file button will not be added to the frequency list because it is aclaicked all the time.
      for (Button b: buttonsArray){
        buttons.add(b);
        frequents.add(b);
        fileButton.addChild(b);
        }
      }

    public ArrayList<Button> getButtons(){
        return buttons;
    }
    
    public Button getFileButton(){
      return this.fileButton;
    }
    
    public ArrayList<Button> getRecentButtons(){
      return this.recents;
    }
    
    public void addRecentButton(Button button){
      // add the most recent to the front. delete the least recent. 
      // This implementation assumes that we will only store the 3 most recent items.
      if (button != fileButton){
        this.recents.add(0, button);
      }
      if (this.recents.size() > 3){
        this.recents.remove(3);
      }
     
    }
    
    public void addProxy(ProxyButton proxy){
      for (ProxyButton prox: this.proxies){
        if (proxy.getButton().getAction().equals(prox.getButton().getAction())) return;
      }
      this.proxies.add(proxy);
    }
    
    public void clearProxies(){
      this.proxies.clear();
    }
    
    public ArrayList<ProxyButton> getProxies(){return this.proxies;}
    
    public ArrayList<Button> getFrequentButtons(){
      this.frequents.sort((o1, o2) -> ((Integer) o2.getClickCount()).compareTo((Integer) o1.getClickCount()));
      return this.frequents;
    }
}
