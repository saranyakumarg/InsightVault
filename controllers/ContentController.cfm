<cfif structKeyExists(url, "method")>
    <cfsetting enablecfoutputonly="true" />
    <cfsetting showDebugOutput="false">
</cfif>
<cfscript>
    // Get the access levels from the AccessLevelModel
    variables.accessLevelModel = createObject("component", application.baseURL & "models.AccessLevelModel");
    variables.accessLevels = variables.accessLevelModel.getAccessLevels();
    // Get the categories from the CategoriesModel
    variables.categoriesModel = createObject("component", application.baseURL & "models.CategoryModel");
    variables.categories = variables.categoriesModel.getCategories();
    // Get the categories from the CategoriesModel
    variables.tagsModel = createObject("component", application.baseURL & "models.TagsModel");
    variables.tags = variables.tagsModel.getTags();
    // Get the audit log model
    variables.auditLogModel = createObject("component", application.baseURL & "models.AuditLogModel");
    // Get the contents model
    variables.contentModel = createObject("component", application.baseURL & "models.ContentModel");


    if (structKeyExists(url, "method")) {
        switch (url.method) {
            case "save-content":
                saveContent();
                break;
            default:
                writeOutput(serializeJSON({ "success": false, "message": "Unknown method: " & url.method }));
                break;
        }
    }

    function saveContent() {
        selectedAccessLevels="";
        selectedTags="";
        if (structKeyExists(form, "accessLevel[]")) {
            selectedAccessLevels =form["accessLevel[]"];
        } else {
            writeOutput(serializeJSON({ "SUCCESS": false, "message": "Please select at least one access level!" }));
        }
         if (structKeyExists(form, "tags[]")) {
            selectedTags =form["tags[]"];
        } else {
            writeOutput(serializeJSON({ "SUCCESS": false, "message": "Please select at least one tag!" }));
        }

        var contentData = {
            title: form.title,
            slug: form.slug,
            category_id: form.category,
            access_levels: selectedAccessLevels,
            tags: selectedTags,
            content: form.content,
            author_id: session.user.user_id,
            status: "draft"
        };
        // Save content
        var contentResponse = variables.contentModel.saveContent(contentData);

        // Audit log for content creation
        var auditAction = "Content Created";
        var auditDetails = "Content '" & contentData.title & "' created by user ID " & session.user.user_id;
        var auditData = {
            user_id: session.user.user_id,
            role_id: session.user.role_id,
            action: auditAction,
            entity_type: "Content",
            access_level_id: session.user.access_level_id,
            details: auditDetails
        };
        variables.auditLogModel.saveAuditLog(auditData);

        writeOutput(serializeJSON(contentResponse));
    }
</cfscript>