import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkins"
export default class extends Controller {
  checked(e) {
      const id = e.target.dataset.id
      const csrfToken = document.querySelector("[name='csrf-token']").content

      fetch(`/checkins/${id}/checked`, {
        method: 'PATCH',
        mode: 'cors',
        cache: 'no-cache',
        credentials: 'same-origin',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': csrfToken
        },
        body: JSON.stringify({ ckecked: e.target.checked })
      })
      .then(response => response.json())
      .then(data => {
        alert(data.message)
      })
  }
}
