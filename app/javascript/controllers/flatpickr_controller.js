import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    new flatpickr(this.element, {
      enableTime: true,
      dateFormat: "d F Y, H:S"
      // more options available on the documentation!
    });
  }
}
