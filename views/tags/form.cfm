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
            <input type="text" class="form-control" id="tags" name="tags" style="display:none;">
            <input type="text" class="form-control" id="update_tag" name="tags"  style="display:none;">
            <div id="tag-container"></div>
            <div id="validationError" class="invalid-feedback"> </div>
            <span class="badge"></span>
            <div class="form-text comment">Type and press comma to create a tag</div>
          </div>
      </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" id="closeBtn" data-coreui-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Confirm</button>
          </div>
        </form>
      </div>
  </div>
</div>
