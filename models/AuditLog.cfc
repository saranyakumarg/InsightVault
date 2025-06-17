component persistent="true" table="audit_log" {
    property name="id" column="id" fieldtype="id" generator="native";
    property name="user_id" column="user_id" fieldtype="numeric";
    property name="role_id" column="role_id" fieldtype="numeric";
    property name="accesslevel_id" column="accesslevel_id" fieldtype="numeric";
    property name="action" column="action" fieldtype="string";
    property name="entity_id" column="entity_id" fieldtype="numeric";
    property name="entity_type" column="entity_type" fieldtype="string";
    property name="details" column="details" fieldtype="string";
    property name="created_at" column="created_at" fieldtype="date";
}