package kz.itstep.action;

import kz.itstep.dao.CourceDao;
import kz.itstep.entity.Cource;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static kz.itstep.util.AppConstant.*;

public class CourceAction implements Action {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courceId = request.getParameter("courceId");
        CourceDao courceDao = new CourceDao();
        Cource cource = courceDao.findById(Integer.parseInt(courceId));

        request.setAttribute(COURCE, cource);
        request.getRequestDispatcher(COURCE_PAGE).forward(request, response);
    }
}
