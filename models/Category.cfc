component persistent="true" table="categories" {
    property name="category_id" column="category_id" type="integer" generator="identity";
    property name="name" column="name" type="string";
    property name="slug" column="slug" type="string";
}