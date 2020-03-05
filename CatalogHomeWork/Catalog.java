package CatalogHomeWork;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class Catalog {
    private List<File> files = new ArrayList<File>();
    private List<Catalog> catalogs = new ArrayList<Catalog>();
    private String name;

    public String getName() {
        return name;
    }

    public String toString(){
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<File>getFiles() {
        return files;
    }

    public List<Catalog> getCatalogs() {
        return catalogs;
    }

    public Catalog(String name){
        this.name = name;
    }

    public Catalog(List<Catalog> catalogs, String name){
        this.catalogs = catalogs;
        this.name = name;
    }
    public Catalog(List<Catalog> catalogs, List<File> files, String name){
        this.catalogs = catalogs;
        this.files = files;
        this.name = name;
    }

    public void addCatalog(Catalog catalog){
        catalogs.add(catalog);
    }

    public void addFile(File file){
        files.add(file);
    }

    public void sortFiles(){
        Collections.sort(files);
    }
}
