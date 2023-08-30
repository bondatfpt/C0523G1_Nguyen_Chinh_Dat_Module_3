package com.example.product_management.repository;

import com.example.product_management.model.Product;

import java.util.List;

public interface IRepository {
    List<Product> showList();
    void save(Product product);
    void delete(int id);
    Product getProductById (int id);
    void update(int id, String name, double price, String description, String supplier);

    List<Product> searchByName(String nameSearch);
}
