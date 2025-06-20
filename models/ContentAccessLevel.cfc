component persistent="true" table="content_levels" {
    property name="content_level_id" column="content_level_id" type="integer" generator="identity";
    property name="content_id" column="content_id" type="integer";
    property name="access_level_id" column="access_level_id" type="integer";
}