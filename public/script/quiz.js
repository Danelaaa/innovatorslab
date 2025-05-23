document.addEventListener("DOMContentLoaded", async () => {
    try {
        // ✅ Fetch user data
        const response = await fetch('/api/user', {
            method: 'GET',
            credentials: 'include',
            headers: { 'Content-Type': 'application/json' }
        });

        if (!response.ok) throw new Error("Unauthorized: Invalid token");

        const data = await response.json();
        if (!data.userId && !data.id) throw new Error("User ID not found. Please log in.");

        const userId = data.userId || data.id;
        console.log('✅ User ID:', userId);

        // ✅ Store userId in form data attribute
        const quizForm = document.getElementById('quizForm');
        if (!quizForm) throw new Error("Quiz form not found.");

        quizForm.dataset.userId = userId;
        document.getElementById('debugUserId').textContent = userId; // Debugging

        // ✅ Get quiz and course IDs
        const quizId = quizForm.dataset.quizId;
        const courseId = quizForm.dataset.courseId;
        if (!quizId || !courseId) throw new Error("Quiz ID or Course ID missing.");

        console.log("✅ Quiz ID:", quizId);
        console.log("✅ Course ID:", courseId);

        // ✅ Add event listener for form submission
        quizForm.addEventListener("submit", async function (event) {
            event.preventDefault();

            const answers = {};
            document.querySelectorAll(".question").forEach(question => {
                const questionId = question.dataset.questionId;
                const selectedAnswer = question.querySelector("input:checked");
                if (selectedAnswer) {
                    answers[questionId] = selectedAnswer.value;
                }
            });

            if (Object.keys(answers).length === 0) {
                alert("⚠ Please select at least one answer.");
                return;
            }

            try {
                // ✅ Submit quiz answers
                const submitResponse = await fetch("/quiz/submit", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ user_id: userId, quiz_id: quizId, answers, course_id: courseId })
                });

                const result = await submitResponse.json();

                if (result.error) {
                    alert("❌ " + result.error);
                } else {
                    alert(`✅ Quiz submitted successfully! Your score: ${result.score}`);
                    window.location.href = `/mycourse/mycourse`;
                }
            } catch (error) {
                console.error("❌ Error submitting quiz:", error);
                alert("❌ Error submitting quiz. Please try again.");
            }
        });

    } catch (error) {
        console.error('❌ Error fetching user data:', error.message);
        alert("User ID not found. Please log in.");
        
    }
});
