component persistent="true" table="content_tags" {
    property name="content_tag_id" column="content_tag_id" type="integer" generator="identity";
    property name="content_id" column="content_id" type="integer";
    property name="tag_id" column="tag_id" type="integer";
}