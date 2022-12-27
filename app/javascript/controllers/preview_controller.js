import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['input', 'preview', 'list', 'previous'];

  connect() {
    this.inputTarget.addEventListener('change', () => this.displayPreview());
  }

  displayPreview() {
    console.log("test")
    if (this.inputTarget.files && this.inputTarget.files[0]) {
      if (this.inputTarget.files.length > 1) {
        // cleanup the list
        this.listTarget.innerHTML = ""
        this.displayMultiple(this.inputTarget.files)
      } else {
        const reader = new FileReader();
        reader.onload = (event) => {
          this.previewTarget.src = event.currentTarget.result;
        }
        reader.readAsDataURL(this.inputTarget.files[0])
        this.previewTarget.classList.remove('hidden');
        if (this.previousTarget) {
          console.log("inside single if statement")
          this.previousTarget.innerHTML = "";
        }
      }
      }
    }

  displayMultiple(fileList) {

    Array.from(fileList).forEach(file => {
      const reader = new FileReader();
      reader.onload = (event) => {
        const picFile = event.target;
        const div = document.createElement("div");
        const image = div.innerHTML = `<li class="item"><img class="thumbnail" src="${picFile.result}" title="${picFile.name}"/></li>`;
        // console.log(image)
        // console.log(this.listTarget)
        this.previewTarget.classList.remove('hidden');
        // this.previousTarget ? this.previousTarget.innerHTML = "" : continue
        if (this.previousTarget) {
          console.log("inside if statement")
          this.previousTarget.innerHTML = "";
        }
        this.previewTarget.src = ""
        this.listTarget.insertAdjacentHTML("beforeend", image);
      }
      reader.readAsDataURL(file)
      console.log("in displayMultiple")
     });
  }
}
