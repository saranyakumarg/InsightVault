<!-- Modal -->
<div class="modal fade" id="tagForm" data-coreui-backdrop="static" data-coreui-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Tag</h5>
        <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="tagFormElement">
        <input type="hidden" name="tag_id" id="tag_id" value="">
          <div class="mb-3">
            <label for="tags" class="form-label">Tags</label>
            <input type="text" class="form-control" id="tags" name="tags">
            <div id="validationError" class="invalid-feedback"> </div>
            <div class="form-text">Type and press comma to create a tag</div>
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
