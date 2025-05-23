document.addEventListener("DOMContentLoaded", function () {
    const generateButton = document.getElementById("generate-certificate");
    const userId = document.getElementById("userId")?.value;
    const courseId = document.getElementById("courseId")?.value;

    if (!userId || !courseId) {
        Swal.fire({
            icon: 'error',
            title: 'Missing Information',
            text: 'User ID or Course ID is missing!',
        });
        return;
    }

    function generateCertificate() {
        // Disable the button while the certificate is being generated
        generateButton.disabled = true;
        generateButton.textContent = 'Generating...';

        fetch(`/certificate/generate/${userId}/${courseId}`)
            .then(response => response.json())
            .then(data => {
                if (data.file) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Certificate Generated',
                        text: '✅ Certificate generated successfully!',
                    });

                    // Wait 1 second to ensure the file is available before triggering the download
                    setTimeout(() => {
                        const link = document.createElement("a");
                        link.href = data.file;
                        link.download = `Certificate_${userId}_${courseId}.pdf`;  // Custom name for the file
                        document.body.appendChild(link);
                        link.click();
                        document.body.removeChild(link);

                        // Enable the button again after the download
                        generateButton.disabled = false;
                        generateButton.textContent = 'Generate Certificate';
                    }, 1000);
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: '❌ Error generating certificate!',
                    });

                    // Enable the button again if there's an error
                    generateButton.disabled = false;
                    generateButton.textContent = 'Generate Certificate';
                }
            })
            .catch(error => {
                console.error("Error:", error);
                Swal.fire({
                    icon: 'error',
                    title: 'Request Failed',
                    text: '❌ An error occurred while generating the certificate.',
                });

                // Enable the button again after failure
                generateButton.disabled = false;
                generateButton.textContent = 'Generate Certificate';
            });
    }

    if (generateButton) {
        generateButton.addEventListener("click", generateCertificate);
    }
});
