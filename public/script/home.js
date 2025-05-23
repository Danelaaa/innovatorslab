document.addEventListener("DOMContentLoaded", function () {
    // Sidebar Toggle
    const burgerBtn = document.getElementById("burger-btn");
    const sidebar = document.getElementById("sidebar");

    burgerBtn.addEventListener("click", function () {
        console.log("Burger button clicked!");
        sidebar.classList.toggle("active");
        console.log(sidebar.classList);
    });

    // Progress Bar Selection & Step Content Update
    const links = document.querySelectorAll(".progress_bar_div a");
    const contentDiv = document.querySelector(".main_section_div_bottom");

    const stepContents = {
        1: `<div class='step-content'>
                <h4>Teaser - Sport Management</h4>
                <img src="./images/film-and-vid.jpg" alt="">
                <p>Discover the key principles of planning, engaging and leading an organisation or an initiative in the sport sector.</p>
                <span>This includes strategic planning, engagement with stakeholders and best practices in the field.</span>
            </div>
            <div class="quiz_div">
                <h1>Quiz time!</h1>
                <img src="./images/quiz.jpg" alt="">
                <p>Ready for a quiz? Let's dive in with 3 questions and see how you do!</p>
            </div>`,
        2: "<div class='step-content'>Module 2: Getting Started</div>",
        3: "<div class='step-content'>Module 3: Advanced Concepts</div>",
        4: "<div class='step-content'>Module 4: Practical Applications</div>",
        5: "<div class='step-content'>Module 5: Quiz and Exercises</div>",
        6: "<div class='step-content'>Module 6: Review and Recap</div>",
        7: "<div class='step-content'>Module 7: Final Exam and Certification</div>",
    };

    links.forEach(link => {
        link.addEventListener("click", function (event) {
            event.preventDefault(); // Prevent page reload

            // Remove 'selected' class from all links
            links.forEach(l => l.classList.remove("selected"));

            // Add 'selected' class to clicked link
            this.classList.add("selected");

            // Get the selected step number
            const step = this.getAttribute("data-step");

            // Update the content
            contentDiv.innerHTML = stepContents[step] || "<div class='step-content'>No content available.</div>";
        });
    });

    



    var slides = document.querySelectorAll('.slide');
    var btns = document.querySelectorAll('.n_btn');
    let currentSlide = 1;

    // Javascript for image slider manual navigation
    var manualNav = function(manual){
      slides.forEach((slide) => {
        slide.classList.remove('active');

        btns.forEach((btn) => {
          btn.classList.remove('active');
        });
      });

      slides[manual].classList.add('active');
      btns[manual].classList.add('active');
    }

    btns.forEach((btn, currentSlide) => {
      btn.addEventListener("click", () => {
        manualNav(currentSlide);
      });
    });

    // Javascript for image slider autoplay navigation
    var repeat = function(activeClass){
      let active = document.getElementsByClassName('active');
      currentSlide = 1;

      var repeater = () => {
        setTimeout(function(){
          [...active].forEach((activeSlide) => {
            activeSlide.classList.remove('active');
          });

        slides[currentSlide].classList.add('active');
        btns[currentSlide].classList.add('active');
        currentSlide++;

        if(slides.length == currentSlide){
          currentSlide = 0;
        }
        if(currentSlide >= slides.length){
          return;
        }
        repeater();
      }, 10000);
      }
      repeater();
    }
    repeat();
});




// Function to get logged-in user ID (you need to implement this based on your session handling)
function getLoggedInUserId() {
    // Example user ID
    return 1; // Replace this with actual logic to get the logged-in user's ID
}





