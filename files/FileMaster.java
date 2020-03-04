package files;

import java.io.*;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FileMaster {
    private File file;

    public FileMaster(File file){
        this.file = file;
    }

    public File getFile() {
        return file;
    }

    public void write(String str){
        try{
            FileWriter fileWriter = new FileWriter(file,true);
            fileWriter.write("\n"+str);
            fileWriter.close();
        } catch (IOException e){
            System.out.println(e.getMessage());
        }

    }

    public String readAllFile(){
        String content = "";
        try(FileReader fileReader = new FileReader(file)){
            int temp = 0;
            while((temp = fileReader.read()) != -1){
                content += (char)temp;
            }
        } catch (FileNotFoundException e){
            System.out.println("Файл не найден("+file.getPath()+")");
        } catch (IOException e){
            System.out.println("Ошибка: " + e.getMessage());
        }
        return content;
    }

    public void deleteSubString(String subString){
        String content = readAllFile();
        String[] rows = content.split("\n");
        try{
            FileOutputStream fooStream = new FileOutputStream(file, false);
            content = "";
            for (int i = 0; i < rows.length; i++) {
                content += rows[i].replaceAll(subString,"");
            }
            fooStream.write(content.getBytes());
        } catch (FileNotFoundException e){
            System.out.println("Файл не найден("+file.getPath()+")");
        } catch (IOException e){
            System.out.println(e.getMessage());
        }
    }
    public void replaceSubString(String subString, String newSubString){
        String content = readAllFile();
        String[] rows = content.split("\n");
        try{
            FileOutputStream fooStream = new FileOutputStream(file, false);
            content = "";
            for (int i = 0; i < rows.length; i++) {
                content += rows[i].replaceAll(subString,newSubString);
            }
            fooStream.write(content.getBytes());
        } catch (FileNotFoundException e){
            System.out.println("Файл не найден("+file.getPath()+")");
        } catch (IOException e){
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<String> findWordsStartsWithVowel(){
        String pattern = "аеёийоуыэюя";
        String content = readAllFile();
        ArrayList<String> words = new ArrayList();
        String[] rows = content.split("\n");
        try{
            FileOutputStream fooStream = new FileOutputStream(file, false);

            for (int i = 0; i < rows.length; i++) {
                String[] rowWords = rows[i].split(" ");
                for (int j = 0; j < rowWords.length; j++) {
                    String word = rowWords[j];
                    String firstLetter = "";
                    firstLetter += word.toCharArray()[0];
                    if(pattern.contains(firstLetter.toLowerCase())){
                        words.add(word);
                    }
                }
            }
            fooStream.write(content.getBytes());
        } catch (FileNotFoundException e){
            System.out.println("Файл не найден("+file.getPath()+")");
        } catch (IOException e){
            System.out.println(e.getMessage());
        }
        return words;
    }

    public ArrayList<String> lastAndFirstCharSame(){
        String content = readAllFile();
        ArrayList<String> words = new ArrayList();
        String[] rows = content.split("\n");
        try{
            FileOutputStream fooStream = new FileOutputStream(file, false);

            for (int i = 0; i < rows.length; i++) {
                String[] rowWords = rows[i].split(" ");
                for (int j = 0; j < rowWords.length; j++) {
                    if(j + 1 < rowWords.length){
                        String word = rowWords[j];
                        String nextWord = rowWords[j+1];
                        String lastLetter = "";
                        String firstLetter = "";
                        lastLetter += word.toCharArray()[word.length()-1];
                        firstLetter += nextWord.toCharArray()[0];
                        if(lastLetter.equals(firstLetter)){
                            words.add(word);
                            words.add(nextWord);
                        }
                    }
                }
            }
            fooStream.write(content.getBytes());
        } catch (FileNotFoundException e){
            System.out.println("Файл не найден("+file.getPath()+")");
        } catch (IOException e){
            System.out.println(e.getMessage());
        }
        return words;
    }
    public int getCountSameInts(){
        String text="Дан 11текст. 222Найти наибольшее 5555555количество 777идущих 1подряд 00цифр.";
        Pattern pattern = Pattern.compile("[^0-9]{1,}");
        Matcher matcher = pattern.matcher(text);
        String res = matcher.replaceAll(" ");
        OptionalInt m = Arrays.asList(res.split(" ")).stream()
                .mapToInt(s -> s.length())
                .max();
        return m.getAsInt();
    }
    public Map<String, Integer> getCountSameWords(){
        String str = readAllFile();
        String[] words = str.split(" ");
        Map<String, Integer> m=new HashMap<String,Integer>();
        int count = 0;
        for (int i=0; i<words.length; i++){

            try{
                count = m.get(words[i]);
            } catch (NullPointerException e){
                count = 1;
            }


            m.put(words[i], count + 1);
        }
        return m;
    }
}
