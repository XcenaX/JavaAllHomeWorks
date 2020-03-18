package kz.itstep;

import kz.itstep.dao.UserDao;
import kz.itstep.entity.User;

import java.util.List;

public class Runner {
    public static void main(String[] args) {
        UserDao userDao = new UserDao();
        /*User firstUser = new User();
        firstUser.setFirstName("Sidor");
        firstUser.setSecondName("Sidorov");
        firstUser.setLogin("manager2");
        firstUser.setPassword("123456");
        userDao.insert(firstUser);
        System.out.println(firstUser.getId());*/

        List<User> users = userDao.findAll();
        System.out.println(users);

        System.out.println(users);
    }
}
