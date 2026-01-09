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

    // for edit
    variables.econtent_id = "";
    variables.etitle = "";
    variables.eslug = "";
    variables.econtent = "";
    variables.ecategory = "";
    variables.eaccess_levels = "";
    variables.etags = "";


    if (structKeyExists(url, "method")) {
        switch (url.method) {
            case "save-content":
                saveContent();
                break;
            case "edit-content":
                editContent();
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
            id: form.id,
            title: form.title,
            slug: form.slug,
            category_id: form.category,
            access_levels: selectedAccessLevels,
            tags: selectedTags,
            content: form.content,
            author_id: session.user.user_id,
            status: "draft"
        };
        // Save content and Audit log for content creation
        var auditAction = "Content";
        var auditDetails ="";
        if (structKeyExists(form, "id") && isNumeric(form.id) && form.id GT 0) {
            var contentResponse = variables.contentModel.updateContent(contentData);
            auditAction = "Content Updated";
            auditDetails = "Content '" & contentData.title & "' updated by user ID " & session.user.user_id;
        } else {
            var contentResponse = variables.contentModel.saveContent(contentData);
            auditAction = "Content Created";
            auditDetails = "Content '" & contentData.title & "' created by user ID " & session.user.user_id;
        }
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

    function editContent() {
        variables.contentData = variables.contentModel.getContentById(url.id);
        variables.econtent_id = variables.contentData.content.content_id;
        variables.etitle = variables.contentData.content.title;
        variables.eslug = variables.contentData.content.slug;
        variables.econtent = variables.contentData.content.content;
        variables.ecategory = variables.contentData.content.category_id;
        variables.eaccess_levels = variables.contentData.accessLevels;
        variables.etags = variables.contentData.tags;
        variables.selectedTagIds = {};
        if (isQuery(variables.etags) && variables.etags.recordCount) {
            for (var i = 1; i <= variables.etags.recordCount; i++) {
                variables.selectedTagIds[variables.etags["tag_id"][i]] = true;
            }
        } else if (isNumeric(variables.etags)) {
            variables.selectedTagIds[variables.etags] = true;
        }
    }
</cfscript>