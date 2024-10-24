import { backend } from "declarations/backend";

const englishText = document.getElementById("englishText");
const translateBtn = document.getElementById("translateBtn");
const spanishText = document.getElementById("spanishText");

translateBtn.addEventListener("click", async () => {
    try {
        const text = englishText.value.trim();
        if (!text) {
            spanishText.textContent = "Please enter some text to translate";
            return;
        }

        spanishText.textContent = "Translating...";
        const translation = await backend.translate(text);
        spanishText.textContent = translation;
    } catch (error) {
        console.error("Translation error:", error);
        spanishText.textContent = "An error occurred during translation";
    }
});
