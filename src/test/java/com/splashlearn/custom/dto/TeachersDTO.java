package com.splashlearn.custom.dto;

import com.splashlearn.custom.entity.model.Teacher;
import lombok.Data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Data
public class TeachersDTO {

    private static List<Teacher> teacherList = Collections.synchronizedList(new ArrayList<>());

    public static List<Teacher> getTeacherList() {
        return teacherList;
    }

}