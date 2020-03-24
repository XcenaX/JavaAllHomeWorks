package kz.itstep.action;

import kz.itstep.dao.CourceDao;
import kz.itstep.dao.LanguageDao;
import kz.itstep.entity.Cource;
import kz.itstep.entity.Language;
import kz.itstep.entity.User;
import kz.itstep.sets.CourceSet;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static kz.itstep.util.AppConstant.*;

public class HiAction implements Action{
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CourceDao courceDao = new CourceDao();
        LanguageDao languageDao = new LanguageDao();

        List<Language> languages = languageDao.findAll();
        List<Cource> cources = courceDao.findAll();



        request.setAttribute(COURCES, cources);
        request.setAttribute(LANGUAGES, languages);
        request.getRequestDispatcher(URL_HI_PAGE).forward(request, response);
    }
}
