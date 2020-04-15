package kz.itstep.filter;

import org.apache.log4j.Logger;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.core.Config;
import java.io.IOException;
import java.util.Locale;

import static kz.itstep.util.AppConstant.LANG;
public class LocaleFilter implements Filter {
    Logger logger = Logger.getLogger(LocaleFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        logger.info("Locale Filter was initialized!");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        Cookie[] cookies = req.getCookies();
        String language = null;
        if( cookies != null){
            for(Cookie c: cookies) {
                if(LANG.equals(c.getName())) {
                    language = c.getValue();
                    break;
                }
            }
            if(language != null){
                Config.set(req.getSession(), Config.FMT_LOCALE, new Locale(language));
            } else {
                Locale currentLocale = Locale.getDefault();
                language = currentLocale.getLanguage();
                Config.set(req.getSession(), Config.FMT_LOCALE, currentLocale);
                Cookie cookie = new Cookie(LANG, currentLocale.getLanguage());
                cookie.setMaxAge(60*60*24);
                resp.addCookie(cookie);
            }

        }
        logger.info("Locale Filter doInit! Selected locale: " + language);
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        logger.info("Locale Filter was destroyed!");
    }
}
