component persistent="true" table="contents" {
    property name="id" column="id" fieldtype="id" generator="native";
    property name="title" column="title" fieldtype="string";
    property name="slug" column="slug" fieldtype="string";
    property name="body" column="body" fieldtype="string";
    property name="author_id" column="author_id" fieldtype="numeric";
    property name="category_id" column="category_id" fieldtype="numeric";
    property name="publish_date" column="publish_date" fieldtype="date";
    property name="modified_date" column="modified_date" fieldtype="date";
}