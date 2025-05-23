document.addEventListener('DOMContentLoaded', () => {
    fetchQuizzes();
});

async function fetchQuizzes() {
    const quizListContainer = document.getElementById('quizList');
    if (!quizListContainer) {
        console.error("Error: Element with ID 'quizList' not found.");
        return;
    }

    try {
        const response = await fetch('/quizzes', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        });

        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`Server Error: ${response.status} - ${errorText}`);
        }

        const quizzes = await response.json();
        displayQuizzes(quizzes);
    } catch (error) {
        console.error('Error fetching quizzes:', error);
        quizListContainer.innerHTML = `<p style="color: red;">Failed to load quizzes. ${error.message}</p>`;
    }
}

function displayQuizzes(quizzes) {
    const quizListContainer = document.getElementById('quizList');
    if (!quizListContainer) return;

    quizListContainer.innerHTML = ''; // Clear old content

    if (quizzes.length === 0) {
        quizListContainer.innerHTML = '<p>No quizzes found.</p>';
        return;
    }

    quizzes.forEach(quiz => {
        const listItem = document.createElement('li');
        listItem.innerHTML = `
            <strong>${quiz.title}</strong>
            <a href="/take-quiz/${quiz.id}" class="take-quiz-btn">Take Quiz</a>
            <button class="delete-quiz-btn" data-id="${quiz.id}">Delete</button>
        `;
        quizListContainer.appendChild(listItem);
    });

    // Attach delete button event listeners
    document.querySelectorAll('.delete-quiz-btn').forEach(button => {
        button.addEventListener('click', (event) => {
            const quizId = event.target.getAttribute('data-id');
            deleteQuiz(quizId);
        });
    });
}

async function deleteQuiz(quizId) {
    const quizListContainer = document.getElementById('quizList');

    try {
        const response = await fetch(`/quiz/${quizId}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            }
        });

        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`Server Error: ${response.status} - ${errorText}`);
        }

        const data = await response.json();
        console.log(data.message); // Log the success message
        fetchQuizzes(); // Refresh the quiz list
    } catch (error) {
        console.error('Error deleting quiz:', error);
        quizListContainer.innerHTML = `<p style="color: red;">Failed to delete quiz. ${error.message}</p>`;
    }
}
