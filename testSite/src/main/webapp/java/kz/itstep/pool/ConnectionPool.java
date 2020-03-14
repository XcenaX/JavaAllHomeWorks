package kz.itstep.pool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

public class ConnectionPool {
    private static final int DEFAULT_POOL_SIZE = 100;
    public static final String URL = "jdbc:postgresql://localhost:5432/project";
    public static final String USER = "postgres";
    public static final String PASSWORD = "Dagad582#";
    private static ConnectionPool connectionPool = init();

    public static ConnectionPool getConnectionPool(){
        return connectionPool;
    }
    private final BlockingQueue<Connection> CONNECTIONS;

    private ConnectionPool(String url, String user, String password) throws SQLException {
        CONNECTIONS = new ArrayBlockingQueue<>(DEFAULT_POOL_SIZE);
        for (int i = 0; i < DEFAULT_POOL_SIZE; i++) {
            Connection connection = DriverManager.getConnection(url,user,password);
            CONNECTIONS.add(connection);
        }
    }

    private static ConnectionPool init(){
        ConnectionPool instance = null;
        try{
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e){
            System.out.println(e.getMessage());
        }
        return instance;
    }

    public Connection getConnection(){
        Connection connection = null;
        try{
            connection = CONNECTIONS.take();
        } catch (InterruptedException e){
            System.out.println(e.getMessage());
        }
        return connection;
    }

    public void releaseConnection(Connection connection){
        try{
            if(!connection.isClosed()){
                if(!CONNECTIONS.offer(connection)){
                    System.out.println("Connection wasn't added!");
                } else System.out.println("Connection has closed!");
            }
        } catch (SQLException e){
            System.out.println(e.getMessage());
        }
    }

    private void clearConnectionQueue() throws SQLException{
        Connection connection;
        while ((connection = CONNECTIONS.poll()) != null){
            if(!connection.getAutoCommit()){
                connection.commit();
            }
            connection.close();
        }
    }

    public static void dispose() throws SQLException{
        if(connectionPool != null){
           connectionPool.clearConnectionQueue();
           connectionPool = null;
        }
    }

}

