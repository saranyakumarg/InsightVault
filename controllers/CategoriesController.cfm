<cfif structKeyExists(url, "method")>
    <cfsetting enablecfoutputonly="true" />
    <cfsetting showDebugOutput="false">
</cfif>
<cfscript>
    //get category model
    variables.categoryModel = createObject("component", application.baseUrl & "models.CategoryModel");

    if(structKeyExists(url, "method")){
        switch(url.method){
            case "get-category":
                getCategory();
                break;
            case "delete-category":
                deleteCategory();
                break;
            case "save-category":
                saveCategory();
                break;
            default:
                writeOutput(serializeJSON({ "success": false, "message": "Unknown method: " & url.method }));
                break;
        }
    }


   
    function getCategory(){
        var draw = structKeyExists(url, "draw") ? url.draw : 0;
        var start= structKeyExists(url, "start") ? url.start : 0;
        var length=structKeyExists(url, "length") ? url.length : 8;
        var searchValue = structKeyExists(url, "search[value]") ? url["search[value]"] : "";
        var orderColumnIndex = structKeyExists(url, "order[0][column]") ? url["order[0][column]"] : "0";
        var orderDir = structKeyExists(url, "order[0][dir]") ? url["order[0][dir]"] : "asc";
        var columnMap = ["category_id", "name", "slug"];
        var orderColumn = columnMap[orderColumnIndex +1];
        var totalRecords = variables.categoryModel.getTotalCategoryCount();
        var categories = variables.categoryModel.getCategory(draw, start, length,searchValue, orderColumn, orderDir, columnMap,totalRecords);
        var data=[];
        for (var i=1; i <=categories.recordCount; i++) {
            var category = {
                "category_id": categories["category_id"][i],
                "name": categories["name"][i],
                "slug": categories["slug"][i]
            };
            // var editAction = "#application.baseURL#?page=edit-category&id=#category.category_id#";
            var actions = "
                <button class='edit-btn' title='Edit User' data-id='#category.category_id#' data-name='#category.name#' data-slug='#category.slug#'>
                    <i class='icon cil-pencil'  data-coreui-target='##categoryForm' data-coreui-toggle='modal'></i>
                </button>
                 <button class='delete-btn' title='Delete' data-id='#category.category_id#'>
                    <i class='icon cil-trash' data-coreui-toggle='modal' data-coreui-target='##categoryDeleteModal'></i>
                </button>
            ";
            arrayAppend(data, { 
                "category_id": category.category_id,
                "name": category.name,
                "slug":category.slug,
                "actions": actions
            });
        }
        writeOutput(serializeJSON({
            "draw": draw,
            "recordsTotal": totalRecords,
             "recordsFiltered": totalRecords,
            "data":data
        }));
      
    }

    function saveCategory(){
        var userData={
            name:structKeyExists(form, "name") ? trim(form.name):"",
            slug:structKeyExists(form, "slug") ? trim(form.slug):""
        };
        if(structKeyExists(form, "categoryId")and len(trim(form.categoryId))){
            userData.categoryId=trim(form.categoryId);
        }
        var response=variables.categoryModel.saveCategory(userData);
        writeOutput(serializeJSON(response));
    }

    function deleteCategory(){
        var result={success:false,"message":""};
        var category_id=form.category_id;
        if(!len(category_id)){
            writeOutput(serializeJSON({"success":false, "message":"category_id is required"}));
            return;
        }
        var categoryQuery=variables.categoryModel.getCategoryById(category_id);
        if(!isQuery(categoryQuery)||categoryQuery.recordCount EQ 0){
            writeOutput(serializeJSON({"success":false, "message":"category not found"}));
            return;
        }

        var deleteQry=queryNew('');
        var deleteQry=queryExecute(
            "delete from categories where category_id=?",
            [
                {value=category_id,cfsqltype="cf_sql_integer"}
            ],
            {datasource=application.datasource}
        );
        result.success=true;
        if(result.success){
            writeOutput(serializeJSON({"success":true,"message":"Category deleted successfully"}));
        }
        else{
            writeOutput(serializeJSON({"success":false,"message":result.message?: "failed to delete category."}));
        }

    }
   
    
</cfscript>