<new-img>
  <h4>Add an Image</h4>
  <button class="button-primary" onclick="{ showDialog }">add</button>
  <hr>

  <rg-modal modal="{ modalOptions }">
    <form onsubmit="{ submit }">
      <div class="row">
        <img src="{ url.value }" alt="" />
        <label for="title">Title</label>
        <input class="u-full-width" type="text" name="title" />
        <label for="url">Url</label>
        <input class="u-full-width" type="url" name="url" oninput={ edit } required />
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
  </style>

  <script>
    var self = this;

    this.submit = function() {
      if (this.url.checkValidity() === false) {
        return false;
      }
      var newImg = {
        title: this.title.value,
        url: this.url.value,
        owner: self.opts.userid
      };
      console.log('shouldinsert', self.opts.notinsert);
      RiotControl.trigger('image_add', newImg, self.opts.notinsert);
      this.url.value = '';
      this.title.value = '';
      self.modalOptions.visible = false;
    };

    this.edit = function() {
      console.log('changed!');
      if (this.url.value !== '') {
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