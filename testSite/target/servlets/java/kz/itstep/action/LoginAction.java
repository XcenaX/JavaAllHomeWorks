package kz.itstep.action;

import kz.itstep.dao.CourceDao;
import kz.itstep.dao.UserDao;
import kz.itstep.entity.Cource;
import kz.itstep.entity.User;
import kz.itstep.sets.CourceSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static kz.itstep.util.AppConstant.*;

public class LoginAction implements Action {

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDao();

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        User user = userDao.findByLoginAndPassword(login, password);

        if(user != null){
            CourceDao courceDao = new CourceDao();
            List<Cource> cources = courceDao.findAll();

            request.setAttribute(COURCES, cources);
            request.setAttribute(CURRENT_USER, user);
            response.sendRedirect("/fs/cources");
            //request.getRequestDispatcher(URL_HI_PAGE).forward(request, response);
        }
        else{
            request.setAttribute(ERROR_LOGIN, "Неверный логин или пароль!");
            request.getRequestDispatcher(URL_AUTHORIZATION_PAGE).forward(request, response);

        }

    }
}
