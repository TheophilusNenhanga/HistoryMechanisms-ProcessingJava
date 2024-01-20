public class Model{

    private ArrayList<Button> buttons = new ArrayList<Button>();


    public Model(){
        Button[] buttonsArray = {new Button("File", 50, 50), new Button("Open", 50, 80), new Button("Favourites", 50, 110), new Button("Sketchbook", 50, 140), new Button("Examples", 50, 170), new Button("Close", 50, 200), new Button("Save", 50, 230), new Button("Save As", 50, 260), new Button("Export", 50, 290), new Button("Page Setup", 50, 320), new Button("Print", 50, 350), new Button("Preferences", 50, 380)};
        for (Button b: buttonsArray){
            buttons.add(b);
        }
    }

    public ArrayList<Button> getButtons(){
        return buttons;
    }
}