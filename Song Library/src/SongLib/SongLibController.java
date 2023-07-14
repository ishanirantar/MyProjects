package SongLib;

// Isha Nirantar and Alaka Rajesh 

import java.io.*;
import java.net.URL;
import java.util.Optional;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;

public class SongLibController implements Initializable {


	@FXML
	private Button editButton;

	@FXML
	private Button deleteButton;

	@FXML
	private Button addButton;

	@FXML
	private TextField Title;

	@FXML
	private TextField Year;

	@FXML
	private TextField Album;

	@FXML
	private TextField Artist;

	@FXML
	private Button saveButton;

	@FXML
	private Button cancelButton;

	@FXML
	private AnchorPane Song;

	@FXML
	private Button SaveEditButton;

	@FXML
	private ListView<String> SongList;

	static ObservableList<Song> oL = FXCollections.observableArrayList();

	// @Override
	public void initialize(URL location, ResourceBundle resources) {
		onStart();
	}
	private void backToMain() {
		textDisable();
		deleteButton.setVisible(true);
		editButton.setVisible(true);
		saveButton.setVisible(false);
		cancelButton.setVisible(false);
		addButton.setVisible(true);
		SaveEditButton.setVisible(false);
		SongList.setDisable(false);
	}

	private void textReset() {
		textEnable();
		Title.setText("");
		Artist.setText("");
		Album.setText("");
		Year.setText("");
		textDisable();
	}

	private void textEnable() {
		Title.setDisable(false);
		Year.setDisable(false);
		Album.setDisable(false);
		Artist.setDisable(false);
		Title.setEditable(true);
		Year.setEditable(true);
		Album.setEditable(true);
		Artist.setEditable(true);
	}

	private void textDisable() {
		Title.setEditable(false);
		Year.setEditable(false);
		Album.setEditable(false);
		Artist.setEditable(false);
		
		Title.setDisable(true);
		Year.setDisable(true);
		Album.setDisable(true);
		Artist.setDisable(true);
	}

	// sorts the OL using Comparator and then adds the list to the ListView
	private void makeNewList() {
		oL.sort(new Song());
		SongList.getItems().clear();
		oL.forEach((n) -> SongList.getItems().add(n.name + "\n" + n.artist));

	}

	private void getAlert(char a) {
		if (a == 'a') {
			Alert alert = new Alert(AlertType.WARNING);
			alert.setTitle("This song is already in the library!");
			alert.setHeaderText("Existing Song");
			alert.showAndWait();
		} else if (a == 'b') {
			Alert alert = new Alert(AlertType.WARNING);
			alert.setTitle("Missing Information");
			alert.setHeaderText("Cannot add song!");
			alert.setContentText("Title and Artist are both needed to add song to Song Library");
			alert.showAndWait();
		}
	}

	private boolean check(Song song) {

		for (Song a : oL) {
			if (song.compare(song, a) == 0)
				return false;
		}
		return true;
	}

	// on start, text file has to be converted into the list of Songs (ListView).
	private void onStart() {
		// first check if text file exists
		String filepath = "filepath.txt";
		File f = new File(filepath);

		if (!f.isFile()) {

			// the file does not exists, this is the first time the program has been called.
			// have to create an empty file
			try {
				if (!f.createNewFile()) {
					System.out.println("file or directory created");
				}
				BufferedWriter writer = new BufferedWriter(new FileWriter(filepath));
				writer.write("***"); // this indicates there are no new entries.
				writer.close();

			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// make ObservableArrayList to store songs
		try {
			BufferedReader reader = new BufferedReader(new FileReader(filepath));
			reader.mark(3);
			String s = reader.readLine();
			if (s.equals("***")) {
				System.out.println("There are no songs in the file");
				reader.close();
				return;
			}
			reader.reset();
			String st;
			while ((st = reader.readLine()) != null) {
				String name = st;
				String artist = reader.readLine();
				String album = reader.readLine();
				String year = reader.readLine();
				Song stored = new Song(name, artist, album, year);
				oL.add(stored);
			}
			reader.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

		makeNewList();

		if (!oL.isEmpty()) {
			SongList.getSelectionModel().selectFirst();
		}

		ListViewSelectedNode(null);

	}

	@FXML
	void ListViewSelectedNode(MouseEvent event) {

		if (oL.isEmpty()) {
			textReset();

		} else {

			int index = SongList.getSelectionModel().getSelectedIndex();
			// System.out.print(index);
			textEnable();
			Title.setText(oL.get(index).name);
			Artist.setText(oL.get(index).artist);
			Album.setText(oL.get(index).album);
			Year.setText(oL.get(index).year);
			textDisable();
		}

	}


	@FXML
	void deleteButton(ActionEvent event) {
		if (oL.size() == 0)
			return;
		int index = SongList.getSelectionModel().getSelectedIndex();
		Alert alert = new Alert(AlertType.CONFIRMATION);
		alert.setTitle("Do you want to delete this song?");
		alert.setHeaderText("Are you sure you want to delete this song?");

		Optional<ButtonType> result = alert.showAndWait();
		if (result.get() == ButtonType.OK) {
			oL.remove(index);
			makeNewList();
			// System.out.println(index + " " + oL.size());
			if (oL.size() == 0) {
				// do nothing
			} else if (index == oL.size()) {
				SongList.getSelectionModel().select(index - 1);
			} else {
				SongList.getSelectionModel().select(index);
			}
			ListViewSelectedNode(null);
		}

	}

	@FXML
	void addButton(ActionEvent event) {
		deleteButton.setVisible(false);
		editButton.setVisible(false);
		addButton.setVisible(false);

		saveButton.setVisible(true);
		cancelButton.setVisible(true);

		textReset();
		textEnable();
		SongList.setDisable(true);

	}

	@FXML
	void saveButton(ActionEvent event) {
		String name = Title.getText();
		String artist = Artist.getText();
		String album = Album.getText();
		String year = Year.getText();

		if (name.equals("") || artist.equals("")) {
			getAlert('b');
			return;
		}

		Song add = new Song(name, artist, album, year);

		if (!oL.isEmpty()) {
			if (!check(add)) {
				getAlert('a');
				return;
			}
		}
		oL.add(add);
		makeNewList();
		SongList.getSelectionModel().select(oL.indexOf(add));
		backToMain();
		ListViewSelectedNode(null);

	}

	@FXML
	void editButton(ActionEvent event) {
		if (oL.size() == 0)
			return;
		deleteButton.setVisible(false);
		editButton.setVisible(false);
		SaveEditButton.setVisible(true);
		cancelButton.setVisible(true);
		addButton.setVisible(false);
		SongList.setDisable(true);
		textEnable();
	}

	@FXML
	void SaveEdit(ActionEvent event) {
		int index = SongList.getSelectionModel().getSelectedIndex();
		String alb = Album.getText();
		String art = Artist.getText();
		String nme = Title.getText();
		String yr = Year.getText();

		if (nme.equals("") || art.equals("")) {
			getAlert('b');
			return;
		}

		Song edited = new Song(nme, art, alb, yr);
		Song old = oL.get(index);
		oL.remove(index);

		if (!check(edited)) {
			getAlert('a');
			oL.add(index, old);
			return;
		}

		oL.add(edited);
		makeNewList();
		SongList.getSelectionModel().select(oL.indexOf(edited));
		backToMain();
		ListViewSelectedNode(null);

	}

	@FXML
	void cancelButton(ActionEvent event) {

		backToMain();

		if (!oL.isEmpty()) {
			SongList.getSelectionModel().selectFirst();
		}
		ListViewSelectedNode(null);

	}

	

	
}
