package com.example.library_packaging.service;

import java.util.ArrayList;
import java.util.List;

public class Service {
    public static List<Double> solveQuadraticEquation (double a, double b, double c){
        double delta = b * b - 4 * a * c;
        List <Double> result = new ArrayList<>();
        if(delta > 0){
            double x1 = (-b + Math.sqrt(delta)) / (2*a);
            double x2 = (-b - Math.sqrt(delta)) / (2*a);
            result.add(x1);
            result.add(x2);
        } else if (delta == 0) {
            double x = -b / (2 * a);
            result.add(x);
        }else {
            return result;
        }
        return result;
    }
}
