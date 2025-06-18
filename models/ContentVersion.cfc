component persistent="true" table="content_versions" {
    property name="version_id" column="version_id" type="integer" generator="identity";
    property name="content_id" column="content_id" type="integer";
    property name="content" column="content" type="string";
    property name="created_at" column="created_at" type="timestamp";
    property name="updated_at" column="updated_at" type="timestamp";
}