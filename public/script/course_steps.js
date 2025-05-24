document.addEventListener("DOMContentLoaded", async function () {
  await fetchCourseResources();
});

async function fetchCourseResources() {
  try {
    const response = await fetch("/course-resources");
    const data = await response.json();

    populateSelect("presentationSelect", data.presentations);
    populateSelect("quizSelect", data.quizzes);
    populateCourseSteps(data.course_steps);
  } catch (error) {
    console.error("Error fetching course resources:", error);
  }
}

function populateSelect(elementId, items) {
  const select = document.getElementById(elementId);
  select.innerHTML = "";
  items.forEach((item) => {
    const option = document.createElement("option");
    option.value = item.id;
    option.textContent = item.title;
    select.appendChild(option);
  });
}

function populateCourseSteps(courseSteps) {
  const tableBody = document.querySelector("#courseStepsTable tbody");
  tableBody.innerHTML = "";

  courseSteps.forEach((step) => {
    const row = tableBody.insertRow();
    row.dataset.id = step.id;

    row.innerHTML = `
            <td>${step.step_number}</td>
            <td>${step.presentation_title || "N/A"}</td>
            <td>${step.language_name || "N/A"}</td>
            <td>${step.quiz_title || "N/A"}</td>
            <td>
                <button class="delete-btn" onclick="deleteCourseStep(${
                  step.id
                })">🗑 Delete</button>
            </td>
        `;
  });
}

// Add Course Step
document
  .getElementById("courseStepForm")
  .addEventListener("submit", async function (e) {
    e.preventDefault();

    const course_id = 1;
    const step_number = document.getElementById("stepNumber").value;
    const presentation_id = document.getElementById("presentationSelect").value;
    const language_id = document.getElementById("languageSelect").value;
    const quiz_id = document.getElementById("quizSelect").value;

    try {
      const response = await fetch("/api/course-steps", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          course_id,
          step_number,
          presentation_id,
          language_id,
          quiz_id,
        }),
      });

      const data = await response.json();
      alert(data.message);
      await fetchCourseResources();

      // Reset form
      document.getElementById("courseStepForm").reset();
    } catch (error) {
      console.error("Error adding course step:", error);
    }
  });

// Delete Course Step
async function deleteCourseStep(stepId) {
  if (!confirm("Are you sure you want to delete this course step?")) return;

  try {
    const response = await fetch(`/api/course-steps/${stepId}`, {
      method: "DELETE",
    });

    const data = await response.json();
    alert(data.message);
    await fetchCourseResources();
  } catch (error) {
    console.error("Error deleting course step:", error);
  }
}
