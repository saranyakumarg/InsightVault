component persistent="true" table="access_levels" {
    property name="access_level_id" column="access_level_id" type="integer" generator="identity";
    property name="name" column="name" type="string";
    property name="description" column="description" type="string";
}