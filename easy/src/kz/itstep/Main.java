package kz.itstep;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Как тебя зовут?");
        String name = scanner.nextLine();
        System.out.println(name + "? Йоу привет " + name + ", nice cook");
    }
}
