package com.example.customer_list.repository;

import com.example.customer_list.model.Customer;

import java.util.List;

public interface IRepository {
    List <Customer> getAll ();
}
