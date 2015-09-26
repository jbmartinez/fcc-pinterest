<new-img>
  <h4>Add an Image</h4>
  <button class="button-primary" onclick="{ showDialog }">add</button>
  <hr>

  <rg-modal modal="{ modalOptions }">
    <form onsubmit="{ this.parent.submit }">
      <div class="row">
        <div class="preview">
          <img src="{ this.parent.imgUrl }" alt="" />
        </div>
        <label for="title">Title</label>
        <input class="u-full-width" type="text" name="title" />
        <label for="url">Url</label>
        <input class="u-full-width" type="url" name="url" oninput="{ this.parent.change }" required />
      </div>
    </form>
  </rg-modal>

  <style scoped>
    h4 {
      margin-top: 3rem;
      margin-right: 2rem;
      display: inline-block;
    }
    form {
      margin-top: 3rem;
    }
    form img {
      max-height: 150px;
      max-width: 100%;
      display: block;
      margin: 0 auto;
    }
    .preview {
      display: block;
      height: 150px;
      width: 100%;
    }
  </style>

  <script>
    var self = this;
    self.imgUrl = '';

    this.submit = function() {
      if (this.url.checkValidity() === false) {
        return false;
      }
      var newImg = {
        title: this.title.value,
        url: this.url.value,
        owner: self.opts.userid
      };
      RiotControl.trigger('image_add', newImg, self.opts.notinsert);
      this.url.value = '';
      this.title.value = '';
      self.imgUrl = '';
      self.modalOptions.visible = false;
    };

    this.change = function() {
      if (this.url.value !== '') {
        self.imgUrl = this.url.value;
        this.update();
      }
    };

    this.modalOptions = {
      heading: 'Add an Image',
      visible: false,
      ghost: false,
      close: false,
      buttons: [
        { action: this.submit, text: 'Save', 'class': 'button-primary' },
        { action: function() {self.modalOptions.visible = false; }, text: 'Cancel', type:'submit' }
      ],
      onclose: function (e) {}
    };
    
    this.showDialog = function() {
      this.modalOptions.visible = true;
      this.update();
    };
  </script>
</new-img>