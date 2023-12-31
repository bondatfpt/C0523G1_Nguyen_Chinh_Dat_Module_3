package com.example.product_management.service;

import com.example.product_management.model.Product;

import java.util.List;

public interface IService {
    List <Product> showList ();
    void save (Product product);
    void delete (int id);
    Product getProductById(int id);
    void update(int id, String name, double price, String description, String supplier);
    List<Product> searchByName(String name);

}
