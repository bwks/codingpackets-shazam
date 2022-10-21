/**
 * Original inspiration from Light Switch @version v0.1.3 at https://github.com/han109k/light-switch-bootstrap
 * Thank you beautiful stranger
 * Customized to suit codingpackets.com
*/


(function () {

  let lightSwitch = document.getElementById("light-switch");
  if (!lightSwitch) {
    return;
  }

  /**
   * @function darkmode
   * @summary: changes the theme to 'dark mode' and save settings to local stroage.
   * Basically, replaces/toggles every CSS class that has '-lightmode' class with '-darkmode'
   */
  function darkMode() {
    // for (selector of selectors) {
    //   document.querySelectorAll(`${selector}-lightmode`).forEach((element) => {
    //     element.className = element.className.replace(/-lightmode/g, "-darkmode");
    //   });
    // }
    // set light switch input to true
    if (!lightSwitch.checked) {
      lightSwitch.checked = true;
    }
    document.documentElement.classList.add("dark");
    localStorage.setItem("light-switch", "dark");
  }

  /**
   * @function lightmode
   * @summary: changes the theme to 'light mode' and save settings to local stroage.
   */
  function lightMode() {
    // for (selector of selectors) {
    //   document.querySelectorAll(`${selector}-darkmode`).forEach((element) => {
    //     element.className = element.className.replace(/-darkmode/g, "-lightmode");
    //   });
    // }
    if (lightSwitch.checked) {
      lightSwitch.checked = false;
    }
    document.documentElement.classList.remove("dark");
    localStorage.setItem("light-switch", "light");
  }

  /**
   * @function onToggleMode
   * @summary: the event handler attached to the switch. calling @darkMode or @lightMode depending on the checked state.
   */
  function onToggleMode() {
    if (lightSwitch.checked) {
      darkMode();
    } else {
      lightMode();
    }
  }

  /**
   * @function getSystemDefaultTheme
   * @summary: get system default theme by media query
   */
  function getSystemDefaultTheme() {
    const darkThemeMq = window.matchMedia("(prefers-color-scheme: dark)");
    if (darkThemeMq.matches) {
      return "dark";
    }
    return "light";
  }

  function setup() {
    var settings = localStorage.getItem("light-switch");
    if (settings == null) {
      settings = getSystemDefaultTheme();
    }

    if (settings == "dark") {
      lightSwitch.checked = true;
    }

    lightSwitch.addEventListener("change", onToggleMode);
    onToggleMode();
  }

  setup();

})();
