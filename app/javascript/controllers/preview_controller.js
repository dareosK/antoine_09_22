import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['input', 'preview', 'list'];

  connect() {
    this.inputTarget.addEventListener('change', () => this.displayPreview());
  }

  displayPreview() {
    console.log("t")
    if (this.inputTarget.files && this.inputTarget.files[0]) {
      if (this.inputTarget.files.length > 1) {
        this.displayMultiple(this.inputTarget.files)
      } else if (this.inputTarget.files > 1) {
        this.displayMultiple()
      } else {
        const reader = new FileReader();
        reader.onload = (event) => {
          this.previewTarget.src = event.currentTarget.result;
        }
        reader.readAsDataURL(this.inputTarget.files[0])
        this.previewTarget.classList.remove('hidden');
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
        console.log(image)
        console.log(this.listTarget)
        this.listTarget.insertAdjacentHTML("beforeend", image);
      }
      reader.readAsDataURL(file)
      console.log("in displayMultiple")
        // this.listTarget.classList.remove('hidden');
     });
  }
}

// document.querySelector("#files").addEventListener("change", (e) => { //CHANGE EVENT FOR UPLOADING PHOTOS
//   if (window.File && window.FileReader && window.FileList && window.Blob) { //CHECK IF FILE API IS SUPPORTED
//     const files = e.target.files; //FILE LIST OBJECT CONTAINING UPLOADED FILES
//     const output = document.querySelector("#result");
//     output.innerHTML = "";
//     for (let i = 0; i < files.length; i++) { // LOOP THROUGH THE FILE LIST OBJECT
//         if (!files[i].type.match("image")) continue; // ONLY PHOTOS (SKIP CURRENT ITERATION IF NOT A PHOTO)
//         const picReader = new FileReader(); // RETRIEVE DATA URI
//         picReader.addEventListener("load", function (event) { // LOAD EVENT FOR DISPLAYING PHOTOS
//           const picFile = event.target;
//           const div = document.createElement("div");
//           div.innerHTML = `<img class="thumbnail" src="${picFile.result}" title="${picFile.name}"/>`;
//           output.appendChild(div);
//         });
//         picReader.readAsDataURL(files[i]); //READ THE IMAGE
//     }
//   } else {
//     alert("Your browser does not support File API");
//   }
// });
