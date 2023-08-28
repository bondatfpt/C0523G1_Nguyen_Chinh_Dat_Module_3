package com.example.customer_list.service;

import com.example.customer_list.model.Customer;
import com.example.customer_list.repository.IRepository;
import com.example.customer_list.repository.Repository;

import java.util.List;

public class Service implements IService{
    private static IRepository iRepository = new Repository();
    @Override
    public List <Customer> showList() {
    List <Customer> customerList = iRepository.getAll();
    return customerList;
    }
}
