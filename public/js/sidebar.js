// Botão de expandir sidebar
const expand_btn = document.querySelector(".expand-btn");
if (expand_btn) {
  expand_btn.addEventListener("click", () => {
    document.body.classList.toggle("collapsed");
  });
}

// Marcar link ativo com base no clique
const allLinks = document.querySelectorAll(".sidebar-links a");
if (allLinks.length > 0) {
  allLinks.forEach((elem) => {
    elem.addEventListener("click", function () {
      const hrefLinkClick = elem.href;

      allLinks.forEach((link) => {
        if (link.href === hrefLinkClick) {
          link.classList.add("active");
        } else {
          link.classList.remove("active");
        }
      });
    });
  });
}

// Campo de busca
const searchInput = document.querySelector(".search__wrapper input");
if (searchInput) {
  searchInput.addEventListener("focus", () => {
    document.body.classList.remove("collapsed");
  });
}
