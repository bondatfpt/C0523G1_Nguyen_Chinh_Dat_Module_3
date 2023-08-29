package com.example.product_management.Repository;

import com.example.product_management.model.Product;

import java.util.List;

public interface IRepository {
    List<Product> showList();
    void save(Product product);
    void delete(int id);
}
