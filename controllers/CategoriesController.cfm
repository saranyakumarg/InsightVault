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
            var editAction = "#application.baseURL#?page=edit-category&id=#category.category_id#";
            var actions = "
                <button class='delete-btn' title='Delete' onclick=""confirmModal('delete', #category.category_id#)"">
                    <i class='icon cil-trash' data-coreui-toggle='modal' data-coreui-target='##staticBackdrop'></i>
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
</cfscript>