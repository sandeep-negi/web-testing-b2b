package com.splashlearn.custom.api.operations;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class GetAllKlasses {
    public String id;
    public String name;
    public String slug;
    @JsonProperty("grade_id")
    public String gradeId;
    @JsonProperty("students_count")
    public int studentsCount;
    @JsonProperty("school_year")
    public int schoolYear;
    @JsonProperty("created_at")
    public String createdAt;
    @JsonProperty("updated_at")
    public String updatedAt;
    @JsonProperty("teacher_id")
    public String teacherId;
    @JsonProperty("is_promotable")
    public boolean isPromotable;
    @JsonProperty("klass_creation_source")
    public String klassCreationSource;
    @JsonProperty("secondary_klass")
    public boolean secondaryKlass;
}
