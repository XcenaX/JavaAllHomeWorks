package files;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void showMenu(){
        System.out.println("1 - Посмотреть список учителей");
        System.out.println("2 - Добавить учителя");
        System.out.println("3 - Удалить учителя");
        System.out.println("4 - Выйти");
    }
    public static void showTeachers(List<Teacher> teachers){
        if(teachers != null){
            System.out.println(teachers);
        } else System.out.println("список пуст!");

    }
    public static void main(String[] args) {
        String file = "C:\\Users\\Лебедевв\\IdeaProjects\\untitled\\src\\files\\files\\demo.data";

        TeacherMaster master = new TeacherMaster(file);
        List<Teacher> teachers = new ArrayList<Teacher>();
        teachers = master.loadTeachers();

        Scanner scanner = new Scanner(System.in);
        boolean isExit = false;

        while (!isExit){
            showMenu();
            String answer = scanner.nextLine();
            switch (answer){
                case "1":
                    showTeachers(teachers);
                    break;
                case "2":
                    master.inputData();
                    teachers = master.loadTeachers();
                    break;
                case "3":
                    System.out.println("Введите id учителя, которого нужно удалить");
                    int id = scanner.nextInt();
                    master.deleteTeacher(id);
                    teachers = master.loadTeachers();
                    break;
                case "4":
                    isExit = true;
                    break;
                default:
                    System.out.println("Введите число от 1 до 4");
            }
        }
        System.out.println("Пока...");


    }
}
