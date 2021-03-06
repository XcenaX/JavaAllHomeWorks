package kz.itstep.action;

import kz.itstep.dao.CourceDao;
import kz.itstep.dao.PurchasedCourceDao;
import kz.itstep.dao.UserDao;
import kz.itstep.entity.PurchasedCource;
import kz.itstep.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static kz.itstep.util.AppConstant.LANG;

public class BuyAction implements Action {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("currentUser");
        String courceIdStr = request.getParameter("id");

        String currentLang = getCurrentLang(request);
        request.setAttribute(LANG, currentLang);

        int courceId = Integer.valueOf(courceIdStr);

        CourceDao courceDao = new CourceDao();
        int price = courceDao.findById(courceId).getPrice();

        user.setMoney(user.getMoney() - price);

        PurchasedCourceDao purchasedCourceDao = new PurchasedCourceDao();
        PurchasedCource purchasedCource = new PurchasedCource(user.getId(), courceId);
        purchasedCourceDao.insert(purchasedCource);

        UserDao userDao = new UserDao();
        userDao.update(user);

        response.sendRedirect("/fs/cource?courceId=" + courceId);
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
