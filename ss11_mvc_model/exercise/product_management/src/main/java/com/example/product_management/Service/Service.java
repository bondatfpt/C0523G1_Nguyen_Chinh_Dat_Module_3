package com.example.product_management.Service;

import com.example.product_management.Repository.IRepository;
import com.example.product_management.Repository.Repository;
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
}
