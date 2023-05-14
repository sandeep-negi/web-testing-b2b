package com.splashlearn.steps;

import com.splashlearn.context.TestContext;
import com.splashlearn.core.Evaluator;
import com.splashlearn.core.database.DatabaseHelper;
import com.splashlearn.custom.database.sql.SQLQuery;
import com.splashlearn.custom.entity.model.Klass;
import com.splashlearn.custom.entity.model.Student;
import com.splashlearn.custom.entity.model.Task;
import com.splashlearn.custom.entity.model.Teacher;
import io.cucumber.java.en.Given;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.nio.ByteBuffer;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.*;

public class MySQLSteps {

    private static final Logger logger = LogManager.getLogger(MySQLSteps.class);
    private final Evaluator evaluator = new Evaluator();
    private TestContext testContext;

    public MySQLSteps(TestContext testContext) {
        this.testContext = testContext;
    }

    public static String getUUIDFromByteArray(Object id) {
        if (Objects.isNull(id))
            return "";
        byte[] bytes = (byte[]) id;
        ByteBuffer bb = ByteBuffer.wrap(bytes);
        long high = bb.getLong();
        long low = bb.getLong();
        UUID uuid = new UUID(high, low);
        return uuid.toString();
    }


    @Given("store details from Database in Entity Context with teacher email {string}")
    public void storeTeacherDetailsInEntityContext(String teacherEmail) {
        DatabaseHelper database = new DatabaseHelper();
        try {
            teacherEmail = evaluator.evaluate(testContext.getData(), teacherEmail);
            String teacherId = getUUIDFromByteArray(database.executePreparedStatementAndGetListOfMap(SQLQuery.TEACHER_ID, teacherEmail).get(0).get("id"));
            Set<Klass> klasses = new HashSet<>();
            List<Map<String, Object>> listOfKlass = database.executePreparedStatementAndGetListOfMap(SQLQuery.ALL_KLASSES_ID, StringUtils.remove(teacherId, "-"));

            for (Map klass : listOfKlass) {
                String klassId = getUUIDFromByteArray(klass.get("id"));
                String klassName = (String) klass.get("name");
                String gradeId = getUUIDFromByteArray(klass.get("grade_id"));
                List<Student> students = new ArrayList();
                List<Map<String, Object>> studentsMap = database.executePreparedStatementAndGetListOfMap(SQLQuery.ALL_STUDENTS_DETAILS, StringUtils.remove(klassId, "-"));
                for (Map student : studentsMap) {
                    students.add(
                            Student.builder()
                                    .id(getUUIDFromByteArray(student.get("id")))
                                    .parentId(getUUIDFromByteArray(student.get("parent_id")))
                                    .firstName((String) student.get("first_name"))
                                    .lastName((String) student.get("last_name"))
                                    .userName((String) student.get("username"))
                                    .plainTextPassword((String) student.get("plain_text_password"))
                                    .klassId(klassId).klassName(klassName)
                                    .gradeId(gradeId)
                                    .teacherId(teacherId)
                                    .build()
                    );
                }

                List<Task> tasks = new ArrayList();
                List<Map<String, Object>> tasksMap = database.executePreparedStatementAndGetListOfMap(SQLQuery.ALL_TASKS_FOR_KLASS, StringUtils.remove(klassId, "-"));
                for (Map task : tasksMap) {
                    tasks.add(
                            Task.builder()
                                    .id(getUUIDFromByteArray(task.get("id")))
                                    .klassId(getUUIDFromByteArray(task.get("klass_id")))
                                    .objectiveId((Integer) task.get("objective_id"))
                                    .deletedAt((LocalDateTime) task.get("deleted_at"))
                                    .finishedAt((LocalDateTime) task.get("finished_at"))
                                    .objectiveType((String) task.get("objective_type"))
                                    .build()
                    );
                }

                klasses.add(Klass.builder().teacherID(teacherId).id(klassId).klassName(klassName).gradeID(gradeId).students(students).tasks(tasks).klassSlug((String) klass.get("slug")).build());
            }
            Teacher teacherDetails = Teacher.builder()
                    .id(teacherId)
                    .email(teacherEmail)
                    .klasses(klasses)
                    .build();
            testContext.getEntityContext().setTeacher(teacherDetails);
            logger.debug(teacherId);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            database.releaseConnection();
        }
    }

}
