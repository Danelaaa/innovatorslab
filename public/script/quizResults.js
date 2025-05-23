document.addEventListener('DOMContentLoaded', () => {
    const container = document.getElementById('quizResultsContainer');
    if (!container) {
        console.error("Error: Element with ID 'quizResultsContainer' not found.");
        return;
    }
    
    fetchQuizResults(4, 1); // Fetch results when the page loads
});

async function fetchQuizResults(userId, quizId) {
    const container = document.getElementById('quizResultsContainer');
    if (!container) return;

    container.innerHTML = '<p>Loading quiz results...</p>';

    try {
        const response = await fetch(`/api/user-quiz-results/${encodeURIComponent(userId)}/${encodeURIComponent(quizId)}`, {
            method: 'GET',
            credentials: 'include',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        });

        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`Server Error: ${response.status} - ${errorText}`);
        }

        const data = await response.json();
        displayResults(data);
    } catch (error) {
        console.error('Error fetching quiz results:', error);
        container.innerHTML = `<p style="color: red;">Failed to load quiz results. ${error.message}</p>`;
    }
}


function displayResults(results) {
    const container = document.getElementById('quizResultsContainer');
    if (!container) return;

    container.innerHTML = ''; // Clear old results

    if (!results.length) {
        container.innerHTML = '<p>No results found.</p>';
        return;
    }

    results.forEach((result, index) => {
        const div = document.createElement('div');
        div.classList.add('quiz-result'); // Add a class for styling
        div.innerHTML = `
            <h4>Question ${index + 1}:</h4>
            <p><strong>Question:</strong> ${result.question_text}</p>
            <p><strong>Selected Answer:</strong> ${result.selected_answer}</p>
            <p><strong>Correct:</strong> ${result.is_correct ? '✅ Yes' : '❌ No'}</p>
            <hr>
        `;
        container.appendChild(div);
    });
}
