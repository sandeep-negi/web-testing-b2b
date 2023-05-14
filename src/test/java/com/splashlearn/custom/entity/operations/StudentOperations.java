package com.splashlearn.custom.entity.operations;

import com.splashlearn.context.EntityContext;
import com.splashlearn.custom.entity.model.Klass;
import com.splashlearn.custom.entity.model.Student;
import lombok.extern.log4j.Log4j2;

import java.util.List;
import java.util.Optional;

@Log4j2
public class StudentOperations {

    //    private final APIContext apiContext;
    private final EntityContext entityContext;

    public StudentOperations(EntityContext entityContext) {
        this.entityContext = entityContext;
    }

    public Student getStudentByFirstName(String studentFirstName) {
        Optional<Student> studentOptional = entityContext.getTeacher().getKlasses().stream().flatMap(klass -> klass.getStudents().stream()).filter(student -> student.getFirstName().equalsIgnoreCase(studentFirstName)).findFirst();
        if (studentOptional.isPresent()) return studentOptional.get();
        else {
            log.error("Student not found with firstname:{}" + studentFirstName);
            throw new RuntimeException("Student not found with firstname:" + studentFirstName);
        }
    }

    private Student getStudentById(String id) {
        Optional<Student> studentOptional = entityContext.getTeacher().getKlasses().stream().flatMap(klass -> klass.getStudents().stream()).filter(student -> student.getId().equalsIgnoreCase(id)).findFirst();
        if (studentOptional.isPresent()) return studentOptional.get();
        else {
            log.error("Student not found with id:{}" + id);
            throw new RuntimeException("Student not found with id:" + id);
        }
    }

    private Student getStudentByUserName(String userName) {
        Optional<Student> studentOptional = entityContext.getTeacher().getKlasses().stream().flatMap(klass -> klass.getStudents().stream()).filter(student -> student.getUserName().equalsIgnoreCase(userName)).findFirst();
        if (studentOptional.isPresent()) return studentOptional.get();
        else {
            log.error("Student not found with username:{}" + userName);
            throw new RuntimeException("Student not found with username:" + userName);
        }
    }

    private List<Student> getAllStudentsForKlass(String klassName) {
        Optional<Klass> klass = entityContext.getTeacher().getKlasses().stream().filter(k -> k.getKlassName().equalsIgnoreCase(klassName)).findFirst();
        if (klass.isPresent()) return klass.get().getStudents();
        else {
            log.error("Klass not found with klassName:{}" + klassName);
            log.debug("Available klasses:{}" + entityContext.getTeacher().getKlasses());
            throw new RuntimeException("Klass not found with klassName:" + klassName);
        }
    }

}
