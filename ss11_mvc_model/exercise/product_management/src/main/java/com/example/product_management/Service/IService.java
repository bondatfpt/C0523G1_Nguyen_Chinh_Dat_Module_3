package com.example.product_management.Service;

import com.example.product_management.model.Product;

import java.util.List;

public interface IService {
    List <Product> showList ();
    void save (Product product);
    void delete (int id);
}
