{
    ${join(
        ",",
        compact(
            list(
                required_tag_key_1 == "" ? "" : format("\"tag1Key\": \"%s\"",required_tag_key_1),
                required_tag_values_1 == "" ? "" : format("\"tag1Value\": \"%s\"",required_tag_values_1),
                required_tag_key_2 == "" ? "" : format("\"tag2Key\": \"%s\"",required_tag_key_2),
                required_tag_values_2 == "" ? "" : format("\"tag2Value\": \"%s\"",required_tag_values_2),
                required_tag_key_3 == "" ? "" : format("\"tag3Key\": \"%s\"",required_tag_key_3),
                required_tag_values_3 == "" ? "" : format("\"tag3Value\": \"%s\"",required_tag_values_3),
                required_tag_key_4 == "" ? "" : format("\"tag4Key\": \"%s\"",required_tag_key_4),
                required_tag_values_4 == "" ? "" : format("\"tag4Value\": \"%s\"",required_tag_values_4),
                required_tag_key_5 == "" ? "" : format("\"tag5Key\": \"%s\"",required_tag_key_5),
                required_tag_values_5 == "" ? "" : format("\"tag5Value\": \"%s\"",required_tag_values_5),
                required_tag_key_6 == "" ? "" : format("\"tag6Key\": \"%s\"",required_tag_key_6),
                required_tag_values_6 == "" ? "" : format("\"tag6Value\": \"%s\"",required_tag_values_6)
            )
        )
    )}
}
