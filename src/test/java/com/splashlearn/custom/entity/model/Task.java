package com.splashlearn.custom.entity.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Task {
    private String id;
    private String klassId;
    private String objectiveType;
    private Integer objectiveId;
    private LocalDateTime deletedAt;
    private LocalDateTime finishedAt;

}
