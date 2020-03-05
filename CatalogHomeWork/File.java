package CatalogHomeWork;

public class File implements Comparable<File>{
    private String name;

    public File(String name){
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String toString(){
        return name;
    }

    @Override
    public int compareTo(File o) {
        if(name.compareTo(o.name) > 0)return 1;
        if(name.compareTo(o.name) == 0)return 0;
        else return -1;
    }
}
