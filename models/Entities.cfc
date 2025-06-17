component persistent="true" table="entities" {
    property name="id" column="id" fieldtype="id" generator="native";
    property name="name" column="name" fieldtype="string";
    property name="description" column="description" fieldtype="string";
    property name="created_at" column="created_at" fieldtype="date";
    property name="updated_at" column="updated_at" fieldtype="date";
}