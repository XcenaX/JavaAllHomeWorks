package kz.itstep.action;

import kz.itstep.dao.UserDao;
import kz.itstep.entity.User;
import kz.itstep.exception.CheckException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static kz.itstep.util.AppConstant.*;

public class RegistrationAction implements Action{
    private String login;
    private String password;
    private String retypePassword;

    private String first_name;
    private String last_name;

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lang = getCurrentLang(request);
        request.setAttribute(LANG, lang);
        if(request.getMethod().equals("GET")){
            request.getRequestDispatcher(URL_REGISTRATION_PAGE).forward(request, response);
        } else if(request.getMethod().equals("POST")){
            try{
                UserDao userDao = new UserDao();
                fillData(request);
                checkField();

                User user = new User();
                user = setUser();
                User testUser = userDao.findByLogin(user.getLogin());
                if(testUser != null)throw new CheckException("Такой пользователь уже существует!","login");
                if(userDao.insert(user)){
                    request.getRequestDispatcher(URL_AUTHORIZATION_PAGE).forward(request, response);
                } else{
                    request.setAttribute(ERROR_LOGIN, "Что-то пошло не так! Попробуйте еще раз!");
                    request.getRequestDispatcher(URL_REGISTRATION_PAGE).forward(request, response);
                }
            } catch (CheckException e){
                request.setAttribute("login", login);
                request.setAttribute("password", password);
                request.setAttribute("firstName", first_name);
                request.setAttribute("lastName", last_name);
                request.setAttribute(ERROR_LOGIN, e.getMessage());
                request.getRequestDispatcher(URL_REGISTRATION_PAGE).forward(request, response);
            }


        }

    }

    public String getCurrentLang(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        String currentLang = "";
        for (int i = 0; i < cookies.length; i++) {
            String name = cookies[i].getName();
            if(name.equals("language")){
                currentLang = cookies[i].getValue();
            }
        }
        return currentLang;
    }

    private void checkField() throws CheckException{
        if(login.length() < 3)throw new CheckException("Логин должен иметь не менее 3 символов", "login");
        if(password.length() < 5)throw new CheckException("Пароль должен иметь не менее 5 символов", "password");
        if(!password.equals(retypePassword))throw new CheckException("Пароли не совпадают!","password");
        if(Character.isDigit(login.charAt(0)))throw new CheckException("В начале логина не должна стоять цифра!","login");
        if(isNumeric(login))throw new CheckException("Логин должен содержать буквы!","login");
    }

    private User setUser(){
        User user = new User();
        user.setLastName(last_name);
        user.setFirstName(first_name);
        user.setLogin(login);
        user.setPassword(password);
        return user;
    }

    private void fillData(HttpServletRequest request){
        login = request.getParameter("login");
        password = request.getParameter("password");
        first_name = request.getParameter("first_name");
        last_name = request.getParameter("last_name");
        retypePassword = request.getParameter("retypePassword");
    }
    public boolean isNumeric(String strNum) {
        if (strNum == null) {
            return false;
        }
        try {
            double d = Double.parseDouble(strNum);
        } catch (NumberFormatException nfe) {
            return false;
        }
        return true;
    }
}
