<!-- Modal -->
<div class="modal fade" id="categoryForm" data-coreui-backdrop="static" data-coreui-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Category</h5>
        <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="categoryFormElement">
          <input type="hidden" name="category_id" id="category_id" value="">
            <div class="mb-3">
                <div class="row mb-3">
                    <label for="name" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="name">
                        <div id="validationError" class="invalid-feedback">
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="slug" class="col-sm-2 col-form-label">Slug</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="slug" name="slug" readonly>
                        <div class="form-text">Slug will be auto-generated from the name</div>
                    </div>
                </div>
            </div>
      </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" id="closeBtn" data-coreui-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary" id="liveToastBtn">Confirm</button>
          </div>
        </form>
    </div>
  </div>
</div>