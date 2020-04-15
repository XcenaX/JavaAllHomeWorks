package kz.itstep.action;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static kz.itstep.util.AppConstant.LANG;
import static kz.itstep.util.AppConstant.URL_AUTHORIZATION_PAGE;

public class AuthorizationAction implements Action {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lang = getCurrentLang(request);
        request.setAttribute(LANG, lang);
        request.getRequestDispatcher(URL_AUTHORIZATION_PAGE).forward(request, response);
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
