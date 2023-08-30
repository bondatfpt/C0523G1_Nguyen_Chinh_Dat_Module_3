package com.example.product_management.service;

import com.example.product_management.repository.IRepository;
import com.example.product_management.repository.Repository;
import com.example.product_management.model.Product;

import java.util.List;

public class Service implements IService{
    private IRepository iRepository = new Repository();
    @Override
    public List<Product> showList() {
        return iRepository.showList();
    }
    @Override
    public void save(Product product) {
        iRepository.save(product);
    }

    @Override
    public void delete(int id) {
        iRepository.delete(id);
    }
    @Override
    public Product getProductById(int id) {
        return iRepository.getProductById(id);
    }

    @Override
    public void update(int id, String name, double price, String description, String supplier) {
        iRepository.update(id,name,price,description,supplier);
    }

    @Override
    public List<Product> searchByName(String name) {
        List <Product> productList = iRepository.searchByName(name);
        return productList;
    }
}
