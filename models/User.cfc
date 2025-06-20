component persistent="true" table="users" {
    property name="user_id" column="user_id" type="integer" generator="identity";
    property name="first_name" column="first_name" type="string";
    property name="last_name" column="last_name" type="string";
    property name="email" column="email" type="string";
    property name="password" column="password" type="string";
    property name="role_id" column="role_id" type="integer";
    property name="access_level_id" column="access_level_id" type="integer";
    property name="registration_date" column="registration_date" type="timestamp";
    property name="registration_token" column="registration_token" type="string";
    property name="token_expiry" column="token_expiry" type="timestamp";
    property name="is_registered" column="is_registered" type="boolean";
    property name="last_login" column="last_login" type="timestamp";
    property name="created_at" column="created_at" type="timestamp";
    property name="updated_at" column="updated_at" type="timestamp";
}