package com.example.product_discount_calculator.service;

public class CalculateDiscountService {
    public double calculateDiscountService (double percent, double price){
        double result = price * percent * 0.01;
        return result;
    }
}
