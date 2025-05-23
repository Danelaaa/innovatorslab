document.addEventListener('DOMContentLoaded', function() {
    const burgerBtn = document.getElementById('burger-btn');
    const sidebar = document.getElementById('sidebar');

    burgerBtn.addEventListener('click', function() {
        console.log("Burger button clicked!");
        sidebar.classList.toggle('active');
        console.log(sidebar.classList);
    });
    // document.getElementById("language-select").addEventListener("change", function () {
    //    const dd =  window.location.href = "/change-language/" + this.value; 
    //    console.log(dd)
    // });
});