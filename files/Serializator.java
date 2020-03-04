package files;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Serializator {
    public boolean serialization(Teacher s, String fileName){
        boolean flag = false;
        File f = new File(fileName);
        ObjectOutputStream ostream = null;
        try{
            FileOutputStream fos = new FileOutputStream(f, true);
            if(fos != null){
                ostream = new ObjectOutputStream(fos);
                ostream.writeObject(s);
                flag = true;
            }
        } catch (FileNotFoundException e){
            System.out.println(e.getMessage());
        } catch (NotSerializableException e){
            System.out.println(e.getMessage());
        } catch (IOException e){
            System.out.println(e.getMessage());
        } finally {
            try{
                if(ostream != null){
                    ostream.close();
                }
            } catch (IOException e){
                System.out.println(e.getMessage());
            }
        }
        return flag;
    }
    public List<Teacher> deserialization(String fileName) throws InvalidObjectException{
        File f = new File(fileName);
        ObjectInputStream istream = null;
        List<Teacher> teacherList = new ArrayList<Teacher>();
        try{

            FileInputStream fis = new FileInputStream(f);
            istream = new ObjectInputStream(fis);
            while(true){
                Teacher st = (Teacher)istream.readObject();
                if(st == null)break;
                teacherList.add(st);
            }

        } catch (FileNotFoundException e){
            System.out.println(e.getMessage());
        } catch (NotSerializableException e){
            System.out.println(e.getMessage());
        } catch (IOException e){
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException e){
            System.out.println(e.getMessage());
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        finally {
            try{
                if(istream != null){
                    istream.close();
                }
                return teacherList;
            } catch (IOException e){
                System.out.println(e.getMessage());
            }
        }
        throw  new InvalidObjectException("Объект не восстановлен");
    }
}
