package com.splashlearn.custom.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CompletePlayable {
    private String studentFirstName;
    private String subject;
    @Builder.Default
    private int learningObjectiveId = -1;
    @Builder.Default
    private int playableId = -1;
}
