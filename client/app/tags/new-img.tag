<new-img>
  <h2>Add Image</h2>
  <form onsubmit="{ submit }">
    <img src="{ url.value }" alt="" />
    <input type="text" name="title" />
    <input type="url" name="url" onkeyup={edit} />
    <input type="submit" value="send" />
  </form>

  <script>
    this.submit = function() {
      var newImg = {title: this.title.value, url: this.url.value};
      RiotControl.trigger('image_add', newImg);
      this.url.value = '';
      this.title.value = '';
    };

    this.edit = function() {
      if (this.url.value !== '') {
        this.update();
      }
    };
  </script>
</new-img>