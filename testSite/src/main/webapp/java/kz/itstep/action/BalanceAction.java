package kz.itstep.action;

import kz.itstep.dao.UserDao;
import kz.itstep.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

import static kz.itstep.util.AppConstant.*;

public class BalanceAction implements Action {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("currentUser");
        String currentLang = getCurrentLang(request);
        request.setAttribute(LANG, currentLang);
        if(user.getImage() != null)request.setAttribute("hasImage", true);
        else request.setAttribute("hasImage", false);

        if(request.getMethod().equals("GET")){
            request.getRequestDispatcher(URL_BALANCE).forward(request, response);
        } else if(request.getMethod().equals("POST")){
            String sum = request.getParameter("sum");
            int intSum = Integer.valueOf(sum);

            UserDao userDao = new UserDao();
            userDao.updateBalance(intSum + user.getMoney(), user.getId());

            user.setMoney(intSum + user.getMoney());
            session.setAttribute("currentUser", user);

            request.setAttribute(BALANCE_INCREASED, true);
            response.sendRedirect("/fs/profile");
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
