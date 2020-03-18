package kz.itstep.action;

import kz.itstep.dao.UserDao;
import kz.itstep.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static kz.itstep.util.AppConstant.*;

public class LoginAction implements Action {

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDao();

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        User user = userDao.findByLoginAndPassword(login, password);

        if(user != null){
            request.getRequestDispatcher(URL_HI_PAGE).forward(request, response);
        }
        else{
            request.setAttribute(ERROR_LOGIN, "Неверный логин или пароль!");
            request.getRequestDispatcher(URL_AUTHORIZATION_PAGE).forward(request, response);

        }

    }
}
