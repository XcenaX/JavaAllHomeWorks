package kz.itstep.action;

import kz.itstep.dao.UserDao;
import kz.itstep.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

import static kz.itstep.util.AppConstant.*;

public class EditProfileAction implements Action {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getMethod().equals("GET")){
            request.getRequestDispatcher(URL_PROFILE_EDIT_PAGE).forward(request, response);
        } else if(request.getMethod().equals("POST")){
            HttpSession session = request.getSession();
            User user = (User)session.getAttribute("currentUser");

            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");

            String dateOfBirth = request.getParameter("date_of_birth");
            Date date = Date.valueOf(dateOfBirth);

            String avatar = request.getParameter("avatar");

            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setPhone(phone);
            user.setDateOfBirth(date);

            UserDao userDao = new UserDao();
            userDao.updateProfile(user);

            request.setAttribute(PROFILE_EDITED, true);
            request.getRequestDispatcher(URL_PROFILE_EDIT_PAGE).forward(request, response);
        }
    }
}
