package files;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InvalidObjectException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class TeacherMaster extends Serializator {
    private String filePath;

    public String getFilePath() {
        return filePath;
    }

    public TeacherMaster(String filePath){
        this.filePath = filePath;
    }


    public Teacher inputData(){
        Scanner scanner = new Scanner(System.in);

        System.out.println("Введите имя учителя");
        String name = scanner.nextLine();

        System.out.println("Введите название группы учителя");
        String group= scanner.nextLine();

        System.out.println("Введите номер карты учителя");
        String card= scanner.nextLine();

        Teacher teacher = new Teacher(group,name,card);
        serialization(teacher, filePath);
        return teacher;
    }

    public void deleteTeacher(int id){
        List<Teacher> teachers = new ArrayList<Teacher>();
        try{
            teachers = deserialization(filePath);
            new FileOutputStream(filePath).close();
            for (int i = 0; i < teachers.size(); i++) {
                if(teachers.get(i).getId() != id){
                    serialization(teachers.get(i),filePath );
                }
            }
        } catch (InvalidObjectException e){
            System.out.println(e.getMessage());
        } catch(FileNotFoundException e){
            System.out.println(e.getMessage());
        } catch (IOException e){
            System.out.println(e.getMessage());
        }

    }

    public void createTeacher(Teacher teacher){
        serialization(teacher, filePath);
    }
    public List<Teacher> loadTeachers(){
        List<Teacher> teachers = null;
        try{
            teachers = deserialization(filePath);
        } catch (InvalidObjectException e){
            System.out.println(e.getMessage());
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        return teachers;
    }
}
