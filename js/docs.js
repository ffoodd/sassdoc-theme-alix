// Quand le DOM a fini de charger
document.addEventListener("DOMContentLoaded", function() {
  // On bricole pour afficher l'ancre active dans le sommaire
  document.getElementById("toc").addEventListener("click", function(e) {
    var $link = e.target;
    var $active = document.querySelector(".active-test");

    if( $active ) {
      $active.removeAttribute("class");
    }

    if( $link.tagName.toLowerCase() === "a" ) {
      $link.classList.add("active-test");
    }
  });

  // On fait pareil au chargement
  function activeAnchor() {
    var $currentHref = document.getElementById("toc").getElementsByTagName("a");
    var $length = $currentHref.length;
    var i = 0;
    for(;i<$length;i++) {
      if(document.location.href.indexOf($currentHref[i].href)>=0) {
        $currentHref[i].classList.add("active-test");
      }
    }
  }

  activeAnchor();
});