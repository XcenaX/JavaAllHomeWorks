package kz.itstep.dao;
import kz.itstep.entity.Cource;
import kz.itstep.pool.ConnectionPool;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourceDao extends AbstractDao<Cource> {
    private static final String SQL_SELECT_ALL = "select * from public.cources";
    private static final String SQL_SELECT_BY_ID = "select * from public.cources where id=";
    private static final String INSERT = "insert into public.cources (name) values(?)";
    private static final String DELETE_ID = "delete from public.cources where id=";
    private static final String DELETE_ROLE = "delete from public.cources where";
    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean delete(Cource cource) {
        return false;
    }

    @Override
    public boolean insert(Cource cource) {
        return false;
    }

    @Override
    public boolean update(Cource cource) {
        return false;
    }

    @Override
    public List<Cource> findAll() {
        List<Cource> cources = new ArrayList<>();
        Connection connection = ConnectionPool.getConnectionPool().getConnection();
        try(Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(SQL_SELECT_ALL)){
            while (resultSet.next()){
                Cource cource = new Cource();
                cource.setId(resultSet.getInt("id"));
                cource.setDescription(resultSet.getString("description"));
                cource.setPrice(resultSet.getBigDecimal("price"));
                cource.setTitle(resultSet.getString("title"));
                cources.add(cource);
            }
        } catch (SQLException e){
            System.out.println(e.getMessage());
        } finally {
            ConnectionPool.getConnectionPool().releaseConnection(connection);
        }
        return cources;
    }

    @Override
    public Cource findById(int id) {
        Connection connection = ConnectionPool.getConnectionPool().getConnection();
        try(Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(SQL_SELECT_BY_ID+id)){
            Cource cource = new Cource();
            cource.setId(resultSet.getInt("id"));
            cource.setDescription(resultSet.getString("description"));
            cource.setPrice(resultSet.getBigDecimal("price"));
            cource.setTitle(resultSet.getString("title"));
            return cource;
        } catch (SQLException e){
            System.out.println(e.getMessage());
            return null;
        } finally {
            ConnectionPool.getConnectionPool().releaseConnection(connection);
        }
    }
}
