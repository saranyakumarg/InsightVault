component persistent="true" table="content_versions" {
    property name="version_id" column="version_id" fieldtype="id" generator="native";
    property name="content_id" column="content_id" fieldtype="numeric";
    property name="content" column="content" fieldtype="string";
    property name="created_at" column="created_at" fieldtype="date";
    property name="updated_at" column="updated_at" fieldtype="date";
}