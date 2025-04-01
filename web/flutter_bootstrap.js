{{flutter_js}}
{{flutter_build_config}}

const loadingContainer = document.getElementById("loading-container");
const loadingText = document.getElementById("loading-text");

_flutter.loader.load({
  onEntrypointLoaded: async function (engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine();
    await appRunner.runApp();

    loadingContainer.classList.add("fade-out");

    loadingContainer.addEventListener("transitionend", function () {
      loadingContainer.remove();
    });
  },
});
