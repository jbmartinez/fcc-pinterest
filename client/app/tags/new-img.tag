<new-img>
  <h2>Add Image</h2>
  <rg-modal modal="{ modalOptions }">
    <form onsubmit="{ submit }">
      <img src="{ url.value }" alt="" />
      <input type="text" name="title" />
      <input type="url" name="url" onkeyup={edit} />
      <!--input type="submit" value="send" /-->
    </form>
  </rg-modal>

  <script>
    var self = this;
    this.submit = function() {
      console.log('saving...');
      var newImg = {title: this.title.value, url: this.url.value};
      RiotControl.trigger('image_add', newImg);
      this.url.value = '';
      this.title.value = '';
      self.modalOptions.visible = false;
    };

    this.edit = function() {
      if (this.url.value !== '') {
        this.update();
      }
    };

    this.modalOptions = {
      heading: 'Modal heading',
      visible: true,
      ghost: false,
      close: false,
      buttons: [
        { action: this.submit, text: 'Save' },
        { action: () => this.modalOptions.visible = false, text: 'Cancel', style: 'color: cornflowerblue;' }
      ],
      onclose: function (e) {}
    };
  </script>
</new-img>