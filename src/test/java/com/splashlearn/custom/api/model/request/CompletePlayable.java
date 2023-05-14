package com.splashlearn.custom.api.model.request;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CompletePlayable {

    private String studentId;
    private String subject;
    private String playableId;
    private String learningObjectiveId;

}
