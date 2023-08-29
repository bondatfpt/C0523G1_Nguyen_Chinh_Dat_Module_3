package com.example.ss10.repository;

import com.example.ss10.model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private static final String SELECT = "SELECT * FROM student";
    private static final String INSERT = "insert into student(name,gender,point)\n" +
            "values (?,?,?);";

    @Override
    public List<Student> showList() {
        Connection connection = BaseRepository.getConnection();
        List<Student> list = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                boolean gender = resultSet.getBoolean("gender");
                double point = resultSet.getDouble("point");
                list.add(new Student(id, name, gender, point));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void save(Student student) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1,student.getName());
            preparedStatement.setBoolean(2, student.isGender());
            preparedStatement.setDouble(3, student.getPoint());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
