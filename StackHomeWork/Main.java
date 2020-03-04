package StackHomeWork;

import java.util.Scanner;
import java.util.Stack;

/**
 * Created by Лебедевв on 04.03.2020.
 */
public class Main {
    public static boolean brackets(String text) {
        if (text == null)
            throw new IllegalArgumentException();

        Stack<Character> stack = new Stack<Character>();

        for (int i = 0; i < text.length(); i++) {
            char symbol = text.charAt(i);
            if (symbol == '(' || symbol == '{' || symbol == '[')
                stack.push(symbol);
            else if (symbol == ']') {
                if (stack.empty() || stack.pop() != '[')
                    return false;
            } else if (symbol == '}') {
                if (stack.empty() || stack.pop() != '{')
                    return false;
            } else if (symbol == ')') {
                if (stack.empty() || stack.pop() != '(')
                    return false;
            }
        }
        return stack.empty();
    }
    public static void main(String[] args) {
        System.out.println("Введите строку со скобками: ");
        Scanner scanner = new Scanner(System.in);
        String bracket = scanner.nextLine();
        if(brackets(bracket)){
            System.out.println("Скобки расставлены правильно");
        } else System.out.println("Скобки расставлены НЕправильно");
    }
}
