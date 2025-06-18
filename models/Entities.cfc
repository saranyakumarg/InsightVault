component persistent="true" table="entities" {
    property name="entity_id" column="entity_id" type="integer" generator="identity";
    property name="name" column="name" type="string";
    property name="description" column="description" type="string";
    property name="created_at" column="created_at" type="timestamp";
    property name="updated_at" column="updated_at" type="timestamp";
}