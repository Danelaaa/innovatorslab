document.addEventListener("DOMContentLoaded", function () {
    fetch('/api/statistics')
        .then(response => response.json())
        .then(data => {
            document.getElementById('total_users').innerText = data.total_users || 0;
            document.getElementById('new_users_this_month').innerText = data.new_users_this_month || 0;
            document.getElementById('total_courses').innerText = data.total_courses || 0;
            document.getElementById('total_certifications').innerText = data.total_certifications || 0;
            document.getElementById('total_quizzes').innerText = data.total_quizzes || 0;
            document.getElementById('quiz_passed').innerText = data.quiz_passed || 0;
            document.getElementById('quiz_failed').innerText = data.quiz_failed || 0;
            document.getElementById('most_popular_quiz').innerText = data.most_popular_quiz || "N/A";

            document.getElementById('top_scorer_avg_score').innerText = 
                !isNaN(data.top_scorer_avg_score) 
                ? parseFloat(data.top_scorer_avg_score).toFixed(2) 
                : "N/A";

            // ✅ Debugging: Check if quiz titles exist
            // console.log("Top quizzes data:", data.top_quizzes);

            if (data.user_growth && data.user_growth.months.length > 0) {
                new Chart(document.getElementById('userGrowthChart').getContext('2d'), {
                    type: 'line',
                    data: {
                        labels: data.user_growth.months,
                        datasets: [{
                            label: "New Users",
                            data: data.user_growth.counts,
                            borderColor: "#3e95cd",
                            fill: false
                        }]
                    },
                    options: { responsive: true, plugins: { legend: { position: 'top' } } }
                });
            }

            // Quiz Performance (Passed vs Failed)
            if (data.quiz_performance && data.quiz_performance.months.length > 0) {
                new Chart(document.getElementById('quizChart').getContext('2d'), {
                    type: 'bar',
                    data: {
                        labels: data.quiz_performance.months,
                        datasets: [
                            {
                                label: "Passed Quizzes",
                                data: data.quiz_performance.passed,
                                backgroundColor: "green"
                            },
                            {
                                label: "Failed Quizzes",
                                data: data.quiz_performance.failed,
                                backgroundColor: "red"
                            }
                        ]
                    },
                    options: { responsive: true, plugins: { legend: { position: 'top' } } }
                });
            }

            // ✅ Fixed: Top Performing Quizzes (Use Quiz Title Instead of ID)
            if (Array.isArray(data.top_quizzes) && data.top_quizzes.length > 0) {
                new Chart(document.getElementById('topQuizChart').getContext('2d'), {
                    type: 'pie',
                    data: {
                        labels: data.top_quizzes.map(q => q.quiz_name || "Unknown Quiz"), // Fix undefined quiz names
                        datasets: [{
                            data: data.top_quizzes.map(q => q.attempts || 0),
                            backgroundColor: ["#FF6384", "#36A2EB", "#FFCE56", "#4CAF50", "#FF9800"]
                        }]
                    },
                    options: { responsive: true, plugins: { legend: { position: 'right' } } }
                });
            } else {
                console.warn("No top quizzes data available or incorrect format.");
            }

        })
        .catch(error => console.error('Error fetching statistics:', error));
});
