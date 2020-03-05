package CatalogHomeWork;

public class Main {
    public static void walk(Catalog currentCatalog, int deep, String backscapes) {
        currentCatalog.sortFiles(); // вот тут сортируются файлы. Можете закоментировать жту строку чтобы посмотреть что выведется без сортировки
        if(deep == 0) System.out.println(currentCatalog.getName() + ":");
        else System.out.println(backscapes + currentCatalog.getName() + ":");

        backscapes += "  ";

        for (int i = 0; i < currentCatalog.getFiles().size(); i++) {
            System.out.println(backscapes + currentCatalog.getFiles().get(i));
        }

        for (int i = 0; i < currentCatalog.getCatalogs().size(); i++) {

            walk(currentCatalog.getCatalogs().get(i), ++deep, backscapes);
        }
    }
    public static void main(String[] args) {
        Catalog catalog = new Catalog("Test");
        catalog.addCatalog(new Catalog("2"));
        catalog.addCatalog(new Catalog("videos"));

        catalog.getCatalogs().get(1).addFile(new File("video2.mp4"));
        catalog.getCatalogs().get(1).addFile(new File("video1.mp4"));

        catalog.getCatalogs().get(0).addFile(new File("rok3.tyxt"));
        catalog.getCatalogs().get(0).addFile(new File("rok2.tyxt"));

        catalog.addFile(new File("defg.txt"));
        catalog.addFile(new File("abc.txt"));

        walk(catalog,0, "");
    }
}
