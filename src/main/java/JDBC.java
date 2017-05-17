import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by zhoumeng on
 * 2017.5.16.
 * 下午 04:46.
 */
public class JDBC {

    //JDBC Java Databases connectivity Java 语言数据库连接
    public static void main(String[] args) throws SQLException {
        //1.准备数据驱动
        new Driver();
        //2.取得一次数据库连接
        Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/db_1702","root","system");
        //3.预编译语句
        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO db_1702.course VALUES (NULL ,'Front-end',2)");
        //4.执行语句
        preparedStatement.executeUpdate();
    }
}
