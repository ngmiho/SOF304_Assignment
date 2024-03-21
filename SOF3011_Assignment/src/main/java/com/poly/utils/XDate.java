/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.poly.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class XDate {

    static SimpleDateFormat formater = new SimpleDateFormat();

    /**
     * Chuyển đổi String --> Date
     *
     * @param date = String date cần chuyển đổi
     * @param pattern = mẫu định dạng thời gian
     * @return = kết quả kiểu Date
     */
    public static Date toDate(String date, String pattern) {
        try {
            formater.applyPattern(pattern);
            return formater.parse(date);
        } catch (ParseException ex) {
            throw new RuntimeException(ex);
        }
    }

    /**
     * Chuyển đổi Date --> String
     *
     * @param date = ngày cần chuyển đổi
     * @param pattern = mẫu định dạng thời gian
     * @return = chuỗi ngày kiểu String
     */
    public static String toString(Date date, String pattern) {
        formater.applyPattern(pattern);
        return formater.format(date);
    }

    // Trả về thời gian hiện tại
    public static Date now() {
        return new Date();
    }

    /**
     * Thêm ngày vào thời gian
     *
     * @param date = thời gian hiện có
     * @param days = só ngày cần thêm vào
     * @return = Date sau khi thêm vào số days
     *
     * VD: Ngày khai giảng = 1/5, khóa học kéo dài 30 ngày --> Ngày kết thúc = 31/5
     */
    public static Date addDays(Date date, long days) {
        date.setTime(date.getTime() + days * 24 * 60 * 60 * 1000);
        return date;
    }
    
    // Chuyển ngày theo pattern
    public static Date formatDate(Date date, String pattern) {
    	String dateString = toString(date, pattern);
    	return toDate(dateString, pattern);
    }
}
