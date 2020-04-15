package kz.itstep.action;

import kz.itstep.dao.UserDao;
import kz.itstep.entity.User;
import kz.itstep.exception.CheckException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.Calendar;

import static kz.itstep.util.AppConstant.*;
@MultipartConfig
public class EditProfileAction implements Action {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("currentUser");

        if(user.getImage() != null)request.setAttribute("hasImage", true);
        else request.setAttribute("hasImage", false);

        String currentLang = getCurrentLang(request);
        request.setAttribute(LANG, currentLang);

        if(request.getMethod().equals("GET")){
            String upload_error = request.getParameter("upload_error");
            request.setAttribute("upload_error", upload_error);
            request.getRequestDispatcher(URL_PROFILE_EDIT_PAGE).forward(request, response);
        } else if(request.getMethod().equals("POST")){


            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");

            String dateOfBirth = request.getParameter("date_of_birth");
            Date date = Date.valueOf(dateOfBirth);
            java.sql.Date dateNow = new java.sql.Date(Calendar.getInstance().getTime().getTime());

            if(date.compareTo(dateNow) > 0){
                request.setAttribute(PROFILE_EDITED, false);
                request.setAttribute("error", "Неправильная дата рождения!");
                request.getRequestDispatcher(URL_PROFILE_EDIT_PAGE).forward(request, response);
                return;
            }


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
}
