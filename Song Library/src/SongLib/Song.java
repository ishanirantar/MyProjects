package SongLib;

// Isha Nirantar and Alaka Rajesh 

import java.util.Comparator;

public class Song implements Comparator<Song> {

	String name;
	String artist;
	String album;
	String year;
	
	Song(String name, String artist, String album, String year){
		
		this.name = name;
		this.artist = artist;
		this.album = album;
		this.year = year;
	}
	
	Song(){}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	@Override
	public int compare(Song s1, Song s2) {
				int songNameComparison = s1.name.compareToIgnoreCase(s2.name);
				if (songNameComparison == 0) {
					int songArtistComparison = s1.artist.compareToIgnoreCase(s2.artist);
					return songArtistComparison;
				}
				return songNameComparison;
				
			}
	}