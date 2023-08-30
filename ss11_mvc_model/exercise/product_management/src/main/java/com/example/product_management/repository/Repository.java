package com.example.product_management.repository;

import com.example.product_management.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Repository implements IRepository{
    private static final String SELECT ="SELECT* FROM products";
    private static final String INSERT = "INSERT INTO products(name,price,description,supplier)\n" +
            "values (?,?,?,?);";
    private static final String DELETE = "DELETE FROM products\n" +"WHERE id = ?";
    private static final String GETPRODUCTBYID = "SELECT * FROM products\n" + "WHERE id = ?";
    private static final String UPDATE = "UPDATE products\n" +
                                        "SET name = ?, \n" +
                                        "price = ?, \n" +
                                        "description = ?,\n" +
                                        "supplier = ?\n" +
                                        "WHERE id = ?";
    private static final String SEARCH ="SELECT products.name " +
            "FROM products " +
            "WHERE name LIKE ?";
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
            connection.close();
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
            connection.close();
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
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Product getProductById(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GETPRODUCTBYID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                return new Product(resultSet.getInt(1),
                                    resultSet.getString(2),
                                    resultSet.getDouble(3),
                                    resultSet.getString(4),
                                    resultSet.getString(5));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public void update(int id, String name, double price, String description, String supplier) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1,name);
            preparedStatement.setDouble(2,price);
            preparedStatement.setString(3,description);
            preparedStatement.setString(4,supplier);
            preparedStatement.setInt(5,id);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Product> searchByName(String nameSearch) {
        Connection connection = BaseRepository.getConnection();
        List <Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1,nameSearch+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                productList.add(new Product(name));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }
}
