package kz.itstep.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthorizeAction implements Action {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // тут наверное будет логика проверки пользователя
        request.getRequestDispatcher("/WEB-INF/hi.jsp").forward(request, response);
    }
}
