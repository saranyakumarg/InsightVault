component persistent="true" table="audit_log" {
    property name="log_id" column="log_id" type="integer" generator="identity";
    property name="user_id" column="user_id" type="integer";
    property name="role_id" column="role_id" type="integer";
    property name="access_level_id" column="access_level_id" type="integer";
    property name="action" column="action" type="string";
    property name="entity_type" column="entity_type" type="string";
    property name="details" column="details" type="string";
    property name="created_at" column="created_at" type="timestamp";
}