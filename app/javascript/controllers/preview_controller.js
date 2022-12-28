import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['input', 'preview', 'list', 'previous'];

  connect() {
    console.log("test")
    // listen for a change on the upload button when the dashboard opens
    this.inputTarget.addEventListener('change', () => this.displayPreview());
  }

  displayPreview() {
    // check if there is at least one file about to be uploaded
    if (this.inputTarget.files && this.inputTarget.files[0]) {
      // if so, clean up the previous moodboard, the image tag and the list
      // NOTE on the html:
      // 1. the image tag (this.previewTarget) will hold single images you try to upload
      // 2. the ul#preview (this.listTarget) will holds multiple images you try to upload
      // 3. the ul#previous (this.previousTarget) holds the previous moodboard
      this.listTarget.innerHTML = ""
      this.previousTarget.innerHTML = ""
      this.previewTarget.src = ""

      // check if you want to preview single of multiple image
      // and call respective function
      if (this.inputTarget.files.length > 1) {
        this.displayMultiple(this.inputTarget.files)
      } else {
        this.displaySingle(this.inputTarget.files)
        }
      }
    }

  displaySingle(fileList) {
    const reader = new FileReader();
    reader.onload = (event) => {
      this.previewTarget.src = event.currentTarget.result;
    }
    reader.readAsDataURL(fileList[0])
  }

  displayMultiple(fileList) {
    Array.from(fileList).forEach(file => {
      const reader = new FileReader();
      reader.onload = (event) => {
        const picFile = event.target;
        const div = document.createElement("div");
        const image = div.innerHTML = `<li class="item"><img class="thumbnail" src="${picFile.result}" title="${picFile.name}"/></li>`;
        this.listTarget.insertAdjacentHTML("beforeend", image);
      }
      reader.readAsDataURL(file)
     });
  }
}
