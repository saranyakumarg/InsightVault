<cfoutput>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-coreui-backdrop="static" data-coreui-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">User</h5>
        <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modal_body">
          Please click confirm to continue the process you have selected.
      </div>
      <input type="hidden" id="user_id" name="user_id" value=""/>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="modalConfirm">Confirm</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="categoryDeleteModal" data-coreui-backdrop="static" data-coreui-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="categoryDeleteModalLabel">Category</h5>
        <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modal_body">
          Please click confirm to delete selected category.
      </div>
      <input type="hidden" id="category_id" name="category_id" value=""/>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="categorymodalConfirm">Confirm</button>
      </div>
    </div>
  </div>
</div>
</cfoutput>