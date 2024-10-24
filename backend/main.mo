import Hash "mo:base/Hash";
import HashMap "mo:base/HashMap";

import Map "mo:base/HashMap";
import Text "mo:base/Text";
import Iter "mo:base/Iter";

actor Translator {
    // Create stable storage for translations
    private stable var translationEntries : [(Text, Text)] = [
        ("hello", "hola"),
        ("world", "mundo"),
        ("good morning", "buenos días"),
        ("good afternoon", "buenas tardes"),
        ("good night", "buenas noches"),
        ("thank you", "gracias"),
        ("please", "por favor"),
        ("how are you", "cómo estás"),
        ("goodbye", "adiós"),
        ("friend", "amigo")
    ];

    private let translations = Map.HashMap<Text, Text>(10, Text.equal, Text.hash);

    // Initialize the HashMap with our translation pairs
    private func initTranslations() {
        for ((eng, spa) in translationEntries.vals()) {
            translations.put(eng, spa);
        }
    };

    // Call initialization on deployment
    initTranslations();

    // Query function to translate text
    public query func translate(text : Text) : async Text {
        let lowerText = Text.toLowercase(text);
        switch (translations.get(lowerText)) {
            case (null) { "Translation not found" };
            case (?translation) { translation };
        }
    };
}
