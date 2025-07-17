<cfif structKeyExists(url, "method")>
    <cfsetting enablecfoutputonly="true" />
    <cfsetting showDebugOutput="false">
</cfif>

<cfscript>
    variables.TagModel=createObject("component",application.baseUrl & "models.TagModel");
    if (structKeyExists(url, "method")){
        switch(url.method){
            case "get-Tags":
                getTags();
                break;
            case "save-Tags":
                saveTags();
                break;
            case "delete-Tag":
                deleteTag();
                break;
            default:
                writeOutput(serializeJSON({"success":false,"message":"unkknown method" &url.method}));
                break;
        }
    }

    function getTags(){
        var draw = structKeyExists(url, "draw") ? url.draw : 0;
        var start= structKeyExists(url, "start") ? url.start : 0;
        var length=structKeyExists(url, "length") ? url.length : 8;
        var searchValue = structKeyExists(url, "search[value]") ? url["search[value]"] : "";
        var orderColumnIndex = structKeyExists(url, "order[0][column]") ? url["order[0][column]"] : "0";
        var orderDir = structKeyExists(url, "order[0][dir]") ? url["order[0][dir]"] : "asc";
        var columnMap = ["tag_id","slug"];
        var orderColumn = columnMap[orderColumnIndex +1];
        var totalRecords = variables.TagModel.getTotalTagsCount();
        var Tags = variables.TagModel.getTags(draw, start, length,searchValue, orderColumn, orderDir, columnMap,totalRecords);
        var data=[];
        for (var i=1; i <=Tags.recordCount; i++) {
            var Tag = {
                "tag_id": Tags["tag_id"][i],
                "slug": Tags["slug"][i]
            };
            var actions = "
                <button class='edit-btn' title='Edit User' data-id='#Tag.tag_id#' data-slug='#Tag.slug#'>
                    <i class='icon cil-pencil'  data-coreui-target='##tagForm' data-coreui-toggle='modal'></i>
                </button>
                 <button class='delete-btn' title='Delete' data-id='#Tag.tag_id#'>
                    <i class='icon cil-trash' data-coreui-toggle='modal' data-coreui-target='##TagDeleteModal'></i>
                </button>
            ";
            arrayAppend(data, { 
                "tag_id": Tag.tag_id,
                "slug":Tag.slug,
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

    function saveTags(){
        var TagData={
            tags: structKeyExists(form, "tags") ? listToArray(form.tags) : []
        };
        
        if(structKeyExists(form, "tagId")and len(trim(form.tagId))){
            TagData.tagId=trim(form.tagId);
        }
        var response=variables.TagModel.saveTags(TagData);
        writeOutput(serializeJSON(response));
    }



    function deleteTag(){
        var result={success:false,"message":""};
        var tag_id=form.tag_id;
        if(!len(tag_id)){
            writeOutput(serializeJSON({"success":false, "message":"tag_id is required"}));
            return;
        }
        var tagQuery=variables.TagModel.getTagById(tag_id);
        if(!isQuery(tagQuery)||tagQuery.recordCount EQ 0){
            writeOutput(serializeJSON({"success":false, "message":"tag not found"}));
            return;
        }

        var deleteQry=queryNew('');
        var deleteQry=queryExecute(
            "delete from tags where tag_id=?",
            [
                {value=tag_id,cfsqltype="cf_sql_integer"}
            ],
            {datasource=application.datasource}
        );
        result.success=true;
        if(result.success){
            writeOutput(serializeJSON({"success":true,"message":"tag deleted successfully"}));
        }
        else{
            writeOutput(serializeJSON({"success":false,"message":result.message?: "failed to delete tag."}));
        }

    }

</cfscript>