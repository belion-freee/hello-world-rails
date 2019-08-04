$(() => {
    const swal = require('sweetalert2');

    // tweet
    $("a[data-method='delete']").on("click", (e) => {
      e.preventDefault();
      e.stopPropagation();

      const data = e.currentTarget.dataset

      swalDelete(data);
    });

    function swalDelete(data) {
      swal({
        title: "Delete Content",
        text: data.confirm,
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sure',
        cancelButtonText:  'No!',
        animation: false,
        customClass: 'animated bounceIn',
      }).then((result) => {
        if (result.value) {
          fetch(data.url + ".json", {
            method: "DELETE",
            headers: {
              'content-type': 'application/json',
              'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
            }
          }).then(() => {
            swal(
              { type: 'success', title: 'Deleted successfully!'}
            ).then(() => {
              location.reload();
            });
          });
        }
      }, (dismiss) => {})
    }
});
