var sidebar = document.querySelector('.sidebar');

window.addEventListener('scroll', function() {
    var scrollTop = window.scrollY || window.pageYOffset;
    var moveDistance = scrollTop / 2; 

    sidebar.style.top = moveDistance + 'px';
});
