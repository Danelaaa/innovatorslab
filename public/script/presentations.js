document.addEventListener("DOMContentLoaded", () => {
    const editButtons = document.querySelectorAll(".edit-btn");
    const editFormContainer = document.getElementById("edit-form-container");

    editButtons.forEach((button) => {
        button.addEventListener("click", () => {
            const id = button.getAttribute("data-id");
            const title = button.getAttribute("data-title");
            const language = button.getAttribute("data-language");

            // Set values in the form
            document.getElementById("edit-id").value = id;
            document.getElementById("edit-title").value = title;
            document.getElementById("edit-language").value = language;

            editFormContainer.style.display = "block";
        });
    });

    // Show/hide upload form
    const showFormBtn = document.getElementById("show-upload-form-btn");
    const uploadForm = document.getElementById("upload-form-container");

    showFormBtn.addEventListener("click", () => {
        uploadForm.style.display = uploadForm.style.display === "block" ? "none" : "block";
    });
});
