package kz.itstep.entity;

import java.sql.Date;

public class User extends Entity {
    private String login;
    private String password;
    private String firstName;
    private String lastName;
    private int money;
    private int role;
    private Date dateOfBirth;
    private String phone;
    private byte[] image;

    public User(String login, String password, String firstName, String lastName, int money, int role, Date dateOfBirth, String phone) {
        this.login = login;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.money = money;
        this.role = role;
        this.dateOfBirth = dateOfBirth;
        this.phone = phone;
    }

    public User(){}

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String toString(){
        return firstName + " " + lastName;
    }
}
