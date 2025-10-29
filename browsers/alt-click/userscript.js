(function () {
  "use strict";

  document.addEventListener("click", (e) => {
    // not clicked on anchor tag
    const closestAnchor = e.target?.closest("a");
    if (!closestAnchor) {
      return;
    }
    // not clicked on alt or option key
    console.log(e);
    if (!e.altKey) {
      return;
    }

    // disable the "alt/option + click" download shortcut combo
    e.preventDefault();
    
    // Simulate Ctrl+Shift+Click on the temporary link (opens in background)
    const backgroundClick = new MouseEvent('click', {
      bubbles: true,
      cancelable: true,
      ctrlKey: true,
      shiftKey: true,
      metaKey: false,
      button: 0,
      view: window
    });
    
    e.target.dispatchEvent(backgroundClick);
  });
})();