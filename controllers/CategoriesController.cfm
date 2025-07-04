<cfif structKeyExists(url, "method")>
    <cfsetting enablecfoutputonly="true" />
    <cfsetting showDebugOutput="false">
</cfif>
<cfscript>

    //get category model
    variables.categoryModel = createObject("component", application.baseURL & "models.CategoryModel");
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
        var draw=url.draw;
        var start=url.start;
        var length=url.length;
        var searchValue = structKeyExists(url, "search[value]") ? url["search[value]"] : "";
        var orderColumnIndex = structKeyExists(url, "order[0][column]") ? url["order[0][column]"] : "0";
        var orderDir = structKeyExists(url, "order[0][dir]") ? url["order[0][dir]"] : "asc";
        var columnMap = ["category_id", "name", "slug"];
        var orderColumn = columnMap[orderColumnIndex +1];
        var totalRecords = variables.categoryModal.getTotalCategoryCount(session.admin.category_id);
        var categories = variables.categoryModel.getCategory(draw, start, length,searchValue, orderColumn, orderDir, columnMap,totalRecords, session.admin.category_id);
        var data=[];
        for (var i=1; i <=categories.recordCount; i++) {
            var actions=""
            var category = {
                "category_id": categories["category_id"][i],
                "name": categories["name"][i],
                "slug": categories["slug"][i],
            };
            var actions=categories["name"][i];
            arrayAppend(data, {
                "category_id": category.category_id,
                "name": category.name,
                "slug":category.slug,
                "actions":actions
        
            });
        }
        writeOutput(serializeJSON({
            "draw": draw,
            "recordsTotal": totalRecords,
            "data":data
        }));
      
    }
</cfscript>