document.addEventListener("DOMContentLoaded", function () {
    const links = document.querySelectorAll(".progress_bar_div a");
    const contentDiv = document.querySelector(".main_section_div_bottom");

    if (!contentDiv) {
        console.error("❌ Element '.main_section_div_bottom' not found.");
        return;
    }

    links.forEach(link => {
        link.addEventListener("click", function (event) {
            event.preventDefault();

            links.forEach(l => l.classList.remove("selected"));
            this.classList.add("selected");

            const stepNumber = this.dataset.step;
            const quizId = this.dataset.quizId;
            const quizTitle = this.dataset.quizTitle;

            const select = document.getElementById(`language-select-${stepNumber}`);
            const pdfLink = document.getElementById(`pdf-link-${stepNumber}`);

            // Clear existing options
            select.innerHTML = `<option value="">--Select Language--</option>`;
            pdfLink.style.display = "none";

            // Populate new language options
            if (presentationFiles[stepNumber]) {
                Object.entries(presentationFiles[stepNumber]).forEach(([lang, filePath]) => {
                    const option = document.createElement("option");
                    option.value = filePath;
                    option.textContent = lang.toUpperCase();
                    select.appendChild(option);
                });

                select.addEventListener("change", function () {
                    const selectedFile = this.value;
                    if (selectedFile) {
                        pdfLink.href = selectedFile;
                        pdfLink.style.display = "inline-block";
                    } else {
                        pdfLink.style.display = "none";
                    }
                });
            }

            const quizHTML = quizId
                ? `<a href="/take-quiz/${quizId}" class="quiz-link">${quizTitle}</a>`
                : "<p>No quiz available.</p>";

            contentDiv.innerHTML = `
                <div class='step-content'>
                    <h4>Presentation</h4>
                    <img src="/images/film-and-vid.jpg" alt="">
                    <p>Select a language to view the presentation PDF.</p>
                </div>
                <div class="quiz_div">
                    <h1>Quiz</h1>
                    <img src="/images/quiz.jpg" alt="">
                    ${quizHTML}
                </div>`;
        });
    });
});
