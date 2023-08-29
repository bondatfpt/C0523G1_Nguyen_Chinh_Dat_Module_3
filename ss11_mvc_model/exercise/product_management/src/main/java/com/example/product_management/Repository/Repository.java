package com.example.product_management.Repository;

import com.example.product_management.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Repository implements IRepository{
    private static final String SELECT ="SELECT* FROM products";
    private static final String INSERT = "INSERT INTO products(name,price,description,supplier)\n" +
            "values (?,?,?,?);";
    private static final String DELETE = "DELETE FROM products WHERE id = ?";
    @Override
    public List<Product> showList() {
        Connection connection = BaseRepository.getConnection();
        List <Product> productList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()){
                int id =resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                String supplier = resultSet.getString("supplier");
                productList.add(new Product(id,name,price,description,supplier));
            }
            statement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public void save(Product product) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setDouble(2,product.getPrice());
            preparedStatement.setString(3,product.getDescription());
            preparedStatement.setString(4,product.getSupplier());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
