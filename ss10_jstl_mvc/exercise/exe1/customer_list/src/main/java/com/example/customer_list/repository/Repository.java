package com.example.customer_list.repository;

import com.example.customer_list.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class Repository implements IRepository{
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://static.bongda24h.vn/medias/standard/2021/3/30/ronaldo-beo-xin-loi-cac-ba-me-vi-kieu-toc-ngoai-hanh-tinh.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang","https://kenh14cdn.com/thumb_w/660/203336854389633024/2022/9/25/photo-9-1664068344320453389367.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa","1983-08-22","Nam Định","https://bcp.cdnchinhphu.vn/334894974524682240/2022/4/29/son-tung-mtp-08110778-1651217357607701319631.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa","1983-08-17","Hà Tây","https://bcp.cdnchinhphu.vn/334894974524682240/2022/4/29/son-tung-mtp-08110778-1651217357607701319631.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi","1983-08-19","Hà Nội","https://www.giantfreakinrobot.com/wp-content/uploads/2021/06/wrath-of-man-jason-statham-2.jpg"));
    }
    @Override
    public List<Customer> getAll() {
        return customerList;
    }
}
