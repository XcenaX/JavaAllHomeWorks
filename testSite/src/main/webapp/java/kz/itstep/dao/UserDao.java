package kz.itstep.dao;
import kz.itstep.entity.User;
import kz.itstep.pool.ConnectionPool;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao extends AbstractDao<User> {
    private static final String SQL_SELECT_ALL = "select * from public.users";
    private static final String SQL_SELECT_BY_ID = "select * from public.users where id=";
    private static final String INSERT = "select * from public.users u;insert into public.users (id, login, password, first_name, last_name) values(id, ?, ?, ?, ?)";
    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean delete(User user) {
        return false;
    }

    @Override
    public boolean insert(User user) {
        return false;
    }

    @Override
    public boolean update(User user) {
        return false;
    }

    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        Connection connection = ConnectionPool.getConnectionPool().getConnection();
        try(Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(SQL_SELECT_ALL)){
            while (resultSet.next()){
                User user = new User(resultSet.getString("login"),resultSet.getString("password"),resultSet.getString("first_name"),resultSet.getString("last_name"));
                user.setId(resultSet.getInt("id"));
                users.add(user);
            }
        } catch (SQLException e){
            System.out.println(e.getMessage());
        } finally {
            ConnectionPool.getConnectionPool().releaseConnection(connection);
        }
        return users;
    }

    @Override
    public User findById(int id) {
        Connection connection = ConnectionPool.getConnectionPool().getConnection();
        try(Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(SQL_SELECT_BY_ID+id)){
            User user = new User(resultSet.getString("login"),resultSet.getString("password"),resultSet.getString("first_name"),resultSet.getString("last_name"));
            user.setId(resultSet.getInt("id"));
            return user;
        } catch (SQLException e){
            System.out.println(e.getMessage());
            return null;
        } finally {
            ConnectionPool.getConnectionPool().releaseConnection(connection);
        }
    }
}
