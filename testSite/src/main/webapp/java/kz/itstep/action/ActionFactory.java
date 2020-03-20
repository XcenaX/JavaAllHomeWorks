package kz.itstep.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

public class ActionFactory {
    private static final Map<String, Action> PAGES = new HashMap<>();

    public ActionFactory() {
        init();
    }

    private void init(){
        PAGES.put("GET/info", new InfoAction());
        PAGES.put("GET/cources", new HiAction());
        PAGES.put("GET/login", new AuthorizationAction());
        PAGES.put("GET/", new AuthorizationAction());
        PAGES.put("GET/registration", new RegistrationAction());
        PAGES.put("GET/cource", new CourceAction());

        PAGES.put("POST/registration", new RegistrationAction());
        PAGES.put("POST/authorization", new LoginAction());

    }

    public Action getAction(HttpServletRequest request, HttpServletResponse response){
        return PAGES.get(request.getMethod() + request.getPathInfo());
    }
}
