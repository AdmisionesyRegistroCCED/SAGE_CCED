document.getElementById('menuToggle').addEventListener('click', function () {
    var leftMenu = document.getElementById('lftmenu');
    var mainContent = document.querySelector('.main');
    //var footer = document.getElementById('footer');
    var formatDiv = document.getElementById('format');

    leftMenu.classList.toggle('collapsed');
    mainContent.classList.toggle('expanded');
    formatDiv.classList.toggle('expanded');
});


document.getElementById('dropdownToggle').addEventListener('click', function () {
    document.getElementById('dropdownMenu').classList.toggle('show');
});
