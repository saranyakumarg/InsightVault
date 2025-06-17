component persistent="true" table="users" {
    property name="id" column="id" fieldtype="id" generator="native";
    property name="first_name" column="first_name" fieldtype="string";
    property name="last_name" column="last_name" fieldtype="string";
    property name="email" column="email" fieldtype="string";
    property name="password" column="password" fieldtype="string";
    property name="role_id" column="role_id" fieldtype="numeric";
    property name="accesslevel_id" column="accesslevel_id" fieldtype="numeric";
    property name="registration_date" column="registration_date" fieldtype="date";
    property name="last_login" column="last_login" fieldtype="date";
    property name="updated_at" column="updated_at" fieldtype="date";
}