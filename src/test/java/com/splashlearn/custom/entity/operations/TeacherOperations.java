package com.splashlearn.custom.entity.operations;

import com.splashlearn.context.EntityContext;
import com.splashlearn.custom.entity.model.Klass;
import com.splashlearn.custom.entity.model.Student;
import com.splashlearn.custom.entity.model.Task;
import lombok.extern.log4j.Log4j2;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Log4j2
public class TeacherOperations {
    private final EntityContext entityContext;

    public TeacherOperations(EntityContext entityContext) {
        this.entityContext = entityContext;
    }


    public List<Task> getUnfinishedTasks(String klassName) {

        Optional<Klass> klass = entityContext.getTeacher().
                getKlasses().stream().
                filter(k -> k.getKlassName().equalsIgnoreCase(klassName)).findFirst();

        if (klass.isPresent()) {
            return klass.get().getTasks().stream()
                    .filter(t -> Objects.isNull(t.getDeletedAt()) && Objects.isNull(t.getFinishedAt()))
                    .collect(Collectors.toList());
        }
        else {
            log.error("Klass not found with klassName:{}" + klassName);
            log.debug("Available klasses:{}" + entityContext.getTeacher().getKlasses());
            throw new RuntimeException("Klass not found with klassName:" + klassName);
        }
    }

    public List<Student> getAllStudentsForKlass(String klassName) {
        Optional<Klass> klass = entityContext.getTeacher().getKlasses().stream().filter(k -> k.getKlassName().equalsIgnoreCase(klassName)).findFirst();
        if (klass.isPresent()) return klass.get().getStudents();
        else {
            log.error("Klass not found with klassName:{}" + klassName);
            log.debug("Available klasses:{}" + entityContext.getTeacher().getKlasses());
            throw new RuntimeException("Klass not found with klassName:" + klassName);
        }
    }

    public List<Student> getSpecificStudentsForKlassByFirstName(String klassName, List<String> studentsToGet) {

        return getAllStudentsForKlass(klassName).stream()
                .filter(allStudents -> studentsToGet.stream()
                        .anyMatch(selectedStudent -> selectedStudent.equals(allStudents.getFirstName())))
                .collect(Collectors.toList());
    }

    public Optional<Klass> getKlassByName(String klassName) {
        return entityContext.getTeacher().getKlasses().stream()
                .filter(k -> k.getKlassName().equalsIgnoreCase(klassName)).findFirst();

    }

}
