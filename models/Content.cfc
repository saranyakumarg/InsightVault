component persistent="true" table="contents" {
    property name="content_id" column="content_id" type="integer" generator="identity";
    property name="title" column="title" type="string";
    property name="slug" column="slug" type="string";
    property name="body" column="body" type="string";
    property name="author_id" column="author_id" type="integer";
    property name="category_id" column="category_id" type="integer";
    property name="publish_date" column="publish_date" type="timestamp";
    property name="modified_date" column="modified_date" type="timestamp";
}