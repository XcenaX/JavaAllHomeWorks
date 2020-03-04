package files;

import java.io.Serializable;

public class Teacher implements Serializable {
    public static int count = 0;
    private String group;
    private String lastName;
    private int id;
    private String cardNumber;

    public Teacher(String group, String lastName,  String cardNumber){
        count++;
        this.group = group;
        this.lastName = lastName;
        this.id = count;
        this.cardNumber = cardNumber;
    }
    public Teacher(){count++; id = count;}

    public String toString(){
        return "Фамилия: " + lastName + " | id: " + id;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }
}
