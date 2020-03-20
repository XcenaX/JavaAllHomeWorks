package kz.itstep.dao;
import kz.itstep.entity.Role;
import kz.itstep.entity.Role;
import kz.itstep.pool.ConnectionPool;
import org.apache.log4j.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoleDao extends AbstractDao<Role> {
    private Logger logger = Logger.getLogger(CourceDao.class);

    private static final String SQL_SELECT_ALL = "select * from public.roles";
    private static final String SQL_SELECT_BY_ID = "select * from public.roles where id=";
    private static final String INSERT = "insert into public.roles (name) values(?)";
    private static final String DELETE_ID = "delete from public.roles where id=";
    private static final String DELETE_ROLE = "delete from public.roles where";
    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean delete(Role role) {
        return false;
    }

    @Override
    public boolean insert(Role role) {
        return false;
    }

    @Override
    public boolean update(Role role) {
        return false;
    }

    @Override
    public List<Role> findAll() {
        List<Role> roles = new ArrayList<>();
        Connection connection = ConnectionPool.getConnectionPool().getConnection();
        try(Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(SQL_SELECT_ALL)){
            while (resultSet.next()){
                Role role = new Role(resultSet.getString("name"));
                role.setId(resultSet.getInt("id"));
                roles.add(role);
            }
        } catch (SQLException e){
            logger.error(e.getMessage());
        } finally {
            ConnectionPool.getConnectionPool().releaseConnection(connection);
        }
        return roles;
    }

    @Override
    public Role findById(int id) {
        Connection connection = ConnectionPool.getConnectionPool().getConnection();
        try(Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(SQL_SELECT_BY_ID+id)){
            Role role = new Role(resultSet.getString("name"));
            role.setId(resultSet.getInt("id"));
            return role;
        } catch (SQLException e){
            logger.error(e.getMessage());
            return null;
        } finally {
            ConnectionPool.getConnectionPool().releaseConnection(connection);
        }
    }
}
