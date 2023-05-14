package com.splashlearn.custom.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.commons.lang3.RandomUtils;

import static com.splashlearn.custom.constants.GradeCode.*;
import static com.splashlearn.custom.constants.KlassSubject.*;

@Data
@NoArgsConstructor
@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
public class KlassBuildDTO {
    private String klassName;
    private char gradeCode;
    private String subject;
    private int studentsCount;
    /**
     * subjectPreference = 2 (MELA) by default
     */
    @Setter(value = AccessLevel.NONE)
    private int subjectPreference = 2;


    public void setGradeCode(char gradeCode) {
        switch (gradeCode) {
            case KINDERGARTEN:
            case GRADE_1:
            case GRADE_2:
            case GRADE_3:
            case GRADE_4:
            case GRADE_5:
                break;
            default:
                gradeCode = GRADE_1;
        }
        this.gradeCode = gradeCode;
    }

    public void setSubject(String subject) {

        switch (subject.toUpperCase()) {
            case MATH:
                subjectPreference = 0;
                break;
            case ELA:
                subjectPreference = 1;
                break;
            case MELA:
                subjectPreference = 2;
                break;

            default:
                subject = MELA;
        }
        this.subject = subject;
    }

    public void setStudentsCount(int studentsCount) {
        if (studentsCount < 1)
            studentsCount = RandomUtils.nextInt(5, 25);
        this.studentsCount = studentsCount;
    }
}
