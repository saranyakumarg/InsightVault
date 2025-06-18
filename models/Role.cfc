component persistent="true" table="roles" {
    property name="role_id" column="role_id" type="integer" generator="identity";
    property name="name" column="name" type="string";
    property name="description" column="description" type="string";
}